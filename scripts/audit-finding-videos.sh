#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"

if [[ ! -d "$ROOT" ]]; then
  echo "Usage: $0 [repo-root-or-evidence-root]" >&2
  exit 2
fi

cd "$ROOT"

printf '| Status | Report | Verdict | Findings/Limits | Evidence clips | Missing video evidence | Main video |\n'
printf '|---|---|---:|---:|---:|---:|---|\n'

find evidence -name TEST_REPORT.md | sort | while IFS= read -r report; do
  dir="${report%/*}"
  main_video="$dir/gameplay-recording.mp4"

  verdict="$(
    awk '
      BEGIN { found=0 }
      found == 0 && /^[[:space:]-]*Verdict[[:space:]]*:/ {
        line=$0
        sub(/^[[:space:]-]*Verdict[[:space:]]*:[[:space:]]*/, "", line)
        gsub(/\r/, "", line)
        print line
        found=1
      }
    ' "$report"
  )"
  [[ -n "$verdict" ]] || verdict="UNKNOWN"

  finding_count="$(
    awk '
      /^## Findings/ { in_scope=1; next }
      /^## Coverage Limitations/ { in_scope=1; next }
      /^## / && $0 !~ /^## Findings/ && $0 !~ /^## Coverage Limitations/ { in_scope=0 }
      in_scope && /^### / { count++ }
      END { print count + 0 }
    ' "$report"
  )"

  clip_count="$(grep -Eci '^[[:space:]-]*Evidence clip[[:space:]]*:' "$report" || true)"

  missing=0

  if (( finding_count > clip_count )); then
    missing=$((missing + finding_count - clip_count))
  fi

  if (( finding_count > 0 )); then
    while IFS= read -r line; do
      clip="${line#*:}"
      clip="${clip%%@*}"
      clip="${clip//\`/}"
      clip="$(printf '%s' "$clip" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"

      if [[ -z "$clip" || "$clip" == *"Needs Evidence Clip"* || "$clip" == *"Screenshot only"* ]]; then
        missing=$((missing + 1))
      elif [[ "$clip" == *"gameplay-recording.mp4"* ]]; then
        [[ -f "$main_video" ]] || missing=$((missing + 1))
      elif [[ "$clip" == http://* || "$clip" == https://* ]]; then
        # URL clips are accepted as explicit video references; availability is checked by browser/dashboard tooling.
        :
      elif [[ "$clip" == /* ]]; then
        [[ -f "$clip" ]] || missing=$((missing + 1))
      else
        [[ -f "$dir/$clip" ]] || missing=$((missing + 1))
      fi
    done < <(grep -Ei '^[[:space:]-]*Evidence clip[[:space:]]*:' "$report" || true)
  fi

  if grep -Eiq 'Evidence status[[:space:]]*:[[:space:]]*(Screenshot only|Needs Evidence Clip)' "$report"; then
    missing=$((missing + $(grep -Eic 'Evidence status[[:space:]]*:[[:space:]]*(Screenshot only|Needs Evidence Clip)' "$report" || true)))
  fi

  if [[ -f "$main_video" ]]; then
    video_cell='yes'
  else
    video_cell='missing'
    if (( finding_count > 0 )); then
      missing=$((missing + 1))
    fi
  fi

  if (( missing > 0 )); then
    status='NEEDS_VIDEO_EVIDENCE'
  elif (( finding_count > 0 )); then
    status='OK'
  else
    status='NO_FINDINGS'
  fi

  report_cell="[$report]($report)"
  if [[ "$video_cell" == "yes" ]]; then
    video_cell="[$main_video]($main_video)"
  fi

  printf '| %s | %s | %s | %s | %s | %s | %s |\n' \
    "$status" "$report_cell" "$verdict" "$finding_count" "$clip_count" "$missing" "$video_cell"
done

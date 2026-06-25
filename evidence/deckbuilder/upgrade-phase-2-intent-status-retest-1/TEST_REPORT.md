# TEST REPORT

## Game And Upgrade

Game: Turn-Based Deckbuilder / Ash Circuit
Attempt: Upgrade Phase 2 - Enemy Intent And Status Explainability - Retest 1
Verdict: PASS

## Test Inputs

- Hosted URL: http://127.0.0.1:8765/games/deckbuilder/index.html
- Manual URL: http://127.0.0.1:8765/games/deckbuilder/README.md
- Manual path: /Users/sarathmenon/Documents/game_hackathon/games/deckbuilder/README.md
- Browser surface: single shared Chrome window via browser-harness only
- Viewport used: 782 x 859 shared-window viewport
- Evidence folder: /Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/upgrade-phase-2-intent-status-retest-1/
- Recording: /Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/upgrade-phase-2-intent-status-retest-1/gameplay-recording.mp4
- Recording method: 48 clean browser-harness screenshots encoded at 3 FPS, 1564 x 1718 video frames, 16.0 seconds

## Summary

The prior blocker is fixed. With Focus 2 and Fractured cleared, Drive Plate visibly previewed 6 calculated damage plus 4 guard while Glass Warden had only 4 HP remaining, then resolved enemy HP to 0 and logged 6 damage plus 4 guard. Strike with Focus 2 and no Fractured also previewed and resolved 8 damage. Focus plus Fractured reduced attack damage by 2 once, cleared after the next attack, and later Focus-only attack/mixed-card math continued to include Focus.

The preserved explainability gates passed: active enemy intent chips, next-intent preview, Last enemy resolution chips, Focus/Fractured help, reward transition, and audio-off/reset behavior were all visible and consistent with the manual. Full encounter 2 final victory and defeat were not re-run because the retest target was already proven and the handoff allowed stopping once the fixed blocker was clearly pass/fail.

## Severity-Rated Findings

No blocking, major, or minor game defects found in this retest scope.

Low - Coverage limitation - Full encounter 2 final victory, defeat, and wider desktop responsive coverage were not re-run.

- Status: Accepted retest limitation.
- Repro steps: N/A.
- Expected behavior: The retest should prioritize the fixed Focus/Fractured calculated-damage blocker and preserved Phase 2 explainability gates.
- Actual behavior: Those targets were proven in clean evidence. Encounter 2 was entered for Strike 8 verification, but not completed to final victory.
- Evidence: `33-second-run-start-top.png` through `44-second-run-after-strike8-log.png`.

## Retest Checklist

| Check | Result | Evidence |
| --- | --- | --- |
| Hosted game loads | PASS | `01-title-first-load.png` |
| Manual math rules used as authority | PASS | Manual path above |
| Audio off by default/reset | PASS | `02-settings-open.png`, `03-settings-bottom-before-reset.png`, `04-settings-after-reset-defaults-audio-off.png` |
| Active intent chips visible before End Turn | PASS | `06-clean-run-start-top.png`, `17-after-static-hex-resolution-intent.png`, `27-turn4-last-resolution-intent.png` |
| Next-intent preview visible and deterministic | PASS | `11-after-lance-resolution-intent.png`, `17-after-static-hex-resolution-intent.png`, `27-turn4-last-resolution-intent.png` |
| Last enemy resolution shows action, guard, HP loss, status | PASS | `11-after-lance-resolution-intent.png`, `17-after-static-hex-resolution-intent.png`, `27-turn4-last-resolution-intent.png`, `47-second-run-turn3-fractured-intent-resolution.png` |
| Focus 2 + Fractured preview subtracts 2 | PASS | `18-turn3-focus2-fractured-strike-preview.png`, `20-turn3-focus2-fractured-heavy-preview.png` |
| Focus 2 + Fractured resolves once and clears | PASS | `21-turn3-after-strike-fractured-cleared-top.png`, `22-turn3-after-strike-log.png` |
| Focus-only math still includes Focus after Fractured clears | PASS | `23-turn3-focus-only-heavy-preview.png`, `24-turn3-after-heavy-focus-only-top.png`, `25-turn3-after-heavy-log.png` |
| Drive Plate fixed blocker: 6 calculated damage + 4 guard at enemy 4 HP | PASS | `29-turn4-drive-plate-focus-only-preview.png`, `31-after-drive-plate-victory-reward-top.png`, `32-after-drive-plate-reward-log.png` |
| Strike with Focus 2/no Fractured communicates and resolves 8 | PASS | `42-second-run-strike-focus-only-preview.png`, `43-second-run-after-strike8-top.png`, `44-second-run-after-strike8-log.png` |
| Preview, footer/chip, log, HP delta, and end state agree | PASS | `21` through `32`, `42` through `44` |
| Reward choice appears and encounter transition works | PASS | `31-after-drive-plate-victory-reward-top.png`, `32-after-drive-plate-reward-log.png`, `33-second-run-start-top.png` |
| Focus help visible by interaction | PASS | `50-focus-status-help-via-chip.png` |
| Fractured help visible by interaction | PASS | `51-fractured-status-help-via-chip.png` |
| No blocking runtime/provider/browser errors observed | PASS | Entire clean evidence sequence |

## State And Action Clarity Gate

PASS. Important state and consequences were understandable from normal play: player HP, guard, Focus, Fractured, energy, draw/hand/discard counts, active enemy intent, next enemy intent, Last enemy resolution, previews, card footers, combat log entries, reward choice, and encounter transition were visible and readable. The key fixed case no longer creates a contradiction between calculated card damage and remaining enemy HP.

## Discarded Evidence

The following screenshots are preserved but are not used to support the verdict and were excluded from the MP4:

- `05-current-after-settings-reset-recovery.png`: recovery frame after settings reset navigation.
- `48-focus-status-help-after-click.png`: missed-coordinate status-help attempt.
- `49-fractured-status-help-after-click.png`: missed-coordinate status-help attempt.

## Approval Statement

Approved for Upgrade Phase 2 retest scope. Verdict is PASS because the fixed Focus/Fractured calculated-damage blocker is verified, preserved intent/status explainability gates pass, required Markdown artifacts exist, and the MP4 evidence was produced.

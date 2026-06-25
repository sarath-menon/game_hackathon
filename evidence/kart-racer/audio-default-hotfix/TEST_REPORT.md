# Arcade Kart Racer - Audio Defaults Off / Explicit Opt-In Hotfix

Verdict: PENDING - BLOCKED BY OPERATIONAL CORRECTION

## Summary

Testing was stopped by orchestrator instruction after partial black-box hotfix observations were captured. No PASS verdict is issued.

The current operational policy supersedes this run: browser-harness testing for this project must use a single shared Chrome window with controlled tabs. This tester had already started an isolated Chrome profile for the hotfix QA attempt before the correction arrived. The isolated instance has now been stopped, and no further browser work was performed.

## Preserved Evidence

- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/audio-default-hotfix`
- Partial observation data: `hotfix-observations.json`
- Probe screenshots: `probes/`
- Partial MP4 recording: `gameplay-recording.mp4`
- Recording status: partial only; it stopped before the full reset/stale-state visual flow completed.

## Preliminary Observations Before Stop

These observations are not an approval verdict and must be retested under the shared-window harness policy:

- Fresh first-load settings showed `UI sounds` unchecked and `Volume` at `0%`.
- Start/driving before opt-in produced no recorded generated-audio events in the browser-side probe.
- Explicit opt-in by checking `UI sounds` and raising `Volume` to `70%` was possible.
- After opt-in, generated-audio events were observed from player actions.
- `Reset Defaults` restored `UI sounds` unchecked and `Volume` at `0%`.
- A black-box stale-storage simulation using the observed settings key with `sound: true` and `volume: 75` reloaded with `UI sounds` unchecked and `Volume` at `0%`.
- Short title/start/driving smoke check ran without recorded runtime errors in the observation probe.

## Findings

### OPS-001 - Test Environment Superseded

- Evidence clip: gameplay-recording.mp4 @ 00:00-00:08
- Evidence status: Main recording segment
- Why this evidence proves the finding: The partial recording shows only the superseded isolated-profile hotfix flow before the orchestrator stop, supporting the operational finding that this run cannot be used as shared-window approval evidence.
- Severity: High
- Status: Open / blocks verdict
- Repro steps: Start hotfix QA in an isolated Chrome profile, then receive the shared-window-only operational correction.
- Expected: Current project browser QA uses the single shared Chrome window with controlled tabs.
- Actual: This run used an isolated Chrome profile before the policy correction was received.
- Evidence: This report and preserved partial artifacts in the evidence folder.

## Audio-Default Approval Statement

Not approved in this run. Retest is required under the shared-window harness policy before PASS/FAIL can be issued.

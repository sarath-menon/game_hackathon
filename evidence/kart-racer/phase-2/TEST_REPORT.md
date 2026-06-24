# Arcade Kart Racer Phase 2 Second Retest Report

## Game and Phase

- Game: Arcade Kart Racer
- Phase: Phase 2, Race Rules retest after second builder fix
- Verdict: FAIL

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/kart-racer/index.html`
- README/manual: `http://127.0.0.1:8765/games/kart-racer/README.md`
- Browser: Chrome via browser-harness CDP automation
- Viewport observed: 1728x996 browser viewport

## Evidence

- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/phase-2/`
- Continuous recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/phase-2/gameplay-recording.mp4`
- Expected flow: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/phase-2/expected-flow.md`
- Recording method: browser canvas capture with `HTMLCanvasElement.captureStream(30)` and `MediaRecorder`, exported as WebM, then converted to MP4/H.264 with ffmpeg.
- Supporting screenshots: `second-retest-load.png`, `second-retest-probes/`, `second-retest-isolated-step-*.png`, `second-retest-isolated-final.png`, and `finish-probes/`.

## Summary

The second retest confirms meaningful progress. The HUD starts at `LAP 0/1`, the route is more readable from the start, and the opening bend now lets normal documented controls clear the checkpoint sequence. In the successful route probe, the HUD advanced from CP1 through CP2/CP3 to `NEXT Finish`; the isolated recorded run likewise reached `NEXT Finish` with the message `All checkpoints cleared. Cross the yellow finish gate.`

The phase still does not pass. After all checkpoints are cleared, the kart stops near the visible yellow finish gate with `SPEED 0`, `LAP 0/1`, and `NEXT Finish`. Multiple normal-control attempts from that state do not move the kart into the finish or trigger the race-complete screen. Therefore lap `1/1` and final-time completion remain unreachable.

No blocking runtime errors were observed through page-level `error` and `unhandledrejection` listeners during the recorded pass.

## Findings

### KART-P2-001: Checkpoint progression blocks after CP1

- Severity: High
- Status: Resolved
- Retest result: PASS
- Evidence: `second-retest-probes/left_bend-01.png`, `second-retest-isolated-step-00.png`, and `second-retest-isolated-step-01.png`
- Notes: CP1/CP2/CP3 now clear in order and the HUD reaches `NEXT Finish`.

### KART-P2-002: Scored lap completion and final-time screen remain unreachable

- Severity: High
- Status: Still open
- Retest result: FAIL
- Repro steps:
  1. Open the hosted game URL.
  2. Start the race with Space.
  3. Follow the visible opening bend using normal W/A/S/D controls until the HUD shows `NEXT Finish`.
  4. Attempt to cross the visible yellow finish gate using W/A/S/D and reverse controls.
- Expected behavior: Crossing the yellow finish gate after CP1, CP2, and CP3 completes lap `1/1` and shows the final race time.
- Actual behavior: The kart remains stopped near the visible yellow finish gate with `NEXT Finish`; lap stays `0/1`, and no race-complete final-time screen appears.
- Evidence: `gameplay-recording.mp4`, `second-retest-isolated-final.png`, and `finish-probes/finish-*.png`.

### KART-P2-003: Lap counter starts at 1/1 before race completion

- Severity: Medium
- Status: Resolved
- Retest result: PASS
- Evidence: `second-retest-load.png` and `second-retest-isolated-01-started.png`
- Notes: The HUD starts at `LAP 0/1`, matching the README/manual.

## Regression Checklist

- Hosted game loads: PASS
- README/manual is reachable and matches intended Phase 2 behavior: PASS
- Phase 1 start flow is preserved: PASS
- Phase 1 driving/camera behavior is preserved enough for route attempts: PASS
- Boundary/off-track constraint remains visible: PASS
- Route readability/orientation improved for CP1 -> CP2 -> CP3: PASS
- Lap/progress wording starts at `0/1`: PASS
- CP1 reachable and clearable: PASS
- CP2 reachable and clearable after CP1: PASS
- CP3 reachable and clearable after CP2: PASS
- HUD advances CP1 -> CP2 -> CP3 -> finish: PASS
- Finish/lap progress locked until checkpoints are cleared: PASS
- Wrong-order or early-finish validation: previously observed and still implied by locked finish flow, not fully re-exercised after the remaining finish blocker
- Race timer runs: PASS
- Completion screen reports final time plus lap/race completion: FAIL
- No blocking console/runtime errors observed: PASS
- Required evidence files exist: PASS

## Approval Statement

Arcade Kart Racer Phase 2 is not approved. The checkpoint-route fix is successful, but the final yellow finish gate still cannot be scored after all checkpoints are cleared, so lap `1/1` and the final-time race-complete screen remain blocked.

# Arcade Kart Racer Phase 1 Test Report

## Game and Phase

- Game: Arcade Kart Racer
- Phase: Phase 1, Basic Drivable Track
- Verdict: FAIL

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/kart-racer/index.html`
- README/manual: `http://127.0.0.1:8765/games/kart-racer/README.md`
- Browser: Chrome via browser-harness CDP automation
- Viewports observed: 1200x953 primary browser viewport; one later probe used the active Chrome viewport after tab reactivation

## Evidence

- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/phase-1/`
- Continuous recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/phase-1/gameplay-recording.mp4`
- Expected flow: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/phase-1/expected-flow.md`
- Recording method: browser canvas capture with `HTMLCanvasElement.captureStream(30)` and `MediaRecorder`, exported as WebM, then converted to MP4/H.264 with ffmpeg.

## Summary

The hosted game loads and presents the expected title/start flow. The manual matches the visible controls and objective. Keyboard input starts the race, acceleration increases the speed readout, braking/reverse input is accepted, steering changes the kart route, and the boundary/off-track constraint visibly keeps the kart near the road edge with speed loss.

The phase does not pass because the finish-complete state was not reached or demonstrated. Multiple black-box driving attempts reached and recovered around the track/boundary area, but the visible state remained the in-race objective HUD with `SPEED 0`; no completion screen appeared in the continuous evidence recording or follow-up probes.

## Findings

### KART-P1-001: Finish-complete state not demonstrated

- Severity: High
- Status: Open
- Repro steps:
  1. Open the hosted game URL.
  2. Start the race with Space.
  3. Drive using W/A/S/D around the visible loop and toward the yellow finish gate.
  4. Observe the HUD after the extended finish attempt.
- Expected behavior: Crossing the yellow finish gate should show the finish-complete screen described by the README/manual.
- Actual behavior: The game remains in the in-race objective HUD and no finish-complete screen appears in the recorded run.
- Evidence: `gameplay-recording.mp4`, `recording-loop-9.png`, and `finishprobe/` screenshots.

## Regression Checklist

- Hosted game loads: PASS
- README/manual is reachable and matches visible controls/objective: PASS
- Start flow works: PASS
- Kart acceleration works: PASS
- Brake/reverse input accepted: PASS
- Steering works: PASS
- Camera/readability: PASS
- Track boundary/off-track constraint works: PASS
- Finish line/gate visible: PASS
- Finish line reachable and race-complete state triggers: FAIL
- No blocking console/runtime errors observed during the game load and recorded pass: PASS
- Required evidence files exist: PASS

## Approval Statement

Arcade Kart Racer Phase 1 is not approved. The phase should remain in builder-fix state until a black-box pass can demonstrate the yellow finish gate is reachable and crossing it triggers the finish-complete screen.

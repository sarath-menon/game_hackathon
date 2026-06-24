# Arcade Kart Racer Phase 1 Retest Report

## Game and Phase

- Game: Arcade Kart Racer
- Phase: Phase 1, Basic Drivable Track retest after builder fix
- Verdict: PASS

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/kart-racer/index.html`
- README/manual: `http://127.0.0.1:8765/games/kart-racer/README.md`
- Browser: Chrome via browser-harness CDP automation
- Viewport observed: 1728x996 browser viewport

## Evidence

- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/phase-1/`
- Continuous recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/phase-1/gameplay-recording.mp4`
- Expected flow: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/phase-1/expected-flow.md`
- Recording method: browser canvas capture with `HTMLCanvasElement.captureStream(30)` and `MediaRecorder`, exported as WebM, then converted to MP4/H.264 with ffmpeg.
- Supporting screenshots: `retest-00-title.png`, `retest-01-started.png`, `retest-02-accelerate.png`, `retest-03-brake.png`, `retest-complete.png`, `retest-boundary-approach.png`, `retest-boundary-or-finish.png`

## Summary

The retest passes. The hosted game loads at the provided URL with one playable canvas, and the README/manual matches the visible objective, controls, track rules, and win behavior. Space starts the race from the title screen. W accelerates, S brakes, A/D steering changes the route, and the camera remains readable as the kart approaches the finish gate.

The previous blocker is resolved: normal keyboard play reaches the yellow finish gate, and entering it triggers the visible `Finish Crossed` completion screen. A separate boundary-focused probe kept the kart constrained by the visible guard rail/track edge and did not produce runtime errors.

No blocking console/runtime errors were observed through page-level `error` and `unhandledrejection` listeners during the recorded pass or the boundary probe.

## Findings

No open critical or high-priority findings.

### KART-P1-001: Finish-complete state not demonstrated

- Severity: High
- Status: Resolved
- Retest result: PASS
- Evidence: `gameplay-recording.mp4` and `retest-complete.png`
- Notes: The retest reached the yellow finish gate through normal W/D driving and displayed `Finish Crossed` with the message `The Phase 1 run is complete. Reload the page to drive again.`

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
- Finish line reachable and race-complete state triggers: PASS
- No blocking console/runtime errors observed: PASS
- Required evidence files exist: PASS

## Approval Statement

Arcade Kart Racer Phase 1 is approved from black-box testing. The required report, expected-flow document, and fresh continuous MP4 evidence are complete, and the prior finish-completion blocker is resolved.

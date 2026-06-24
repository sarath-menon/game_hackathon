# Signal Runner Test Report

## Current milestone

Milestone 1: Skeleton Playable

## Verdict

PASS

## Test inputs

- Game URL: http://127.0.0.1:8765/index.html
- README/manual: http://127.0.0.1:8765/README.md and `/Users/sarathmenon/Documents/game_hackathon/README.md`
- Browser: Google Chrome 149.0.7827.115, controlled through browser-harness via CDP
- Viewport: 1200 x 953
- Automation notes: browser-harness agent helper was used to send black-box keyboard input with correct `key`, `code`, and virtual-key fields for Arrow keys and WASD.

## Evidence

- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/milestone-1/`
- Gameplay screen recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/milestone-1/gameplay-recording.mp4`
- Expected-flow description: `/Users/sarathmenon/Documents/game_hackathon/evidence/milestone-1/expected-flow.md`
- Recording method: injected browser-page recording helper using `HTMLCanvasElement.captureStream(30)` and `MediaRecorder` (`video/webm;codecs=vp9`), while gameplay input was driven through browser-harness/CDP keyboard events; the resulting WebM was transcoded to MP4/H.264.
- Recording verification: exported video decoded to one-frame-per-second verification frames; the final extracted frame shows the courier at **Dock 01** in the delivered/game-complete canvas state.

## Summary

Milestone 1 passes. The hosted game loads, presents a title/start screen, starts from the **Start Run** control, accepts README-documented movement controls, constrains the courier within the play area, shows a visible yellow **Dock 01** target, allows the target to be reached by navigating around the visible walls, and triggers the delivered/win state on contact with the dock. Smooth canvas-capture evidence was produced successfully in the Milestone 1 evidence folder.

## Findings

No unresolved findings.

## Regression checklist

- Game loads: PASS
- Title/start screen appears: PASS
- **Start Run** begins gameplay: PASS
- Arrow-key movement works: PASS
- `W`, `A`, `S`, `D` movement works: PASS
- Wall layout is visible during play: PASS
- Boundary collision prevents leaving the play area: PASS
- Delivery target **Dock 01** is visible: PASS
- Delivery target **Dock 01** is reachable: PASS
- Win condition triggers correctly: PASS
- Win state displays delivered feedback: PASS
- README/manual behavior matches tested Milestone 1 behavior: PASS

## Approval statement

Milestone 1 is approved. The skeleton playable matches the README/manual with no blocking issues found.

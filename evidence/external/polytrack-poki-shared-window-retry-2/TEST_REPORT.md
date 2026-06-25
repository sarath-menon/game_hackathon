# PolyTrack - Poki Provider Shared-Window Retry 2

Verdict: PASS_WITH_FINDINGS

## Test Inputs

- Attempted URL: https://poki.com/en/g/polytrack
- Observed provider URL after redirect: https://poki.com/id/g/polytrack
- Player manual: /Users/sarathmenon/Documents/game_hackathon/external-qa/polytrack-poki/README.md
- Browser: shared Chrome window controlled through browser-harness only.
- Viewport: approximately 1519 x 981 CSS pixels.
- Evidence folder: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-poki-shared-window-retry-2
- Recording: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-poki-shared-window-retry-2/gameplay-recording.mp4
- Expected/observed flow: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-poki-shared-window-retry-2/expected-flow.md
- Observation data: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-poki-shared-window-retry-2/run-observations.json
- Recording method: browser-harness screenshot stream from the shared Chrome tab, 212 frames encoded at 10 FPS.

## Summary

PolyTrack on Poki is playable in the shared-window harness after duplicate PolyTrack tabs are closed and the visible Play flow is targeted carefully. The provider loaded, the embedded game menu appeared, track selection was reachable, a drivable track started, W/arrow driving controls worked, route and HUD were readable from the race start, timer feedback appeared, and R/T reset behavior returned the car to the start.

Settings/options were partially verified: the in-game Settings panel exposed language, units, reset hint, ghost car, default camera, cockpit camera mode, checkpoint placement, reset, cancel, and apply. The game also showed `Music: On` and a fullscreen icon. No crashes, WebGL errors, severe stalls, or blocking provider shell issues were observed during the tested flow.

## Provider / Environment Classification

- Not `BLOCKED_PROVIDER`: Poki loaded, redirected, and embedded the game successfully.
- Not `BLOCKED_ENVIRONMENT`: the shared Chrome/browser-harness setup reached the menu, track selection, and a drivable track.
- Not `FAIL`: no blocking game defect was found in the evaluated core flow.
- Final classification is `PASS_WITH_FINDINGS` due nonblocking usability/localization and incomplete settings persistence coverage.

## Findings

### LOW - Provider redirects `/en/` URL to localized Indonesian shell

- Status: Open
- Repro steps: Open `https://poki.com/en/g/polytrack` in the shared browser.
- Expected behavior: The provider shell would stay in English or clearly preserve the requested `/en/` locale.
- Actual behavior: The URL redirected to `https://poki.com/id/g/polytrack`, and provider text was Indonesian. The game UI itself remained readable in English after load.
- Evidence: `01-provider-loaded.png`, `02-main-menu-visible.png`.
- Evidence clip: `gameplay-recording.mp4 @ 00:00-00:02`
- Evidence status: Clip available.
- Why this evidence proves the finding: The recording opens on the localized Poki provider shell around the embedded game before the English PolyTrack menu becomes visible.

### LOW - Settings coverage is partial for audio/graphics/persistence

- Status: Open
- Repro steps: Open PolyTrack menu, enter Settings, inspect visible controls.
- Expected behavior: External QA ideally verifies all visible options, including persistence after reload where practical.
- Actual behavior: Core settings were visible and readable, but this pass did not fully verify settings persistence, graphics/quality controls, or audio behavior beyond the visible `Music: On` control.
- Evidence: `07-after-w-accelerate.png`, `17-before-targeted-cancel.png`.
- Evidence clip: `gameplay-recording.mp4 @ 00:03-00:08`
- Evidence status: Clip available.
- Why this evidence proves the finding: The clip shows the Settings panel and visible menu controls, enough to confirm partial settings reachability while also showing that deeper persistence, graphics-quality, and audio-behavior checks were not completed in this pass.

### LOW - Pause state was not visibly confirmed

- Status: Open
- Repro steps: Start a track and press Space.
- Expected behavior: If Space is intended to pause, a visible pause state or menu should make the result clear.
- Actual behavior: The sampled frame after Space did not show a clear pause overlay. This did not block driving/reset checks.
- Evidence: `37-track-space-pause.png`.
- Evidence clip: `gameplay-recording.mp4 @ 00:19-00:21`
- Evidence status: Clip available.
- Why this evidence proves the finding: The late-race segment shows driving/reset coverage followed by the sampled Space state, but no clear pause overlay or explicit paused label appears before the recording ends.

## QA Checklist

- Provider URL reachable: PASS.
- Duplicate tab cleanup before run: PASS.
- Game iframe visible: PASS.
- In-game main menu reachable: PASS.
- Visible Play/menu target used: PASS.
- Track selection reachable: PASS.
- Drivable track reachable: PASS.
- Keyboard focus/driving controls: PASS. W, W+A, and ArrowUp+ArrowRight moved/steered the car.
- Route/camera readability from start: PASS. Road, car, forward route, and track boundaries were visible.
- Timer/run feedback: PASS. Timer advanced during driving.
- Restart/reset behavior: PASS. R and T returned to start/timer reset states.
- Settings/options reachable: PARTIAL PASS.
- Performance: PASS with limited duration. No obvious crash, stall, or WebGL failure.
- Provider shell clarity: PASS with localization finding.

## Approval Statement

Approved as `PASS_WITH_FINDINGS`. PolyTrack on Poki is playable enough in the shared-window harness for core QA: menu, track selection, driving, HUD/timer, route readability, and reset behavior were verified. Remaining issues are nonblocking and should inform deeper future settings/accessibility passes.

## QA Methodology Carry-Forward

- For canvas menus, derive click targets from the visible tile layout and re-screenshot after each click; do not use canvas center as a generic Play target.
- For external games with duplicate-instance protection, close clearly matching provider/game tabs before a clean run.
- When a Play flow leads to track selection, treat the track selection Play button as a second required target and capture it explicitly.
- Keep provider-language issues separate from game UI issues; localized provider shell text may not block gameplay if game UI remains readable.

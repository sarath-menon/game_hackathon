# PolyTrack Itch.io External QA Report

Game: PolyTrack

Attempt: Retry 1, official Itch.io provider path

Verdict: `BLOCKED_ENVIRONMENT`

Date: 2026-06-25

## Test Inputs

- Game URL: https://kodub.itch.io/polytrack
- Manual: /Users/sarathmenon/Documents/game_hackathon/external-qa/polytrack-itch/README.md
- Browser automation: browser-harness remote Chromium
- Viewport tested: 1512 x 736 CSS pixels
- Observed embedded game iframe after `Run game`: `https://html-classic.itch.zone/html/17754954/index.html?v=1782203181`

## Evidence

- Evidence folder: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-itch/
- Test report: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-itch/TEST_REPORT.md
- Expected flow: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-itch/expected-flow.md
- Continuous recording: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-itch/gameplay-recording.mp4
- Screenshots:
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-itch/itch-page-initial.png
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-itch/after-run-click.png
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-itch/after-ok.png
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-itch/after-reset-settings.png
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-itch/after-reload.png
- Recording method: browser-harness screenshots assembled into a 10-second MP4 at 30 FPS. The recording documents the provider page, iframe launch, startup error, and recovery attempt.

## Summary

The official Itch.io provider page loaded correctly and exposed a visible `Run game` button. Clicking it opened the expected embedded Itch.io HTML frame. The provider shell itself did not block access.

The game could not be evaluated because the browser-harness remote Chromium environment produced a hardware-acceleration warning and PolyTrack failed inside the frame before reaching a playable menu or track. The visible startup error was:

`Uncaught TypeError: Cannot read properties of undefined (reading 'autoReset')`

The error source shown in the game frame was:

`https://html-classic.itch.zone/html/17754954/main.bundle.js`, line 20, column 316202.

Visible recovery controls were attempted: `OK`, `Reset Settings`, and `Reload`. They did not restore access to gameplay.

## Findings

### E0 - Browser-Harness Remote Environment Blocks Playable Evaluation

- Severity: Blocker
- Status: Open for this environment
- Classification: `BLOCKED_ENVIRONMENT`
- Repro steps:
  1. Open https://kodub.itch.io/polytrack in browser-harness remote Chromium.
  2. Click `Run game`.
  3. Wait for the embedded game frame.
- Expected behavior: The game frame should reach a playable menu or track.
- Actual behavior: The frame displays a hardware acceleration warning and an uncaught startup exception before gameplay.
- Evidence: `gameplay-recording.mp4`, `after-run-click.png`
- Evidence clip: `gameplay-recording.mp4 @ 00:00-00:04`
- Evidence status: Clip available.
- Why this evidence proves the finding: The recording starts with the Itch page/frame launch and then shows the PolyTrack frame reaching the hardware-acceleration warning plus uncaught startup exception instead of a playable menu or track.
- Impact: Gameplay, controls, route readability, restart, settings, performance, and fullscreen QA cannot be completed in this environment.

### E1 - In-Frame Recovery Controls Do Not Restore Play In This Environment

- Severity: High within blocked environment
- Status: Open for this environment
- Classification: Environment-blocked recovery
- Repro steps:
  1. From the startup error state, click `OK`.
  2. Click `Reset Settings`.
  3. Click `Reload`.
- Expected behavior: The game either recovers to menu/play or presents a clear unsupported-environment state.
- Actual behavior: The frame remains blocked or reloads back to the same startup error state.
- Evidence: `after-ok.png`, `after-reset-settings.png`, `after-reload.png`, `gameplay-recording.mp4`
- Evidence clip: `gameplay-recording.mp4 @ 00:04-00:09`
- Evidence status: Clip available.
- Why this evidence proves the finding: The recording shows the error state continuing through the recovery-control sequence and ending back on the same startup-error screen rather than gameplay.
- Impact: Recovery controls do not allow black-box QA to proceed in the remote harness browser.

## Load / Accessibility

Result: `PARTIAL`

The Itch.io page is reachable, readable, and exposes `Run game`. The game iframe is created and visible. Accessibility and keyboard focus inside the actual game cannot be judged because the game does not reach a playable state.

## Controls / Focus

Result: `BLOCKED`

The manual controls (`WASD`, arrow keys, `R`, `Enter`) could not be evaluated because no playable car or menu was reached.

## Settings / Options

Result: `BLOCKED`

Only error-screen controls were reachable: `OK`, `Reload`, `Close`, and `Reset Settings`. Fullscreen/audio/graphics/control/editor/quality options could not be evaluated.

## Restart / Reset

Result: `BLOCKED`

The documented run restart controls (`R` or `Enter`) could not be evaluated. Error-screen `Reset Settings` and `Reload` were attempted and did not reach play.

## Route / Readability

Result: `BLOCKED`

No playable track, car, route, timing UI, or start camera was reached. The route/readability gate cannot pass or fail as game design QA; it is blocked by the environment-level startup failure.

## Performance

Result: `BLOCKED`

The frame explicitly reports disabled hardware acceleration. Gameplay performance cannot be evaluated because gameplay does not start.

## Responsive / Fullscreen

Result: `BLOCKED`

The Itch.io shell fit in the tested viewport and the iframe was visible. Fullscreen behavior and responsive gameplay behavior could not be evaluated after the startup error.

## Verdict Rationale

This is not a final game `FAIL` because the game never reached a playable/evaluable state. It is not `BLOCKED_PROVIDER` because the official Itch.io provider page loaded, the `Run game` button worked, and the embedded game iframe appeared. The blocker is the browser/WebGL/hardware-acceleration environment used by the remote harness.

## Next Retry Path

Retry the same official Itch.io URL, https://kodub.itch.io/polytrack, in a hardware-accelerated browser-harness environment. The most direct next attempt is local Chrome with browser-harness remote debugging permission enabled in `chrome://inspect/#remote-debugging`; alternatively use a browser-harness/Browser Use cloud profile that provides hardware acceleration/WebGL support. The provider path itself should remain the first retry target because it successfully exposed the game iframe.

## Limitations

This test used only the provided URL and manual. No implementation, source files, unrelated research notes, old reports, old evidence, or other tester work were inspected for gameplay information. The hosted game was not modified.

## Approval Statement

Not approved for gameplay QA completion. Retry is required in a hardware-accelerated browser environment before issuing `PASS_WITH_FINDINGS` or `FAIL` on PolyTrack gameplay quality.

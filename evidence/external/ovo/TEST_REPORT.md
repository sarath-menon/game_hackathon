# External Browser Game QA Report: OvO

## Verdict

BLOCKED_PROVIDER

## Test Inputs

- Game: OvO
- Game URL: https://www.crazygames.com/game/ovo
- Manual: /Users/sarathmenon/Documents/game_hackathon/external-qa/ovo/README.md
- Evidence folder: /Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo/
- Browser: Browser Use cloud browser via browser-harness, Chrome 148 on Windows 10 user agent
- Viewports checked:
  - Desktop: 1536 x 608 viewport reported by browser-harness
  - Narrow/mobile spot check attempted with device metrics override; saved screenshot remained in portal layout but preserved the same launch-blocked game state
- Test date: 2026-06-25

## Evidence

- Continuous recording: /Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo/gameplay-recording.mp4
- Expected flow: /Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo/expected-flow.md
- Key screenshots:
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo/initial-load.png
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo/remote-after-load.png
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo/load-tick-1.png
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo/load-tick-2.png
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo/load-tick-3.png
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo/load-tick-4.png
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo/direct-frame-load.png
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo/final-load-state.png
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo/mobile-load-state.png
- Recording method: browser-harness viewport screenshots captured at approximately one-second intervals from the hosted game surface, encoded with ffmpeg to H.264 MP4 at 10 fps playback with duplicated frames to preserve a 60-second duration.

## Summary

OvO did not reach an interactive gameplay state through the tested provider path. The CrazyGames page loaded, but the embedded game remained on the OvO loading screen with a partially filled progress bar. Clicking/focusing the game area and waiting through repeated timed checkpoints did not advance to the menu or playable level. Opening the embedded hosted game frame directly reproduced the same loading state.

Because the launch path is blocked before player control, controls, movement, restart/reset, settings/options, remapping, level readability, performance under gameplay, and completion behavior could not be validated. This is not a final game-quality `FAIL`; it is a provider/startup blocker that requires alternate URL/provider retries under the external QA protocol.

## Findings

### OVO-001: Game remains stuck on loading screen before player control

- Severity: Critical
- Status: Open
- Area: Load/accessibility
- Repro steps:
  1. Open https://www.crazygames.com/game/ovo.
  2. Wait for the CrazyGames portal and embedded game area to load.
  3. Click the game area to focus it.
  4. Continue waiting through multiple timed checkpoints.
  5. Open the embedded hosted frame directly and repeat the wait.
- Expected behavior: The game should finish loading and present a start menu, level, controls prompt, consent prompt, or actionable error message.
- Actual behavior: The game remains on a black loading screen with the OvO logo and a blue progress bar. No menu, control prompt, actionable error, or playable state appears.
- Evidence:
  - `load-tick-1.png` through `load-tick-4.png`
  - `direct-frame-load.png`
  - `final-load-state.png`
  - `gameplay-recording.mp4`
- Notes: The CrazyGames shell also emitted an `adblock-detected` telemetry event during resource inspection, but the visible user-facing result was only an indefinite loader. I am treating the player-facing defect as the blocked launch, not assigning root cause.

### OVO-002: No player-facing error or recovery path when loading stalls

- Severity: High
- Status: Open
- Area: Load/error handling/readability
- Repro steps:
  1. Trigger the stuck load state from OVO-001.
  2. Observe the game area and surrounding CrazyGames controls.
- Expected behavior: If the game cannot load, the player should receive a visible error, retry option, browser requirement, network/ad-block guidance, or other recovery path.
- Actual behavior: The game continues to show only the loading logo/progress bar. There is no visible explanation or recovery action.
- Evidence:
  - `final-load-state.png`
  - `gameplay-recording.mp4`

## Settings / Options QA

Result: Blocked.

The game never reached a start menu or gameplay state, so I could not verify whether settings, options, control remapping, mode selection, audio, fullscreen-specific behavior, or difficulty/mode controls exist. CrazyGames shell-level buttons were visible, but in-game settings/options were not reachable.

## Controls / Focus QA

Result: Blocked.

The game frame accepted a click/focus attempt, but no playable state appeared afterward. Keyboard movement, jump, slide/crouch, restart, and menu navigation could not be verified.

## Restart / Reset QA

Result: Blocked.

No level, failure state, pause menu, or reset/restart control was reachable.

## Movement / Readability QA

Result: BLOCKED_PROVIDER.

The playable platforming route could not be evaluated because launch never completed. The blocking classification is load/accessibility, not movement mechanics or route readability.

## Performance QA

Result: Blocked for gameplay performance.

The portal remained responsive enough for screenshots, but game performance cannot be judged from the loader. The loader itself remained active without reaching the game.

## Responsive / Fullscreen QA

Result: Partially blocked.

The portal and game embed remained visible in the checked desktop layout. A narrow/responsive spot check still showed the same loading state, so responsive gameplay and fullscreen-specific behavior could not be verified.

## Regression Checklist

- Page URL loads without an authentication wall: PASS
- CrazyGames portal shell renders: PASS
- Embedded game frame is present: PASS
- Game reaches interactive menu or level: BLOCKED_PROVIDER
- Focus/click allows keyboard gameplay: BLOCKED
- Movement controls respond: BLOCKED
- Jump/slide/restart behavior: BLOCKED
- Hazards and goal readability: BLOCKED
- Settings/options discoverability and persistence: BLOCKED
- Responsive gameplay: BLOCKED
- Fullscreen gameplay: BLOCKED
- Completion path: BLOCKED

## Limitations

- I used only the provided URL and manual as gameplay inputs.
- I did not inspect game source or implementation files.
- I inspected the page's visible iframe URL and resource state only to determine whether the hosted playable surface could be reached directly after the CrazyGames shell stalled.
- Since the hosted game never became playable, all in-game behavior remains untested after the launch blocker.
- The orchestrator must retry with at least two alternate reputable/direct playable URLs or provider paths before assigning any final untestable status.

## Approval Statement

Not approved for gameplay QA yet. Current status is `BLOCKED_PROVIDER`, not final `FAIL`, because this provider path never reached an interactive OvO game state. A retry with alternate reputable/direct URLs is required before the game can be judged or marked untestable in the current environment.

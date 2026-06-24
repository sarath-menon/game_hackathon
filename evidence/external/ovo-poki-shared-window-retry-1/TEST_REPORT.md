# OvO Classic - Poki Provider Shared-Window Retry 1

## Verdict

`PASS_WITH_FINDINGS`

## Test Inputs

- Game URL attempted: `https://poki.com/en/g/ovo-classic`
- Observed final page URL: `https://poki.com/id/g/ovo-classic`
- Player manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/ovo-poki/README.md`
- Browser: shared Chrome window through browser-harness only
- Viewport: approximately 1519 x 981 browser viewport
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo-poki-shared-window-retry-1`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo-poki-shared-window-retry-1/gameplay-recording.mp4`
- Recording method: browser-harness screenshot/frame capture encoded to MP4 at 10 FPS from 64 frames

## Provider / Environment Classification

This attempt is not `BLOCKED_PROVIDER`: the Poki page loaded, the OvO Classic game iframe became visible, the main menu was interactive, and a playable level was reached.

This attempt is not `BLOCKED_ENVIRONMENT`: the shared-window browser-harness could focus the game surface and drive keyboard controls for movement, jump, slide/progression, reset, and pause.

This attempt is not `FAIL`: no blocking functional, usability, performance, or provider-shell failure was observed in the tested core path. The remaining issues are coverage limitations or nonblocking usability observations.

## Summary

OvO Classic on Poki was playable in the shared Chrome/browser-harness setup. The test reached the visible OvO menu, started Level 1, verified movement, jumping, slide/progression, route readability, timer feedback, reset, and pause/menu recovery. The game UI and level geometry were readable, and performance appeared stable during the short pass.

The pass carries nonblocking findings: the provider localized the outer shell to Indonesian after opening the English URL, settings/options coverage was shallow, and the test reached the finish area without fully proving the next-level transition after crossing the finish.

## Severity-Rated Findings

### Low - Provider Shell Localizes Away From Requested English URL

- Status: Open, nonblocking
- Repro steps: Open `https://poki.com/en/g/ovo-classic` in the shared Chrome window.
- Expected behavior: The provider shell remains in English or clearly matches the requested `/en/` locale.
- Actual behavior: The page redirected to `https://poki.com/id/g/ovo-classic` and showed Indonesian provider-shell text. The in-game OvO UI remained English and readable.
- Evidence: `01-provider-loaded.png`, `02-iframe-visible-after-wait.png`, `run-observations.json`

### Low - Settings / Options Behavior Only Partially Covered

- Status: Open, nonblocking coverage limitation
- Repro steps: Load the game menu and inspect visible controls.
- Expected behavior: Any settings/options/audio/fullscreen/skins/modes reachable from visible UI should be checkable where practical.
- Actual behavior: Menu entry points for language/skins/trophy/settings-style icons and provider fullscreen were visible, but audio, persistence, and fullscreen behavior were not deeply exercised in this pass because the priority was reaching playable platforming and verifying core controls.
- Evidence: `02-iframe-visible-after-wait.png`

### Low - Level Completion Transition Not Fully Verified

- Status: Open, nonblocking coverage limitation
- Repro steps: Start Level 1 and progress right using movement/jump/slide inputs.
- Expected behavior: Reaching the finish flag completes or advances the level.
- Actual behavior: The player reached a readable finish area with the finish flag and "This is the end of the level" text visible, but the pass did not fully capture a post-finish completion or next-level transition.
- Evidence: `09-after-right-down-slide.png`

## QA Checklist

- Provider page reaches game iframe: PASS
- Interactive menu reachable: PASS
- Game frame focus workable: PASS
- Playable level reachable: PASS
- Left/right movement: PASS
- Jump with `Space`: PASS
- Slide/progression with `Down`: PASS
- Timer/run feedback visible: PASS
- Player, platforms, route, prompts, and finish area readable: PASS
- Reset/restart reachable: PASS
- Pause/menu recovery reachable: PASS
- Death/fail behavior: NOT COVERED
- Full level completion/advance: PARTIAL
- Settings/options/audio/fullscreen/skins/modes: PARTIAL
- Performance during short pass: PASS, no visible stalls or crashes
- Blocking console/runtime errors: None observed through black-box run

## Settings / Options Result

The main menu exposed visible settings-adjacent controls, including language selection, skins/random skin, trophy-style icon, settings-style icon, and provider fullscreen. These controls were visually reachable. Behavior for audio, persistence, and fullscreen was not fully exercised in this run, so settings coverage is partial rather than blocking.

## Usability / Accessibility Assessment

PASS for the tested platforming path. The player avatar, white background, black platforms, timer, tutorial text, movement prompt, reset/pause icons, and finish flag were readable from normal play. Keyboard focus required clicking/focusing the game frame, which is consistent with the manual. The provider shell language mismatch may affect shell discoverability for English-only players, but the game UI itself remained understandable.

## Performance Assessment

The short captured pass showed stable rendering and responsive input. No visible WebGL/canvas crash, load failure, major frame stall, or input lag was observed.

## QA Methodology Carry-Forward

- For external platformers, confirm the real game iframe and then focus/click the game surface before judging keyboard input.
- Use visible menu targets and tutorial prompts instead of assumed canvas-center actions.
- Capture route-readability frames at the start, mid-route, and finish area so platform, hazard, prompt, and goal clarity can be reviewed afterward.
- Separate provider-shell localization issues from in-game usability, especially when the assigned URL redirects by region.
- Future platformer passes should explicitly capture finish-flag crossing and next-level/complete transition when the route reaches the goal.

## Approval / Retry Statement

Approved as `PASS_WITH_FINDINGS` for this Poki provider attempt. The game was playable and testable in the shared-window browser-harness environment. A deeper follow-up may target full level completion, death/hazard behavior, and detailed settings/options behavior, but no provider or environment retry is required for basic playability.

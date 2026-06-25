# PolyTrack - Poki Provider Shared-Window Retry 1

Verdict: BLOCKED_ENVIRONMENT

## Test Inputs

- Attempted URL: https://poki.com/en/g/polytrack
- Observed provider URL after redirect: https://poki.com/id/g/polytrack
- Player manual: /Users/sarathmenon/Documents/game_hackathon/external-qa/polytrack-poki/README.md
- Browser: shared Chrome window controlled through browser-harness only.
- Viewport: approximately 1519 x 981 CSS pixels.
- Evidence folder: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-poki-shared-window-retry-1
- Recording: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-poki-shared-window-retry-1/gameplay-recording.mp4
- Expected/observed flow: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-poki-shared-window-retry-1/expected-flow.md
- Observation data: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-poki-shared-window-retry-1/run-observations.json
- Recording method: browser-harness screenshot stream from the shared Chrome tab, 141 frames encoded at 10 FPS.

## Evidence Hygiene

Earlier partial attempts were discarded after stale-tab and duplicate-instance contamination were detected. Duplicate PolyTrack/Poki tabs created by the retry were closed, and the final folder was overwritten with a clean single Poki tab run. This verdict uses only the final clean evidence sequence now present in this folder.

## Summary

The Poki provider no longer blocks at startup. The page loads, redirects to the localized Poki route, exposes a large `games.poki.com` iframe, and reaches PolyTrack's in-game menu. The menu and settings screen are readable, and the visible Settings panel exposes language, unit, camera, checkpoint, ghost-car, reset-hint, reset, cancel, and apply controls.

The run is still not acceptable as a gameplay QA pass because the clean shared-window harness did not enter a drivable track. The first game-surface click opened Settings instead of Play, and the later recovery clicks did not dismiss Settings or reach a race before the follow-up instruction asked to finish from the current evidence. As a result, keyboard focus, driving controls, route/camera readability from a race start, timer feedback, and restart/reset behavior could not be verified.

## Classification Rationale

- Not `BLOCKED_PROVIDER`: the Poki page loaded and PolyTrack reached its own menu/settings UI.
- Not `FAIL`: the game was not tested deeply enough to show a game-quality failure.
- `BLOCKED_ENVIRONMENT`: the remaining blocker is shared-window browser-harness input targeting/recovery inside the embedded game surface, not provider availability or an observed game defect.

## Findings

### BLOCKER - Harness did not reach a drivable track from the clean menu state

- Severity: Blocking
- Status: Open
- Repro steps:
  1. Open `https://poki.com/en/g/polytrack` in the shared Chrome browser-harness tab.
  2. Wait for the visible `games.poki.com` iframe to reach the PolyTrack main menu.
  3. Attempt to focus the game surface and proceed to gameplay using visible coordinates and documented/common keys.
  4. Observe that the interaction opens or remains on Settings instead of entering a track.
- Expected behavior: The QA harness should activate the visible Play flow and reach a track so driving controls and route/timer/reset behavior can be evaluated.
- Actual behavior: Clean evidence reached the main menu and Settings, but not a drivable track.
- Evidence: `02-iframe-visible-after-wait.png`, `05-after-w-accelerate.png`, `18-after-play-click.png`, `21-after-track-w-accelerate.png`, `26-after-track-space-pause.png`, `gameplay-recording.mp4`.
- Evidence clip: `gameplay-recording.mp4 @ 00:00-00:14`
- Evidence status: Clip available.
- Why this evidence proves the finding: The full recording shows the provider/game menu and then repeated Settings-screen states through the end of the run, with no transition to a drivable track, car movement, timer, or race HUD.

## Checks Completed

- Provider URL reachable: PASS.
- Provider iframe visible: PASS.
- PolyTrack in-game menu reachable: PASS.
- Settings/options visible: PARTIAL PASS. Settings panel is readable and exposes several gameplay/camera/display controls; audio/graphics/fullscreen/persistence were not fully verified.
- Keyboard focus/driving controls: NOT VERIFIED.
- Route/camera readability from race start: NOT VERIFIED.
- Timer/run feedback: NOT VERIFIED.
- Restart/reset behavior: NOT VERIFIED.
- Performance: PARTIAL PASS. No crash or severe frame stall was observed while loading menu/settings, but racing performance was not tested.
- Provider shell state: PASS. No misleading provider shell blocker remained in the clean run.

## Usability / Accessibility Notes

- The provider localized the page to Indonesian despite the `/en/` URL. The game menu itself displayed English after load.
- The embedded game menu and Settings screen were readable at the tested desktop viewport.
- The provider page surrounds the game with many recommendation tiles and ad slots, but the iframe remained visible and usable at the top of the page.

## QA Methodology Carry-Forward

- For external iframe games, close duplicate game tabs before a clean pass; PolyTrack detects another open instance and blocks with an in-game message.
- Treat provider menu reachability separately from track/gameplay reachability. A menu/settings pass is not enough to approve driving controls.
- When a game uses large canvas-style menu tiles, capture a menu screenshot and derive click targets from the visible tile layout before sending automated input.
- Keep contaminated stale-tab captures out of final evidence; overwrite or explicitly mark them invalid before reporting.

## Retry Statement

Retry recommended in the same provider path with no duplicate PolyTrack tabs open and with a more deliberate Play-menu interaction plan. The provider itself is reachable, so the next attempt should target entering a drivable track rather than searching alternate URLs first.

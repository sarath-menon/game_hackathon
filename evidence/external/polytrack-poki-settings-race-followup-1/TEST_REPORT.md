# PolyTrack - Poki Follow-up 3 Settings, Pause, And Race Regression

## Verdict

`PASS_WITH_FINDINGS`

PolyTrack remained playable through the Poki provider in the shared Chrome/browser-harness surface. The pass verified provider load, no duplicate-instance blocker, settings access, non-destructive settings persistence, music toggle visibility, track start, short keyboard driving, HUD/timer/route readability, and clean restart through the track detail Play flow. Remaining issues are nonblocking provider/settings/pause clarity findings, not provider or environment blockers.

## Test Inputs

- Attempted URL: `https://poki.com/en/g/polytrack`
- Observed redirected URL: `https://poki.com/id/g/polytrack`
- Player manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/polytrack-poki/README.md`
- Browser: shared Chrome window controlled only through browser-harness
- Viewport: 782 x 859
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-poki-settings-race-followup-1`
- Recording method: screenshots captured during one continuous browser-harness run, encoded to MP4 from captured PNG evidence

## Summary

The Poki page reached PolyTrack's menu after dismissing a non-required account/progress prompt. The `/en/` URL redirected to an Indonesian Poki shell, but the game itself remained playable. Settings were discoverable and readable. Units changed from Metric to Imperial, applied successfully, and persisted after a safe reload; the race HUD later reflected mph. The visible `Music` control toggled from On to Off. No graphics quality or volume slider was found.

Race regression passed at smoke level: Summer 1 launched, route/camera/timer/checkpoint HUD were readable, keyboard throttle/steering moved the car, and returning to the track detail Play flow produced a clean restart at `00:00.000`. Escape returned to the track list rather than showing a clear pause overlay, and the in-run `T` start-over key did not visibly reset the timer in the captured frame.

## Findings

### Medium - Provider locale redirects `/en/` URL to Indonesian shell

- Status: Open, nonblocking
- Repro steps: Open `https://poki.com/en/g/polytrack` in the shared browser; wait for provider load.
- Expected: The English URL should keep an English provider shell or clearly explain locale switching.
- Actual: The page redirected to `https://poki.com/id/g/polytrack`; provider UI and account prompt used Indonesian copy such as `Main Online Gratis`, `oleh Kodub`, and `IKLAN`.
- Evidence: `01-provider-load.png`, `02-after-load-wait.png`, `03-after-login-prompt-close.png`
- Evidence clip: `gameplay-recording.mp4 @ 00:00-00:03`
- Evidence status: Clip available.
- Why this evidence proves the finding: The clip opens on the Poki provider shell and account/progress prompt with Indonesian provider text before the playable PolyTrack menu appears, matching the locale-redirect finding.

### Low - Pause state is not clearly represented during a run

- Status: Open, nonblocking
- Repro steps: Start Summer 1, focus the game frame, drive briefly, press Escape.
- Expected: If Escape is a pause/menu control, the UI should show a clear paused overlay or state.
- Actual: Escape returned to the track selection/menu view with no explicit paused-state copy. This was stable and recoverable, but pause clarity remains weak.
- Evidence: `14-after-short-drive.png`, `15-after-escape-pause.png`
- Evidence clip: `gameplay-recording.mp4 @ 00:13-00:15`
- Evidence status: Clip available.
- Why this evidence proves the finding: The recording shows a running track segment, then the post-Escape state returning to the track/menu surface without a visible paused overlay or explicit paused copy.

### Low - Settings coverage is visible but incomplete for graphics/audio/fullscreen/defaults

- Status: Open, nonblocking coverage limitation
- Repro steps: Open Settings from the main menu and inspect visible controls.
- Expected: If audio, graphics, fullscreen, reset/defaults, and persistence are supported, player-facing controls should be discoverable and testable.
- Actual: Settings showed language, units, reset hint, ghost car, default camera, cockpit camera mode, checkpoints, Cancel, Reset, and Apply. No graphics quality control, volume slider, or detailed audio setting was found. A fullscreen icon was visible but not activated to avoid disrupting the shared-window harness. The Settings Reset button was visible but not deeply exercised.
- Evidence: `03-after-login-prompt-close.png`, `04-settings-open.png`, `08-settings-after-reload.png`
- Evidence clip: `gameplay-recording.mp4 @ 00:03-00:08`
- Evidence status: Clip available.
- Why this evidence proves the finding: The clip shows the main menu and Settings panel before and after reload, including the visible units/camera/checkpoint/reset controls while no graphics quality control or volume slider is visible in the captured settings views.

### Low - In-run start-over key feedback was inconclusive

- Status: Open, nonblocking
- Repro steps: Start Summer 1, drive briefly, press the visible start-over key `T`.
- Expected: The run should visibly return to a clean start or provide clear feedback if the action is unavailable.
- Actual: Reset/start-over hints were visible, and a clean restart was verified by exiting/reselecting the track, but the captured `T` attempt did not return the timer to `00:00.000`.
- Evidence: `14-after-short-drive.png`, `17-track-restarted-clean.png`, `18-second-drive-before-reset.png`, `19-after-t-start-over.png`
- Evidence clip: `gameplay-recording.mp4 @ 00:16-00:18`
- Evidence status: Clip available.
- Why this evidence proves the finding: The recording shows the clean restart path and later short drive/reset attempt; the captured post-`T` state does not clearly show the timer returning to a clean `00:00.000` start, so the key-specific feedback remains inconclusive.

## Coverage Table

| Scope item | Result | Evidence |
| --- | --- | --- |
| Reach playable provider/game | Pass | `01-provider-load.png` through `03-after-login-prompt-close.png` |
| No duplicate-instance blocker | Pass | `07-after-safe-reload.png`, `11-after-play-click.png` |
| Settings discoverability | Pass | `03-after-login-prompt-close.png`, `04-settings-open.png` |
| Language/provider shell behavior | Finding | `01-provider-load.png`, `02-after-load-wait.png` |
| Units setting | Pass | `04-settings-open.png`, `05-settings-units-imperial-selected.png`, `13-track-start-or-countdown.png` |
| Settings persistence | Pass | `07-after-safe-reload.png`, `08-settings-after-reload.png` |
| Apply/Cancel controls | Pass | `06-after-settings-apply.png`, `09-main-menu-before-music-toggle.png` |
| Reset/default controls | Partial | Reset visible in `04-settings-open.png`; not deeply exercised |
| Audio/music control | Pass with limitation | `09-main-menu-before-music-toggle.png`, `10-music-toggled-off.png`; no volume slider found |
| Graphics/fullscreen controls | Partial | Fullscreen icon visible; graphics controls not found |
| Track selection and start | Pass | `11-after-play-click.png`, `12-after-summer-1-click.png`, `13-track-start-or-countdown.png` |
| Keyboard driving | Pass | `14-after-short-drive.png`, `18-second-drive-before-reset.png` |
| Timer/HUD/route readability | Pass | `13-track-start-or-countdown.png`, `14-after-short-drive.png` |
| Pause/menu clarity | Finding | `15-after-escape-pause.png` |
| Restart/reset | Pass with limitation | Clean track restart in `17-track-restarted-clean.png`; `T` start-over inconclusive in `19-after-t-start-over.png` |

## Usability And Accessibility Assessment

- Text and menu controls were readable in the tested viewport.
- The game frame required click focus before keyboard driving, matching the manual guidance.
- Route visibility from the starting camera and short driving segment was acceptable.
- Settings buttons used visible selected states and clear labels.
- Provider locale mismatch may confuse English-route users.
- Pause and in-run reset feedback should be clearer for players relying on visible state changes.

## Performance And Load Assessment

The provider and game loaded successfully after a short wait and account prompt dismissal. The short race segment had no observed crash, softlock, severe input lag, or runtime/provider error. The race remained responsive enough for keyboard driving and menu recovery.

## Provider And Environment Classification

No provider or environment blocker occurred. The selected Poki provider reached menu and playable track state in the shared Chrome window. The observed `/en/` to `/id/` locale redirect is a provider-shell finding, not a `BLOCKED_PROVIDER` condition. The shared-window browser-harness remained reliable enough to complete the pass, so this is not `BLOCKED_ENVIRONMENT`.

## QA Methodology Carry-Forward

- Treat provider locale redirects as explicit external QA coverage, even when gameplay remains available.
- For racing games, capture settings persistence with a HUD-visible consequence where possible; here Imperial units persisted and appeared as mph in-race.
- Separate pause/menu behavior from restart behavior: Escape may be a back/menu action rather than pause, so reports should avoid assuming a paused state without visible confirmation.
- For visible reset hints, capture both the hint and a post-action timer/state change; if the post-action frame does not clearly reset, record it as inconclusive instead of over-claiming.

## Final Statement

`PASS_WITH_FINDINGS`. PolyTrack Poki Follow-up 3 is approved as playable and acceptable for the tested scope, with nonblocking findings around provider locale clarity, pause-state clarity, and deeper graphics/audio/fullscreen/reset coverage.

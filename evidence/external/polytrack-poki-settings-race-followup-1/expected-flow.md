# PolyTrack Poki Follow-up 3 - Expected And Observed Flow

## Inputs

- Attempted URL: `https://poki.com/en/g/polytrack`
- Observed active URL after load: `https://poki.com/id/g/polytrack`
- Player manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/polytrack-poki/README.md`
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack-poki-settings-race-followup-1`
- Browser surface: shared Chrome window via browser-harness, 782 x 859 viewport

## Expected Flow

1. Load the Poki PolyTrack page and reach the game menu without duplicate-instance or provider blockers.
2. Dismiss only non-required account prompts and avoid sign-in.
3. Open Settings from visible menu controls.
4. Inspect player-visible settings for language, units, camera, checkpoint/reset hint, ghost, apply/cancel/reset/defaults, audio, graphics, and fullscreen if available.
5. Make one non-destructive settings change, apply it, reload safely, and verify persistence.
6. Inspect and toggle the visible audio/music control without intentionally producing loud audio.
7. Start a track through visible Play and track-selection controls.
8. Drive a short segment using documented/common keyboard controls after focusing the game frame.
9. Observe timer, HUD, route/camera readability, checkpoint progress, and reset/restart affordances.
10. Try a safe pause/menu action and determine whether the paused state is clear.
11. Use a safe restart/reset path to return to a clean starting state where practical.

## Observed Flow And Evidence

| Step | Evidence | Observed result |
| --- | --- | --- |
| Provider load | `01-provider-load.png` | The `/en/` URL redirected to Indonesian Poki shell at `/id/g/polytrack`; game frame began loading. |
| Provider prompt | `02-after-load-wait.png` | Indonesian account/progress prompt appeared; no account action was required for play. |
| Prompt dismissed | `03-after-login-prompt-close.png` | Main PolyTrack menu reached; `Music: On`, Settings, Multiplayer, Play, Garage, and Editor visible. |
| Settings open | `04-settings-open.png` | Settings panel was readable; language, units, reset hint, ghost car, default camera, cockpit mode, checkpoints, Cancel, Reset, and Apply visible. |
| Units changed | `05-settings-units-imperial-selected.png` | Units changed from Metric to Imperial through visible controls. |
| Apply setting | `06-after-settings-apply.png` | Apply returned to menu without blocking errors. |
| Safe reload | `07-after-safe-reload.png` | Game returned to main menu; no duplicate-instance blocker appeared. |
| Persistence check | `08-settings-after-reload.png` | Units persisted as Imperial after reload. |
| Audio before toggle | `09-main-menu-before-music-toggle.png` | Main menu showed `Music: On`. |
| Audio toggle | `10-music-toggled-off.png` | Music control visibly changed to `Music: Off`. No volume slider was observed. |
| Track selection | `11-after-play-click.png` | Official Tracks selection opened; Summer track cards visible. |
| Track detail | `12-after-summer-1-click.png` | Summer 1 detail screen opened with Play button and track information. |
| Race start | `13-track-start-or-countdown.png` | Summer 1 started at `00:00.000`; route, car, checkpoint count, speed, and timer visible. Imperial units were reflected as mph. |
| Short drive | `14-after-short-drive.png` | Keyboard input moved the car; timer advanced; route remained readable; reset/start-over hints were visible. |
| Escape action | `15-after-escape-pause.png` | Escape returned to track list/menu rather than showing a clear pause overlay. |
| Re-select track | `16-reselected-summer-1.png` | Summer 1 could be selected again after returning to the list. |
| Clean restart | `17-track-restarted-clean.png` | Track restarted cleanly from the detail Play flow with timer at `00:00.000`. |
| Second drive | `18-second-drive-before-reset.png` | A second short drive advanced the timer and speed HUD. |
| Start-over key attempt | `19-after-t-start-over.png` | Pressing `T` did not visibly reset to `00:00.000` in the captured frame; reset-key behavior remains unclear. |

## Coverage Limits

- Fullscreen icon was visible on the provider/game frame but not activated to avoid disrupting the shared-window harness.
- Graphics quality and volume controls were not found in visible Settings.
- The visible Reset button in Settings was identified but not deeply exercised beyond Apply/Cancel/persistence checks.
- The `T` start-over key hint was visible, but the captured key attempt did not conclusively show an immediate clean reset.

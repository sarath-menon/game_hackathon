# Arcade Kart Racer Settings-Depth Retest 2 Expected/Observed Flow

## Test Inputs

- Game URL: http://127.0.0.1:8765/games/kart-racer/index.html
- Manual: http://127.0.0.1:8765/games/kart-racer/README.md
- Manual path: /Users/sarathmenon/Documents/game_hackathon/games/kart-racer/README.md
- Evidence folder: /Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/settings-depth-retest-2
- Browser surface: shared Chrome window through browser-harness
- Viewport: desktop shared-window viewport, approximately 1519 x 981 screenshot output

## Expected Flow From Manual

1. Load the title screen.
2. Open Settings from title with the Settings button or `O`.
3. Confirm settings groups are visible: Controls/Handling, Visual/Readability, Camera/HUD, Audio, and Data/Reset.
4. Confirm audio defaults to off/muted with volume `0%`.
5. Enable UI sounds and raise Volume only through explicit Settings opt-in.
6. Use Reset Defaults and confirm UI sounds return off/muted and Volume returns to `0%`.
7. Change a safe visible setting and reload to confirm persistence.
8. Start the race with `Enter` or `Space`.
9. Drive enough to verify visible route aids, HUD, minimap, checkpoint labels, and drift input/release feedback.
10. Open Settings during the race and confirm timer/kart movement pause while the panel is open.
11. Close Settings and confirm control returns to the race.
12. Press `R` to restart and confirm the race resets to the start route.

## Observed Flow

1. `01-title-first-load.png` shows the hosted game loaded to the title screen.
2. `02-title-settings-open.png` through `06-settings-return-top.png` show Settings opened from the title and all documented settings sections reachable by internal scrolling.
3. `05-settings-bottom-audio-reset.png` and `07-bottom-before-audio-opt-in.png` show first-load audio state: UI sounds unchecked and Volume `0%`.
4. `08-after-ui-sounds-enabled.png` and `09-after-volume-raised.png` show explicit audio opt-in: UI sounds checked and Volume raised to `80%`.
5. `10-after-reset-defaults.png` shows Reset Defaults restored UI sounds off and Volume `0%`, with reset feedback visible.
6. `12-after-high-contrast-toggle.png`, `13-after-hud-scale-change.png`, and `14-mid-after-persistence-changes.png` show safe settings changes, including HUD scale changed to `125%`.
7. `16-after-reload-title.png`, `17-settings-after-reload-top.png`, and `18-settings-after-reload-mid.png` show reload persistence for HUD scale while audio remained off/Volume `0%`.
8. `29-after-o-close-settings.png` shows the title screen after closing settings with focus returned to the opener.
9. `30-race-started-enter.png` through `34-route-progress-real.png` show race start, route visibility, HUD/minimap/checkpoint labeling, driving, and drift input/release smoke coverage.
10. `35-in-race-settings-open-real.png` and `36-in-race-settings-pause-still-real.png` show Settings opened during a race and remaining open during the pause check.
11. `37-in-race-settings-closed-real.png` shows return to the race after closing Settings.
12. `38-after-restart-real.png` shows restart returned the kart to the start route with CP1, chevrons, HUD, and minimap visible.

## Recording

- Continuous evidence recording: /Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/settings-depth-retest-2/gameplay-recording.mp4
- Recording generation: encoded from the 38 numbered captured screenshots at 2 fps with `ffmpeg`.

## Coverage Notes

- Full lap completion and boost-pad traversal were not repeated in this settings-focused retest. The captured race section is a smoke regression check for start, visible route state, driving, drift input/release, in-race settings pause/close, and restart.
- No browser-harness blocker remained during artifact generation.

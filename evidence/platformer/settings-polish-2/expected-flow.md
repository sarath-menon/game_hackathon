# Skyline Stepper Settings Polish 2 Expected/Observed Flow

## Test Inputs

- Game URL: http://127.0.0.1:8765/games/platformer/index.html
- Manual URL: http://127.0.0.1:8765/games/platformer/README.md
- Manual path: /Users/sarathmenon/Documents/game_hackathon/games/platformer/README.md
- Evidence folder: /Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2
- Browser surface: shared Chrome window through browser-harness
- Viewport: desktop shared-window viewport, approximately 1519 x 981 page size

## Expected Flow From Manual

1. Load the title screen.
2. Open Settings from the title screen.
3. Verify documented settings and defaults:
   - Jump Assist: Standard
   - Air Control: Steady, with Snappy and Floaty variants available
   - Damage Profile: Standard, with Gentle and Practice variants available
   - Checkpoint Assist: Off
   - Route Cue Style: Full
   - High-Contrast Hazards: Off
   - Objective Labels: Normal
   - Background Detail: Full Parallax, with Reduced and Static variants available
   - Generated UI Sounds: off, Volume 0%
4. Exercise visible setting changes, persistence/reload, and Reset Defaults.
5. Start a run and smoke-check route readability, checkpoint/exit progress, damage/failure under Standard, restart, and in-run Settings pause/close.
6. Check failure and completion contexts where reachable.
7. Capture narrow viewport usability where the shared-window harness supports it.

## Observed Flow

1. `01-title-first-load.png` shows the hosted game loaded to the title/start screen.
2. `02-title-settings-open-top.png` through `06-title-settings-return-top.png` initially captured the settings panel at the lower/audio portion rather than the top controls.
3. `09-after-keyboard-scroll-up-attempt.png` shows keyboard scrolling successfully restored the panel to the top, with Jump Assist `Standard`, Air Control `Steady`, Damage Profile `Standard`, Checkpoint Assist off, Camera defaults, Route Marker Intensity `100%`, and Route Cue Style `Full: Lines And Labels`.
4. `10-after-tab-navigation-attempt.png` shows visible keyboard focus in the settings panel.
5. `11-air-control-snappy.png` through `23-damage-profile-keyboard-change-attempt.png` are clean evidence from the Platformer tab. These screenshots show multiple attempts to change Air Control and Damage Profile variants, but the visible selected values did not change.
6. Browser-harness targeting became unreliable during the later regression-smoke continuation: screenshots `24-after-escape-close-settings.png` and later captured a dashboard/evidence tab rather than the Platformer game. Those screenshots are discarded and invalid for game QA.

## Blocker

The shared browser-harness target switched away from the active Platformer game tab during the pass, contaminating the run before gameplay regression, persistence, reset-default, failure, completion, and narrow viewport checks could be completed reliably.

## Recording

- Recording path: /Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2/gameplay-recording.mp4
- Recording method: encoded from clean screenshots `01` through `23` only at 2 fps with `ffmpeg`.
- Discarded evidence: screenshots `24` and later are not used for verdict support because they show stale-tab/dashboard contamination.

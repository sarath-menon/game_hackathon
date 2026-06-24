# Expected / Observed Flow - Skyline Stepper Settings Polish 2 Retest 2

## Expected Flow From Manual

1. Load `http://127.0.0.1:8765/games/platformer/index.html`.
2. Open Settings from the title/game state.
3. Confirm documented defaults:
   - Jump Assist: `Standard`
   - Air Control: `Steady`
   - Damage Profile: `Standard`
   - Checkpoint Assist: `Off`
   - Camera Smoothing: `12`
   - Camera Lookahead: `42%`
   - Route Marker Intensity: `100%`
   - Route Cue Style: `Full`
   - High-Contrast Hazards: `Off`
   - Objective Labels: `Normal`
   - Background Detail: `Full Parallax`
   - Generated UI Sounds: off, Volume `0%`
4. Change advanced variant controls through normal player input:
   - Air Control should switch between `Steady`, `Snappy`, and `Floaty`.
   - Damage Profile should switch between `Standard`, `Gentle`, and `Practice`.
   - Route Cue Style should switch between full lines/labels, lines only, and labels only.
   - Objective Labels and Background Detail should change to their documented variants.
5. Verify Reset Defaults restores documented defaults and generated sounds off/volume `0%`.
6. Verify changed settings persist across reload where safe.
7. Verify settings remain usable from title, in-run, failure, and completion contexts.
8. Regression-smoke lower route, checkpoint, exit, Standard damage/failure, collectibles, hazards, restart, and narrow viewport usability.

## Observed Flow

1. The active shared Chrome tab was verified as the Platformer game URL.
   - Evidence: `01-url-verified-title.png`
2. Settings opened from the visible title/game state.
   - Evidence: `02-title-settings-open.png`
3. The settings panel was moved to the top to reveal the first controls.
   - Evidence: `03-settings-top-after-home.png`
4. Visible defaults matched the manual for the inspected top controls:
   - Jump Assist: `Standard`
   - Air Control: `Steady`
   - Damage Profile: `Standard`
   - Checkpoint Assist: off
   - Camera Smoothing: `12`
   - Camera Lookahead: `42%`
   - Route Marker Intensity: `100%`
   - Route Cue Style: `Full: Lines And Labels`
5. Air Control was attempted with normal click/key selection. The value remained `Steady`.
   - Evidence: `04-air-control-after-native-down.png`
6. Air Control was attempted a second time with normal click/key selection. The value still remained `Steady`.
   - Evidence: `05-air-control-after-second-native-down.png`
7. Damage Profile was attempted with normal click/key selection. The value remained `Standard`.
   - Evidence: `06-damage-after-native-down.png`
8. The test stopped at this point because documented variant controls could not be changed while the verified active page was the Platformer game. Per handoff classification rules, this is a game `FAIL`, not an environment blocker.

## Coverage Not Completed Because Of Failure

- Air Control mechanical differences (`Snappy`, `Floaty`)
- Damage Profile behavior (`Gentle`, `Practice`)
- Practice no-health-loss behavior
- Standard health-zero failure path
- Checkpoint Assist behavior
- Route Cue Style variants
- High-Contrast Hazards effect
- Objective Labels size changes
- Background Detail variants
- Reset Defaults behavior
- Persistence/reload
- In-run/failure/completion settings contexts
- Lower-deck completion route, checkpoint, exit, hazards, collectibles, restart
- Narrow viewport usability

## Artifact Notes

- Report: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-2/TEST_REPORT.md`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-2/gameplay-recording.mp4`
- Verdict: `FAIL`

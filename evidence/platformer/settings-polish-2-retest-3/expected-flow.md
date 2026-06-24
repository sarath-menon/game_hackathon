# Expected / Observed Flow - Skyline Stepper Settings Polish 2 Retest 3

## Expected Flow

1. Load the Platformer game at `http://127.0.0.1:8765/games/platformer/index.html`.
2. Verify the active browser target is the Platformer game URL.
3. Open Settings from the title/game state.
4. Confirm Settings opens with the title and first controls immediately visible.
5. Confirm documented defaults:
   - Jump Assist: `Standard`
   - Air Control: `Steady`
   - Damage Profile: `Standard`
   - Checkpoint Assist: `Off`
   - Camera Smoothing: `12`
   - Camera Lookahead: `42%`
   - Route Marker Intensity: `100%`
   - Route Cue Style: `Full`
   - Generated UI Sounds off and Volume `0%`
6. Change Air Control to `Snappy` and `Floaty` through normal visible controls.
7. Change Damage Profile to `Gentle` and `Practice` through normal visible controls.
8. Verify the documented visible option buttons for Air Control and Damage Profile are discoverable and update the same saved state as the dropdowns.
9. Continue with Reset Defaults, persistence/reload, audio reset, in-run/failure/completion Settings access, gameplay regression, and narrow viewport checks.

## Observed Flow

1. The active shared Chrome target was verified as the Platformer game URL.
   - Evidence: `01-url-verified-title.png`
2. Settings opened from the title/game state with title and top controls visible.
   - Evidence: `02-title-settings-open.png`
3. The top controls showed defaults matching the manual for the inspected values:
   - Jump Assist: `Standard`
   - Air Control: `Steady`
   - Damage Profile: `Standard`
   - Checkpoint Assist: off
   - Camera Smoothing: `12`
   - Camera Lookahead: `42%`
   - Route Marker Intensity: `100%`
   - Route Cue Style: `Full: Lines And Labels`
4. The URL was verified again before Air Control interaction.
   - Evidence: `03-before-air-control-interaction.png`
5. Air Control was attempted through normal dropdown click/key input. The value remained `Steady`.
   - Evidence: `04-after-air-dropdown-arrowdown.png`
6. Damage Profile was attempted through normal dropdown click/key input. The value remained `Standard`.
   - Evidence: `05-after-damage-dropdown-arrowdown.png`
7. Air Control was attempted again using the dropdown arrow region. The value still remained `Steady`.
   - Evidence: `06-after-air-arrow-region-attempt.png`
8. No separate visible option buttons for Air Control or Damage Profile were present in the tested Settings panel.
9. The test stopped because the core builder fix target did not pass while the active URL was verified as Platformer.

## Coverage Not Completed Because Of Failure

- Air Control `Snappy` / `Floaty` behavior
- Damage Profile `Gentle` / `Practice` behavior
- Practice no-health-loss behavior
- Standard health-zero failure under repeated hazard contact
- Reset Defaults and audio reset to off/0
- Persistence/reload of changed Air Control and Damage Profile variants
- Route Cue Style variants
- High-Contrast Hazards effect
- Objective Labels Large
- Background Detail Reduced/Static
- Settings from in-run, failure, and completion contexts
- Lower-deck completion route, checkpoint, exit, hazards, collectibles, restart
- Narrow viewport usability

## Artifact Paths

- Report: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-3/TEST_REPORT.md`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-3/gameplay-recording.mp4`
- Verdict: `FAIL`

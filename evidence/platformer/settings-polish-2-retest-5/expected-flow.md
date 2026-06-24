# Expected / Observed Flow - Skyline Stepper Settings Polish 2 Retest 5

## Expected Flow

1. Navigate explicitly to `http://127.0.0.1:8765/games/platformer/index.html?settingsPolishRetest=5`.
2. Verify the active URL preserves `settingsPolishRetest=5`.
3. Open Settings from the title state.
4. Confirm the `Player Variant Controls` block is visible near the top.
5. Confirm all six buttons are visible and readable:
   - Air Control: `Steady`, `Snappy`, `Floaty`
   - Damage Profile: `Standard`, `Gentle`, `Practice`
6. Click `Snappy` and `Practice`; verify selected state and dropdown values update.
7. Reload the cache-busted URL; verify `Snappy` and `Practice` persist.
8. Use Reset Defaults; verify Air Control returns to `Steady`, Damage Profile returns to `Standard`, generated sounds remain off, and volume returns to `0%`.
9. Start or continue a run, open Settings during the run, close Settings, and verify gameplay resumes.
10. Continue route/checkpoint/exit/failure/restart/narrow-viewport regression if no blockers appear.

## Observed Flow

1. The exact cache-busted URL loaded and preserved the query string.
   - Evidence: `01-cache-busted-url-loaded.png`
2. Settings opened from the title state and displayed the current cache-busted UI.
   - Evidence: `02-settings-open-after-cache-busted.png`
3. `Player Variant Controls` was visible near the top with all six required buttons.
   - Evidence: `02-settings-open-after-cache-busted.png`
4. Clicking `Snappy` changed Air Control selected state and synchronized the Air Control dropdown to `snappy`.
   - Evidence: `03-after-snappy-button.png`
5. Clicking `Practice` changed Damage Profile selected state and synchronized the Damage Profile dropdown to `practice`.
   - Evidence: `04-after-practice-button.png`
6. Reload preserved the cache-busted URL and persisted `Snappy` / `Practice`.
   - Evidence: `05-after-reload-persistence-title.png`, `06-after-reload-settings-persisted.png`
7. Reset Defaults returned Air Control to `Steady`, Damage Profile to `Standard`, generated sounds off, and volume `0%`.
   - Evidence: `07-settings-bottom-before-reset.png`, `08-after-reset-defaults.png`, `09-after-reset-top.png`
8. In-run Settings was opened and then closed via `Close Settings`. The panel disappeared, but the HUD still read `Settings paused`.
   - Evidence: `53-after-click-close-settings.png`
9. Movement/jump input after closing Settings did not visibly resume normal gameplay; the HUD still read `Settings paused`.
   - Evidence: `59-actual-run-input-5.png`, `64-actual-run-input-10.png`

## Coverage Not Completed Because Of Failure

- Lower-deck completion route to checkpoint and exit
- Health-zero failure under Standard
- Checkpoint/respawn behavior
- Collectibles/hazards/restart
- Completion/failure settings contexts
- Narrow viewport usability

## Artifact Paths

- Report: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-5/TEST_REPORT.md`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-5/gameplay-recording.mp4`
- Verdict: `FAIL`

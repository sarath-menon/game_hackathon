# Expected / Observed Flow - Skyline Stepper Settings Polish 2 Retest 6

## Expected Flow

1. Navigate to `http://127.0.0.1:8765/games/platformer/index.html?settingsPolishRetest=6`.
2. Verify the active URL preserves `settingsPolishRetest=6`.
3. Open Settings and confirm Player Variant Controls remain visible.
4. Confirm `Snappy` and `Practice` can be selected and update selected state/dropdowns.
5. Use Reset Defaults and confirm Air Control returns to `Steady`, Damage Profile returns to `Standard`, generated sounds stay off, and volume is `0%`.
6. Start a run.
7. Open Settings during the run and confirm the HUD says `Settings paused`.
8. Close Settings with `Escape`; confirm the HUD no longer says `Settings paused`.
9. Reopen Settings during the run and close with the visible `Close Settings` button; confirm the HUD again returns to the active run objective.
10. Smoke-check route readability and post-close input state.

## Observed Flow

1. The exact cache-busted URL loaded and preserved the query string.
   - Evidence: `01-cache-busted-url-loaded.png`
2. Settings opened with Player Variant Controls visible.
   - Evidence: `02-settings-open-variant-controls.png`
3. `Snappy` selected successfully and synchronized the Air Control dropdown.
   - Evidence: `03-after-snappy.png`
4. `Practice` selected successfully and synchronized the Damage Profile dropdown.
   - Evidence: `04-after-practice.png`
5. Reset Defaults returned Air Control to `Steady`, Damage Profile to `Standard`, generated sounds off, and volume `0%`.
   - Evidence: `05-settings-bottom-before-reset.png`, `06-after-reset-top.png`
6. A clean run was started from the title state.
   - Evidence: `07-clean-title-before-run.png`, `08-run-started-clean.png`
7. In-run Settings opened and correctly showed `Settings paused`.
   - Evidence: `09-in-run-settings-open.png`
8. Closing with `Escape` returned the HUD to `Reach the exit beacon`.
   - Evidence: `10-after-escape-close-run-settings.png`
9. Movement/jump input after Escape close did not return the game to a stuck paused state.
   - Evidence: `11-after-move-input-post-escape-close.png`
10. In-run Settings opened a second time.
   - Evidence: `12-in-run-settings-open-second.png`
11. Closing with the visible `Close Settings` button returned the HUD to `Reach the exit beacon`.
   - Evidence: `13-after-button-close-run-settings.png`
12. Movement/jump input after button close did not return the game to a stuck paused state.
   - Evidence: `14-after-move-input-post-button-close.png`

## Coverage Notes

- Narrow viewport capture was attempted but blocked by a browser-harness CDP helper error, so it is documented as a nonblocking environment-limited sub-scope.
- Full checkpoint/exit/failure/restart completion was not repeated in this narrow fix verification pass; run start, route readability near start, in-run settings state, and post-close input state were smoke-checked.

## Artifact Paths

- Report: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-6/TEST_REPORT.md`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-6/gameplay-recording.mp4`
- Verdict: `PASS`

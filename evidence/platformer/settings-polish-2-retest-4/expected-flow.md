# Expected / Observed Flow - Skyline Stepper Settings Polish 2 Retest 4

## Expected Flow

1. Load `http://127.0.0.1:8765/games/platformer/index.html`.
2. Verify the active browser target is the Platformer URL before each major segment.
3. Open Settings from the title/game state.
4. Settings should open with the title/top controls and a full-width `Player Variant Controls` block visible near the top.
5. The block should expose six readable buttons:
   - Air Control: `Steady`, `Snappy`, `Floaty`
   - Damage Profile: `Standard`, `Gentle`, `Practice`
6. Clicking those buttons should visibly update selected state and synchronize the underlying settings values.
7. Reset Defaults should restore Air Control `Steady`, Damage Profile `Standard`, generated sounds off, and volume `0%`.
8. Changed Air Control and Damage Profile values should persist across reload.
9. Continue with remaining settings/defaults, in-run/failure/completion settings access, gameplay regression, and narrow viewport checks.

## Observed Flow

1. The active shared Chrome tab was verified as the Platformer game URL.
   - Evidence: `01-url-verified-title.png`
2. Settings was opened in the existing state before reload; the old dropdown-only layout was visible.
   - Evidence: `02-settings-open-top.png`
3. The page was reloaded in the same shared tab and the URL remained the Platformer game URL.
   - Evidence: `03-after-reload-title.png`
4. The title modal was shown after reload. Initial clicks that missed the title Settings button left the title modal unchanged.
   - Evidence: `04-after-reload-settings-open.png`, `05-after-title-settings-click.png`, `06-after-title-settings-corrected-click.png`
5. The title Settings button was opened with corrected coordinates. Settings opened, but it landed near the lower settings area rather than the top.
   - Evidence: `07-after-title-settings-dom-coord.png`
6. Pressing Home moved the panel to the top. The top Settings section showed the existing cards and dropdowns, but no `Player Variant Controls` block and no six visible option buttons.
   - Evidence: `08-after-home-top.png`
7. The test stopped because the handoff-required top-level variant buttons were missing while the active page URL was verified as Platformer.

## Coverage Not Completed Because Of Failure

- Air Control button changes for `Steady`, `Snappy`, `Floaty`
- Damage Profile button changes for `Standard`, `Gentle`, `Practice`
- Button selected-state feedback
- Button/dropdown synchronization
- Persistence/reload for changed Air Control and Damage Profile
- Reset Defaults for Air/Damage/audio
- Full in-run/failure/completion settings-context checks
- Lower-deck completion route, checkpoint, exit
- Health-zero failure under Standard
- Collectibles/hazards/restart
- Narrow viewport usability

## Artifact Paths

- Report: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-4/TEST_REPORT.md`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-4/gameplay-recording.mp4`
- Verdict: `FAIL`

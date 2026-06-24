# Cookie Clicker Expected Flow

Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/cookie-clicker/`

Test surface: `https://orteil.dashnet.org/cookieclicker/`

Manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/cookie-clicker/README.md`

## Expected Player Flow

1. Open the game URL.
   - Expected: the Cookie Clicker loading screen appears, then the main game UI or language/consent prompts appear.
   - Evidence: `screenshots/10-remote-loaded.png`, `screenshots/11-main-ready.png`.

2. Dismiss required startup prompts.
   - Expected: cookie consent and language UI do not block gameplay after selection/acknowledgement.
   - Observed: the test selected Czech from the language picker, and the game immediately localized visible UI text.
   - Evidence: `screenshots/11-main-ready.png`.

3. Click the large cookie repeatedly.
   - Expected: cookie count increments, floating cookie feedback appears, and title/counter update.
   - Observed: count advanced from 0 to at least 27 during the continuous gameplay capture.
   - Evidence: `gameplay-recording.mp4`, `frames/frame_0000.png` through `frames/frame_0032.png`.

4. Purchase early store items when affordable.
   - Expected: buying products spends cookies and unlocks visible production.
   - Observed: Cursor became available at 15 cookies, Grandma became visible at 115 cookies, and production reached 1 cookie per second.
   - Evidence: `screenshots/18-pre-options-current-state.png`, `screenshots/23-after-reload-persistence-focused.png`.

5. Open Options.
   - Expected: Options exposes save/export/import, language, volume, visual/performance toggles, accessibility/screen-reader option, and reset controls.
   - Observed: localized Options panel included manual save, export/import, save/load file, language, volume, visual toggles, screen-reader mode, warning toggles, and a clearly destructive reset button.
   - Evidence: `screenshots/20-options-open-focused.png`.

6. Save and export without destructive reset.
   - Expected: manual save is available, and export opens a save-code dialog without resetting progress.
   - Observed: corrected export click opened the export-save dialog with a save-code message and completion text.
   - Evidence: `screenshots/27-save-corrected.png`, `screenshots/28-export-corrected.png`, `automation-log-export-focused.json`.

7. Reload the page.
   - Expected: local progress persists after reload.
   - Observed: after reload, the game retained the localized UI, bakery name, Cursor/Grandma progression, 1 cookie per second, and a nonzero cookie total.
   - Evidence: `screenshots/23-after-reload-persistence-focused.png`, `automation-log-focused.json`.

8. Responsive check.
   - Expected: narrow/mobile viewport should remain usable if the harness can resize the browser viewport.
   - Observed limitation: Browser-harness CDP mobile emulation did not resize the captured remote viewport; screenshot remained 1536x608. Narrow responsive behavior was therefore not conclusively verified.
   - Evidence: `screenshots/24-mobile-390x844-focused.png`.

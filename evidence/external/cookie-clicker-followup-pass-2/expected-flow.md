# Expected / Observed Flow - Cookie Clicker Follow-up Pass 2

## Expected Flow

1. Load `https://orteil.dashnet.org/cookieclicker/`.
2. Reach playable Cookie Clicker state without sign-in or personal-data submission.
3. Create a small distinctive non-destructive state using cookie clicks and an affordable purchase.
4. Save manually, reload, and compare visible cookie/CPS/building state.
5. Open Options and inspect non-destructive settings and backup flows:
   - Save / Export save / Import save
   - Save to file / Load from file
   - Language controls
   - Audio/volume/sound controls
   - Visual/performance toggles
   - Accessibility/readability controls
   - Warning toggles
   - Destructive reset separation
6. Open export/import affordances only to safe modal level.
7. Attempt narrow/mobile layout capture if supported by the shared browser harness.

## Observed Flow

1. Direct provider loaded playable Cookie Clicker with an existing local save.
   - Evidence: `01-direct-url-loaded.png`, `02-playable-initial-state.png`
2. Backup reminder was dismissed without blocking gameplay.
   - Evidence: `03-after-backup-dismiss.png`, `04-before-state-change.png`
3. Cookie clicks increased the cookie count.
   - Evidence: `05-after-cookie-clicks.png`
4. A safe Grandma purchase succeeded. Visible state changed to Grandma owned count `1` and CPS `1.2`.
   - Evidence: `06-after-safe-purchase.png`
5. Options opened and exposed save/export/import/file/language/settings/destructive controls.
   - Evidence: `07-options-open.png`
6. Manual Save was clicked.
   - Evidence: `08-after-manual-save.png`
7. Options lower/deeper controls were inspected, including visual/performance, warning, and screen-reader settings.
   - Evidence: `09-options-lower-after-pagedown.png`, `10-options-back-top.png`
8. Export save was opened to its safe modal level and dismissed.
   - Evidence: `11-export-save-modal.png`, `12-after-export-dismiss.png`
9. Import save was opened to its safe modal level and dismissed without pasting or loading data.
   - Evidence: `13-import-save-modal.png`, `14-after-import-dismiss.png`
10. Reload preserved the distinctive state: Grandma count `1`, CPS `1.2`, and cookies continuing upward.
   - Evidence: `15-after-reload-persistence.png`
11. Mobile emulation was attempted but blocked by browser-harness CDP helper behavior. The current 782 x 859 narrow desktop viewport was captured instead.
   - Evidence: `16-mobile-emulation-blocked-current-narrow.png`

## Artifact Paths

- Report: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/cookie-clicker-followup-pass-2/TEST_REPORT.md`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/cookie-clicker-followup-pass-2/gameplay-recording.mp4`
- Verdict: `PASS_WITH_FINDINGS`

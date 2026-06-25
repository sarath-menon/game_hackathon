# Cookie Clicker External QA Report

Game: Cookie Clicker

Verdict: PASS with limitations

Test date: 2026-06-25

## Test Inputs

- URL: `https://orteil.dashnet.org/cookieclicker/`
- Manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/cookie-clicker/README.md`
- Browser: Browser-harness remote Browser Use Chromium session
- Primary viewport: 1536x608
- Attempted narrow viewport: 390x844 via CDP emulation, but captured viewport remained 1536x608

## Evidence

- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/cookie-clicker/`
- Continuous recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/cookie-clicker/gameplay-recording.mp4`
- Expected flow: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/cookie-clicker/expected-flow.md`
- Screenshots: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/cookie-clicker/screenshots/`
- Recording method: browser-harness CDP screenshots captured during continuous click/purchase gameplay, encoded with `ffmpeg` at 24 fps. Output is 1536x608, 8.25 seconds, H.264 MP4.

## Summary

Cookie Clicker loaded successfully, accepted startup language/consent flow, allowed cookie clicking, exposed early store progression, enabled purchases, generated passive production, exposed a detailed Options menu, supported manual save/export controls, and retained progress after reload. No critical or high-severity blockers were found in the tested flow.

During startup, the language picker was exercised and the UI localized to Czech. The localized UI remained usable and persisted across reload. Export-save was verified after correcting click coordinates; import was not performed to avoid overwriting the active save state.

## Findings

### F1 - Narrow viewport capture could not be conclusively verified

- Severity: Low / Test limitation
- Status: Open limitation
- Repro steps:
  1. Load Cookie Clicker in the Browser Use remote browser.
  2. Use CDP `Emulation.setDeviceMetricsOverride` with width 390 and height 844.
  3. Capture screenshot.
- Expected: captured viewport reflects 390x844 mobile/narrow layout.
- Actual: captured screenshot remained 1536x608, so the product's actual narrow layout could not be judged from this run.
- Evidence: `screenshots/24-mobile-390x844-focused.png`
- Evidence clip: Needs Evidence Clip
- Evidence status: Needs Evidence Clip
- Why this evidence proves the finding: The MP4 remains at the desktop capture size and does not include a proven 390x844 narrow/mobile recording segment, so this limitation still needs a dedicated clip.

### F2 - Backup reminder modal reappears after reload and covers central play area

- Severity: Informational
- Status: Observed, non-blocking
- Repro steps:
  1. Build early progress.
  2. Reload the page.
  3. Observe the backup-save reminder.
- Expected: backup reminder may appear and should be dismissible.
- Actual: reminder appeared over the center panel but did not block the left cookie or right store permanently.
- Evidence: `screenshots/23-after-reload-persistence-focused.png`
- Evidence clip: gameplay-recording.mp4 @ 00:00-00:07
- Evidence status: Main recording segment
- Why this evidence proves the finding: The recording repeatedly shows the backup reminder modal centered over the play area while the cookie and store columns remain visible and reachable around it.

## Functional Coverage

- Load/access: PASS. Game loaded from the public URL after the normal loading screen.
- Consent/language: PASS. Cookie notice and language selection were visible; selecting a language localized the UI.
- Click loop: PASS. Clicking the large cookie increased cookie count.
- Purchase loop: PASS. Cursor and Grandma progression became visible; cookies were spent and passive production reached 1 per second.
- Options menu: PASS. Options was discoverable and included save/export/import, language, volume, visual/performance toggles, screen-reader mode, warning toggles, and reset controls.
- Save/export: PASS. Manual save control was available; export opened a save-code dialog. Import was not performed to avoid overwriting state.
- Persistence: PASS. Reload retained localized UI, bakery state, purchases/progression, and nonzero cookie count.
- Performance: PASS in tested session. No crashes or blocking runtime failures observed during click loop/options/reload checks.
- Responsive behavior: LIMITED. True narrow viewport capture was not achieved through the harness.

## State / Action Clarity Assessment

PASS.

The primary state and actions were clear in normal play: cookie total and cookies-per-second were prominent, the large cookie was visually obvious, store products displayed costs, unaffordable items were greyed or hidden, purchased/available products became clearer after progression, Options/Stats/Info were discoverable, and the export-save dialog explained its purpose. Destructive reset remained separated and visibly labeled in red in Options.

## Regression Checklist

- Public URL loads without authentication wall: PASS
- Main click target visible: PASS
- Cookie total updates after clicks: PASS
- Store product purchase flow works: PASS
- Passive production appears after purchase: PASS
- Options menu opens: PASS
- Save/export controls visible: PASS
- Reload preserves progress: PASS
- No destructive reset performed: PASS
- No source files or implementation inspected: PASS

## Limitations

- The test used the provided manual plus visible game UI only.
- Import-save was not executed because it can overwrite active save data.
- Reset controls were visually inspected only; destructive reset was not executed.
- Narrow/mobile responsive behavior could not be conclusively evaluated because remote browser CDP emulation did not resize the captured viewport.
- The UI was tested mainly in Czech after the language picker selection; this also provided language behavior coverage but meant English label verification after selection was limited.

## Approval Statement

Approved for the tested external black-box scope. Cookie Clicker is playable directly by URL and satisfies the manual's expected click, purchase, options, export, and persistence behaviors in the tested browser session, with only non-blocking limitations noted above.

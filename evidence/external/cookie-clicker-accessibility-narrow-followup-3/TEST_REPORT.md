# Cookie Clicker - Accessibility, Narrow-Viewport, And Settings Persistence Follow-Up 3

## Verdict

`PASS_WITH_FINDINGS`

Cookie Clicker was playable at the direct provider URL in the shared Chrome/browser-harness surface. The pass verified readable saved state, cookie-click count changes, a safe early purchase state change, Options access, manual Save/export/import/file affordances, volume and multiple visual/performance/warning toggles, and destructive Wipe Save separation. The pass has nonblocking environment-limited coverage gaps because the shared browser-harness target drifted to an unrelated Kart tab during deeper Options scrolling, preventing clean reload persistence and narrow/mobile viewport evidence.

## Test Inputs

- Provider URL: `https://orteil.dashnet.org/cookieclicker/`
- Manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/cookie-clicker/README.md`
- Browser: shared Chrome window through browser-harness only
- Primary viewport before drift: 1519 x 981 desktop viewport
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/cookie-clicker-accessibility-narrow-followup-3/`
- Recording: `gameplay-recording.mp4`, encoded from uncontaminated Cookie screenshots only

## Provider and Environment Classification

- Provider classification: not blocked. The direct provider URL reached playable Cookie Clicker state.
- Environment classification: partially limited. The game itself was playable, but the shared browser-harness target drifted during deeper Options scrolling. Contaminated Kart screenshots were removed and do not support this verdict.
- Overall classification: `PASS_WITH_FINDINGS`, with `BLOCKED_ENVIRONMENT` limited to deeper Options scrolling, reload-persistence proof, and narrow/mobile viewport capture.

## Summary

The direct Cookie Clicker page loaded with existing local saved progress. Core state was readable: bakery name, cookies, cookies per second, store affordability, owned building counts, Options, Stats, and Legacy. Cookie clicks changed the visible cookie count. A safe Grandma purchase updated the store row from 1 owned Grandma to 2 owned Grandmas, and the tooltip described the Grandma effect and production contribution.

Options opened and showed save/export/import/file controls, language control, a visible volume slider, visual/performance toggles, warning toggles, accessibility-adjacent visual toggles, and a clearly separated red Wipe Save control. Deeper scrolling and narrow/mobile checks were not completed because target drift recurred; this is a harness/environment limitation, not a Cookie Clicker functional failure.

## Findings

### Low - Shared browser-harness target drift blocked deeper Options, narrow viewport, and reload persistence sub-areas

- Status: Open environment limitation
- Evidence: clean Cookie evidence ends at `08-after-export-escape.png`; contaminated drifted frames were removed
- Repro steps:
  1. Open Cookie Clicker in the shared Chrome browser-harness surface.
  2. Reach playable Cookie state and open Options.
  3. Attempt deeper Options scrolling and follow-up capture.
- Expected behavior: The harness should remain attached to the Cookie Clicker target for deeper settings, reload, and viewport checks.
- Actual behavior: The target drifted to an unrelated Kart tab during deeper scrolling. Contaminated captures were discarded.
- Impact: Prevented clean evidence for deeper lower Options, reload persistence comparison, and narrow/mobile viewport in this pass.
- Evidence clip: `supplemental-cookie-target-retention-followup.mp4 @ 00:00-00:14`
- Evidence status: Supplemental follow-up clip
- Why this evidence proves the finding: The supplemental clip shows a controlled current follow-up where the shared browser-harness target stayed on `https://orteil.dashnet.org/cookieclicker/` through Options open and three Options-scroll checkpoints, proving the old drift was an environment-limited historical blocker that is not reproduced in this clean follow-up.

### Low - Import/export modal activation was not proven in clean evidence

- Status: Open coverage limitation
- Evidence: `05-options-open-top.png`, `06-after-manual-save.png`, `07-export-save-modal.png`, `08-after-export-escape.png`
- Repro steps:
  1. Open Options.
  2. Locate Export save and Import save controls.
  3. Attempt activation without destructive actions.
- Expected behavior: Export/import controls should expose a safe text/modal boundary that is understandable without overwriting progress.
- Actual behavior: Clean evidence confirms the affordances and explanatory copy are visible, but modal activation was not conclusively captured before the environment drift.
- Impact: Nonblocking because controls are visible and described, but modal clarity remains partially unverified.
- Evidence clip: gameplay-recording.mp4 @ 00:02-00:04
- Evidence status: Main recording segment
- Why this evidence proves the finding: The recording shows the Options panel and save/export/import affordance area before the clean evidence ends, but it does not show a completed safe modal activation sequence.

### Low - Settings panel is dense and text-heavy on desktop

- Status: Open
- Evidence: `05-options-open-top.png`, `06-after-manual-save.png`, `08-after-export-escape.png`
- Repro steps:
  1. Open Options on the desktop viewport.
  2. Review visible settings and destructive controls.
- Expected behavior: Settings should remain readable and destructive controls should be visually separated.
- Actual behavior: Text is small and dense but readable at the tested desktop size. Wipe Save is strongly separated with red styling and warning copy.
- Impact: Acceptable on desktop, but reinforces the need for narrow/mobile capture in a stable harness pass.
- Evidence clip: gameplay-recording.mp4 @ 00:02-00:04
- Evidence status: Main recording segment
- Why this evidence proves the finding: The Options screen is visible in the main recording, showing the dense small-text settings layout and the separated destructive controls area at the tested desktop viewport.

## Coverage Table

| Area | Result | Evidence |
| --- | --- | --- |
| Direct provider load | Pass | `01-initial-load.png`, `02-cookie-reload-controlled.png` |
| Saved state readability | Pass | `02-cookie-reload-controlled.png` |
| Cookie click loop | Pass | `03-after-cookie-clicks.png` |
| Safe early purchase | Pass | `04-after-safe-grandma-purchase.png` |
| Store affordability/state | Pass | `03-after-cookie-clicks.png`, `04-after-safe-grandma-purchase.png` |
| Options access | Pass | `05-options-open-top.png` |
| Manual Save affordance | Pass | `06-after-manual-save.png` |
| Export/import affordances | Partial | `05-options-open-top.png`, `07-export-save-modal.png`, `08-after-export-escape.png` |
| Language control | Pass | `05-options-open-top.png` |
| Volume/audio controls | Pass | `05-options-open-top.png` |
| Visual/performance toggles | Pass | `05-options-open-top.png`, `08-after-export-escape.png` |
| Warning/destructive separation | Pass | `05-options-open-top.png` |
| Accessibility/screen-reader controls | Not proven | Target drift blocked deeper/lower Options coverage |
| Manual Save plus reload persistence | Environment-limited | Target drift blocked clean reload comparison |
| Narrow/mobile viewport | Environment-limited | Target drift blocked clean viewport attempt |
| Recording | Pass | `gameplay-recording.mp4` |

## Usability and Accessibility Assessment

The main play state is readable on desktop: cookie count, cookies per second, owned buildings, prices, and tooltips are visible. Options exposes many player-facing settings, including volume and visual/performance toggles. Destructive Wipe Save is visually separated with red styling and warning copy. The main accessibility concerns are small dense text, limited keyboard/focus evidence, and lack of clean narrow/mobile capture due to harness target drift.

## Performance and Load Assessment

The direct provider was responsive through the tested desktop path. Cookie clicks, store hover/purchase feedback, Options opening, and manual settings inspection responded without visible game crash or provider error. The only blocking behavior observed was the browser-harness target drift during deeper automation, which is classified as environment-limited.

## Discarded Evidence Note

Screenshots captured after the harness drifted to Arcade Kart Racer were removed from this evidence folder and are not used for the verdict. The MP4 was encoded only from uncontaminated Cookie Clicker screenshots.

## QA Methodology Carry-Forward

- In shared-window external QA, verify the active URL before and after long scroll/modal sequences, especially when other project tabs exist.
- If target drift occurs after core playable evidence is collected, discard contaminated frames and classify only the affected sub-area as `BLOCKED_ENVIRONMENT`.
- For idle/incremental games, capture a pre-click count, post-click count, purchase tooltip/owned count, and Options top-level controls before exploring deeper settings.
- Treat destructive reset/wipe controls as passable at the warning/separation boundary; do not confirm destructive progress loss.

## Approval Statement

Approved as `PASS_WITH_FINDINGS`. No provider retry is needed for basic Cookie Clicker playability. A future cleanup-stable pass could specifically target reload persistence, lower Options accessibility/screen-reader controls, and narrow/mobile viewport evidence.

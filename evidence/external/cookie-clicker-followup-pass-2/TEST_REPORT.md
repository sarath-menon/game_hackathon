# Cookie Clicker - Follow-up Pass 2

## Verdict: PASS_WITH_FINDINGS

## Test Inputs

- Attempted URL: `https://orteil.dashnet.org/cookieclicker/`
- Player manual path: `/Users/sarathmenon/Documents/game_hackathon/external-qa/cookie-clicker/README.md`
- Browser surface: shared Chrome window through browser-harness only
- Observed viewport: 782 x 859 narrow desktop browser viewport
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/cookie-clicker-followup-pass-2`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/cookie-clicker-followup-pass-2/gameplay-recording.mp4`
- Recording method: clean screenshots encoded to MP4 at 2 FPS

## Summary

The direct provider URL reached a playable Cookie Clicker state. Language was already English, no sign-in or personal-data flow was required, and the backup reminder was dismissible. Core gameplay remained responsive: cookie clicks increased the cookie count, an affordable Grandma purchase succeeded, cookie production increased from `0.2` to `1.2` per second, and the store showed `Grandma` owned count `1`.

Persistence is verified. After manual Save and reload, the distinctive state persisted: `Grandma` remained owned count `1`, CPS remained `1.2`, and the cookie count continued upward from the saved state.

Options coverage is substantially deeper than the prior pass. The menu exposed manual Save, Export save, Import save, Save to file, Load from file, language controls, volume, visual/performance toggles, sound-related toggle, warning toggles, screen-reader mode, mod data, and a visibly separated Wipe save control. Export and Import affordances were opened only to the safe modal level; no import data was pasted, and no reset/destructive action was taken.

## Severity-Rated Findings

### LOW - True mobile emulation could not be captured through the harness

- Status: Open / environment-limited sub-scope
- Evidence: `16-mobile-emulation-blocked-current-narrow.png`
- Repro steps:
  1. Attempt to use browser-harness CDP device metrics override for mobile viewport.
  2. Observe helper error before mobile screenshot capture.
- Expected behavior: capture a mobile/narrow emulated viewport.
- Actual behavior: CDP emulation returned a helper error. The active shared browser viewport was still a narrow desktop viewport at 782 x 859 and remained usable.
- Impact: Does not block game QA because the direct provider remained playable and the previously open persistence/options gaps were covered. True mobile capture should be retried if harness viewport support is repaired.

### LOW - Options menu is dense at narrow desktop width but remains usable

- Status: Nonblocking
- Evidence: `07-options-open.png`, `15-after-reload-persistence.png`, `16-mobile-emulation-blocked-current-narrow.png`
- Repro steps:
  1. Open Cookie Clicker at 782 x 859.
  2. Open Options.
- Expected behavior: settings controls remain discoverable and readable.
- Actual behavior: the options text is dense and the top navigation/store/game columns are crowded, but labels remain readable and controls are discoverable.
- Impact: Minor readability concern only; no severe overlap or blocker observed.

## Coverage Table

| Area | Result | Evidence / notes |
|---|---|---|
| Direct provider load | Pass | `01-direct-url-loaded.png` |
| Playable state reached | Pass | `02-playable-initial-state.png` |
| Banner/reminder path | Pass | Backup reminder dismissed in `04-before-state-change.png`; not blocking before dismissal. |
| Cookie click loop | Pass | `05-after-cookie-clicks.png`; count rose after clicks. |
| Purchase/store feedback | Pass | `06-after-safe-purchase.png`; Grandma owned count `1`, CPS `1.2`. |
| Manual Save | Pass | `08-after-manual-save.png` |
| Persistence/reload | Pass | `15-after-reload-persistence.png`; Grandma `1`, CPS `1.2`, cookies continued increasing. |
| Export save affordance | Pass | `11-export-save-modal.png`; safe export modal visible. |
| Import save safety | Pass | `13-import-save-modal.png`; prompt has paste area plus `Load` / `Nevermind`; no data submitted. |
| Save/load file affordances | Pass | `07-options-open.png`; `Save to file` and `Load from file` visible. |
| Language controls | Pass | `07-options-open.png`; `Language: English` and `Change language` visible. |
| Audio/sound controls | Pass | `07-options-open.png`; volume slider and `Alt cookie sound` toggle visible; game also had mute controls. |
| Visual/performance controls | Pass | Fancy graphics, CSS filters, Particles, Numbers, Milk, Cursors, Wobbly cookie visible. |
| Accessibility/readability controls | Pass | `Screen reader mode`, `Alt font`, `Short numbers`, and warning toggles visible. |
| Warning toggles | Pass | Closing warning, Lump confirmation, Fast notes visible. |
| Reset/destructive separation | Pass | `Wipe save` visibly separated with explanatory destructive text; not clicked. |
| Narrow desktop viewport | Pass with findings | 782 x 859 usable but dense. |
| True mobile emulation | Environment-limited | Harness CDP emulation blocked. |

## Usability / Accessibility Assessment

Important game state is readable: cookie count, CPS, bakery name, Options, store products, owned building count, and affordability are visible. The Options menu provides many toggles with short descriptions. Export and Import prompts explain their purpose and provide a non-destructive exit path. Destructive reset is separated from backup/import/export controls and preceded by clear text stating it deletes progress and achievements.

The UI is visually dense at the tested narrow desktop width, especially top navigation and Options, but no severe overlap, unreadable critical text, or softlock was observed.

## Performance / Load Assessment

Initial load and reload were responsive enough for testing. The game remained interactive during cookie clicking, purchase, Options navigation, export/import modal checks, and reload. No crash, provider wall, runtime blocker, or visible severe frame stall occurred.

## Provider / Environment Classification

Provider classification: playable. The direct official provider URL reached the game and supported the tested flow.

Environment classification: no whole-pass blocker. Only true mobile emulation was blocked by the local browser-harness CDP helper; desktop/narrow testing remained reliable.

## QA Methodology Carry-Forward

- For idle/incremental games, create a distinctive non-destructive state using both currency and production/owned-count changes, then manually save before reload comparison.
- Treat import/export as safety-critical: open modals only to verify clarity and exit paths; do not paste or submit data.
- Document destructive controls by visible separation and warning text without triggering reset.
- Separate viewport-tooling limitations from game verdict when the game remains playable and key state/settings coverage is complete.

## Final Approval / Retry Statement

Approved with findings. No alternate provider retry is needed. A future pass can focus specifically on true mobile emulation once browser-harness viewport support is available.

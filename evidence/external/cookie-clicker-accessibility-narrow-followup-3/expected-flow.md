# Cookie Clicker - Expected and Observed Flow

## Inputs

- Provider URL: `https://orteil.dashnet.org/cookieclicker/`
- Manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/cookie-clicker/README.md`
- Browser surface: single shared Chrome window through browser-harness
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/cookie-clicker-accessibility-narrow-followup-3/`

## Expected Flow

1. Open the direct Cookie Clicker provider URL and reach playable state.
2. Confirm visible cookie count, cookies per second, store, owned buildings, Options, and current bakery state.
3. Click the large cookie and verify the cookie count changes.
4. Make one safe early purchase and verify the store/owned-building state changes.
5. Open Options and inspect visible settings: save/export/import affordances, language, volume/audio, visual/performance toggles, warning toggles, accessibility/screen-reader mode if reachable, and destructive reset/wipe separation.
6. Use manual Save, then reload and compare visible state if the shared browser target remains reliable.
7. Attempt a narrow/mobile-like viewport if the harness can do so without destabilizing the shared target.
8. Write report, expected-flow, and MP4 evidence.

## Observed Flow

1. The direct provider URL reached playable Cookie Clicker state:
   - `01-initial-load.png`
   - `02-cookie-reload-controlled.png`
2. Existing local saved state was present and readable: bakery name, cookie count, cookies per second, store rows, owned Cursors/Grandmas, and Options button.
3. Cookie clicks increased visible cookies from the controlled loaded state:
   - `02-cookie-reload-controlled.png`
   - `03-after-cookie-clicks.png`
4. A safe early Grandma purchase changed visible store/building state: Grandma ownership increased to `2`, the price changed, and the Grandma tooltip described production:
   - `04-after-safe-grandma-purchase.png`
5. Options opened and exposed visible top-level settings and controls:
   - `05-options-open-top.png`
   - `06-after-manual-save.png`
   - `07-export-save-modal.png`
   - `08-after-export-escape.png`
6. Clean Options evidence showed:
   - Save, Export save, Import save, Save to file, Load from file
   - Change Language
   - Wipe Save separated by red styling and destructive warning copy
   - Volume slider at `75%`
   - Visual/performance toggles including Fancy Graphics, CSS Filters, Particles, Numbers, Milk, Cursors, Wobbly Cookie, Alt Cookie Sound, Icon Crates, Alt Font, Short Numbers, Fast Notes, Closing Warning, Extra Buttons, Lump Confirmation, Custom Grandmas, and Scary Stuff
7. The browser-harness target drifted to an unrelated Kart tab during deeper Options scrolling. Contaminated screenshots were removed from the active evidence folder and are not used for this verdict.
8. Because of that target drift, deeper Options scrolling, import modal activation proof, reload persistence comparison, and narrow/mobile viewport capture are marked environment-limited for this pass, not Cookie Clicker game failures.

## Recording

- `gameplay-recording.mp4`
- Method: uncontaminated Cookie Clicker screenshots encoded at 2 fps source cadence into a 30 fps H.264 MP4.


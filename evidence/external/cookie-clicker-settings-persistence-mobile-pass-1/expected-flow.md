# Cookie Clicker - Deeper Settings/Persistence/Narrow Pass 1 Expected/Observed Flow

Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/cookie-clicker-settings-persistence-mobile-pass-1`

## Expected Flow From Manual

1. Open `https://orteil.dashnet.org/cookieclicker/`.
2. Reach a playable Cookie Clicker state.
3. Resolve any visible language or cookie-consent setup prompts.
4. Click the large cookie to create visible cookie count state.
5. Attempt safe purchases when affordable and verify cookie count/production/store feedback.
6. Open Options and inspect save/export/import/settings/reset controls without destructive import/reset.
7. Verify persistence/reload of non-destructive state where safe.
8. Capture narrow/mobile viewport if supported.

## Observed Flow

1. `01-initial-load.png`: Direct URL loaded Cookie Clicker with a language modal, cookie banner, large cookie, store panel, and `Options` tab visible.
2. `02-language-modal.png`: Language modal was captured with English and multiple localized choices.
3. `03-after-language-english.png`: English selection was applied and the modal closed.
4. `04-after-cookie-banner-dismiss.png`: Cookie banner was dismissed through the visible `Got it!` button.
5. `05-after-cookie-clicks.png`: Repeated large-cookie clicks created visible cookie count and achievement/state feedback.
6. `06-after-first-purchase-attempt.png`: First purchase attempt captured store affordability/state feedback.
7. `07-after-more-clicks.png`: Additional cookie clicking increased visible state.
8. `08-after-second-purchase-attempt.png`: Store showed cursor purchase state, owned cursor count, cookies per second, and visible tooltip explaining cursor production.
9. `09-options-open.png`: Options tab opened successfully.
10. `10-options-after-scroll-down.png` and `11-options-after-scroll-up.png`: Options content was captured after scroll attempts.
11. `12-after-export-save-click.png`: Export-save control was clicked/captured without performing destructive import/reset.
12. `13-after-export-escape.png`: Escape/return from export state was captured with the game still playable.

## Recording Status

`gameplay-recording.mp4` is intended to be encoded from screenshots `01` through `13`.

If MP4 generation fails, the Markdown verdict still stands from the existing screenshot evidence; the recording issue should be treated as artifact-generation `BLOCKED_ENVIRONMENT`, not as game failure.

## Coverage Gaps

- Persistence/reload was not completed after the interruption.
- Narrow/mobile viewport was not captured in this attempt.
- Deeper audio/visual/accessibility toggles were only partially covered through visible Options evidence.
- Import/reset/destructive controls were not activated, by design.

# Dungeons & Degenerate Gamblers Demo - Shared-Window Retry 1 Expected/Observed Flow

Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-shared-window-retry-1`

## Expected Flow From Manual

1. Open `https://purplemosscollectors.itch.io/dndg`.
2. Launch the browser demo from the itch.io embedded player.
3. Use visible menu controls to start a new run.
4. Select a deck from readable deck choices.
5. Enter the first run node or tavern encounter.
6. Reach the first table/combat state.
7. Read player/enemy state, cards, values, consequences, and visible legal actions.
8. Use visible `HIT` / `STAND` or equivalent controls and verify feedback.
9. Check visible settings/options/audio/fullscreen/restart/give-up controls where practical.

## Observed Flow

1. `01-provider-loaded.png`: The assigned itch.io page loaded with a visible `Run game` button.
2. `02-provider-ready-before-run.png` and `03-after-run-game.png`: The demo launched inside the itch embed and reached the Dungeons & Degenerate Gamblers main menu. Visible controls included `New Run`, profile/player state, collection/statistics-style icons, social/external icons, and itch fullscreen.
3. `10-after-top-settings-icon-click.png`: A top menu icon opened a readable collection/statistics book, proving in-game menu input worked.
4. `14-after-book-back.png`: The `back` control returned from the book to the main menu.
5. `16-after-upper-newrun-region-click.png`: Clicking the visible Tavern logo/upper new-run area advanced to deck selection. The underlined `NEW RUN` label itself did not clearly respond to earlier clicks.
6. `17-after-unlocked-deck-click.png`: Deck selection showed one unlocked deck and multiple locked decks. Locked decks were visually marked by padlocks, and the footer read `Choose your deck. 1/19 unlocked.`
7. `18-after-choose-deck.png`: Selecting the unlocked deck showed a readable fan of cards and a `confirm` button.
8. `20-after-confirm-deck.png`: Confirming the deck entered a first tavern/node prompt with visible `ENTER` and flavor/tutorial text.
9. `23-after-bottom-action-click.png`: The first table/combat state loaded. Player and enemy score cards, HP, chip/currency values, draw piles, and large `HIT` / `STAND` controls were visible.
10. `25-after-hit-click.png`: `HIT` resolved immediately, changing card totals and dealing new visible cards to both sides.
11. `26-after-stand-click.png`: `STAND`/subsequent resolution changed visible state; player HP decreased from 100 to 90 and table cards updated.
12. `27-after-post-stand-hit-attempt.png`: A later action attempt kept the game in a readable table state with updated player and enemy totals and visible legal action controls.

## Recording

- `gameplay-recording.mp4` was encoded from the valid shared-window screenshot sequence at 10 FPS.
- The recording excludes the invalid `02-after-run-game.png` capture, which briefly showed the dashboard due to harness attachment drift before the Dungeons tab was explicitly reattached.

## Coverage Notes

- Main menu, deck selection, tavern entry, and first combat/table state were reached.
- Card-state readability and `HIT` / `STAND` feedback were verified at smoke depth.
- Settings/options coverage was partial: visible collection/statistics, social/external, and fullscreen-style controls were identified; audio/volume and deeper restart/give-up behavior were not fully exercised.

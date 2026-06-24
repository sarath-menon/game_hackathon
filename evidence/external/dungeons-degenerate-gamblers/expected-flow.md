# Expected Flow: Dungeons & Degenerate Gamblers Demo

Game URL: https://purplemosscollectors.itch.io/dndg

Manual: /Users/sarathmenon/Documents/game_hackathon/external-qa/dungeons-degenerate-gamblers/README.md

Evidence video: /Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers/gameplay-recording.mp4

## Expected Player Flow

1. Open the itch.io page and press the visible `Run game` button in the embedded player.
2. Wait through the Purple Moss Collectors loading/splash sequence.
3. On the main menu, start a run from the visible `New Run` option.
4. Choose the only unlocked starter deck, the Hearts deck, then use `choose for me` / `confirm`.
5. Confirm the visible Hearts deck card spread.
6. On the tavern map/story node, click the tavern/`ENTER` prompt.
7. In the table encounter, read the visible scoring rule: damage equals score difference and bust equals zero.
8. Read the player and bartender state:
   - Player score/card total and HP at upper left.
   - Bartender HP/chips and stand threshold at upper right.
   - Available `HIT` and `STAND` buttons in the center.
9. Use `HIT` to draw a card, then use `STAND` to resolve or pass the hand.
10. Observe HP/chip/card state updates after the action.

## Timestamp / Frame Notes

- `00:00-00:02`: itch page is loaded with the embedded player visible.
- `00:02-00:30`: game launches and displays developer splash/loading states.
- `00:30-00:36`: main menu becomes visible; `New Run` is reached through the center menu/logo area.
- `00:36-00:42`: deck-selection screen shows Hearts deck unlocked and other decks locked with explanatory text.
- `00:42-00:48`: Hearts deck confirmation spread is shown.
- `00:48-00:52`: tavern story/`ENTER` node appears.
- `00:52-00:55`: first table state is reached and at least one `HIT` action is demonstrated.

## State / Action Clarity Gate

PASS with minor issues. The table state communicates the current player score/card, opponent score/card, HP/chips, and immediate `HIT`/`STAND` actions clearly enough for black-box play. The start/menu hit targets are less clear than the table actions because clicking the text label alone was not consistently sufficient during exploratory testing.

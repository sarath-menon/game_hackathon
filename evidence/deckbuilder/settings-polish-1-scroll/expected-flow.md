# Ash Circuit Settings Polish 1 - Expected And Observed Flow

Test surface: `http://127.0.0.1:8765/games/deckbuilder/index.html`

Recording: `gameplay-recording.mp4`, 79 frames at 10 FPS, duration 7.9 seconds. The recording covers desktop and narrow viewport settings interactions, with narrow frames padded into the same MP4 canvas.

## Expected Flow

1. Load the hosted game and confirm the title/start state is usable.
2. Open Settings from the title/start state.
3. The Settings title and first setting, Animation speed, should be immediately visible without scrolling.
4. Scroll the settings panel downward until the bottom controls are reachable.
5. Close Settings, reopen from the title/start state, and verify it opens at the top again.
6. Change a setting with persistence enabled, reload, verify the changed setting persists, then Reset Defaults.
7. Start combat, open Settings from the combat header, and verify the Settings title and Animation speed control are immediately visible.
8. Scroll downward, close Settings, reopen from combat, and verify it opens at the top again.
9. Close Settings and verify combat input still works by playing a card and ending the turn.
10. Switch to a narrow viewport, open Settings, verify the panel starts at the top, then scroll internally to confirm Reset Defaults and Close remain reachable.

## Observed Timestamp Flow

- `00.0s`: Game loads at desktop viewport.
- `00.1s - 00.5s`: Settings opens from title/start state with title and Animation speed visible. Animation speed select rect: `y=207`, `bottom=246`, viewport height `953`.
- `00.8s`: Settings scrolled downward; Reset Defaults and Close are reachable near the bottom.
- `01.1s - 01.6s`: Settings reopens from title/start state at the top. Animation speed is visible again.
- `02.3s - 03.9s`: Text size Large persists across reload with persistence enabled; Reset Defaults restores Normal text and documented defaults.
- `04.2s - 04.8s`: Combat starts; Settings opens from combat header with title and Animation speed visible.
- `05.1s`: Settings scrolled downward during combat; Reset Defaults and Close are reachable.
- `05.3s - 05.7s`: Settings reopens from combat header at the top after being closed from a scrolled-down position.
- `05.8s - 06.0s`: Combat input still works after closing Settings. Strike plays and End Turn works.
- `06.4s - 07.0s`: Narrow viewport Settings opens at the top with title and Animation speed visible. Animation speed select rect: `y=278`, `bottom=317`, viewport height `820`.
- `07.5s`: Narrow viewport settings panel scrolls to bottom; Reset Defaults and Close are visible and reachable.

## Evidence Screenshots

- `02-title-settings-open-top.png`: Title/start Settings opens at top.
- `05-title-settings-reopen-after-scroll.png`: Title/start Settings reopens at top after downward scroll and close.
- `11-combat-settings-open-top.png`: Combat-header Settings opens at top.
- `14-combat-settings-reopen-after-scroll.png`: Combat-header Settings reopens at top after downward scroll and close.
- `18-narrow-settings-open-top.png`: Narrow viewport Settings opens at top.
- `19-narrow-settings-scrolled-bottom.png`: Narrow viewport bottom controls reachable.
- `15-card-play-after-settings.png`: Combat input still works after closing Settings.
- `16-end-turn-after-settings.png`: End Turn still works after closing Settings.

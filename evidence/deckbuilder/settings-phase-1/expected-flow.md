# Ash Circuit Settings Phase 1 - Expected And Observed Flow

Test surface: `http://127.0.0.1:8765/games/deckbuilder/index.html`

Recording: `gameplay-recording.mp4`, 593 frames at 10 FPS, duration 59.3 seconds. The capture includes desktop and narrow viewport checks, with narrow frames padded into the same MP4 canvas.

## Expected Flow

1. Title/start state exposes `Settings` and `Start Run`.
2. Settings panel opens from the title state and combat header, exposes all documented settings, can close, can reset defaults, and remains usable after repeated open/close.
3. Defaults are Standard animation, reduced motion off, Detailed previews, Normal text, confirmations off, Standard feedback, and persistence on.
4. Non-default settings visibly update active summary and game UI behavior.
5. Saved settings persist across reload when persistence is on.
6. With persistence off, changed settings apply for the current page only and are not retained after reload.
7. Reset Defaults restores all documented defaults.
8. Narrow viewport keeps the settings panel usable through scrolling.
9. Confirm End Turn blocks ending the turn until the browser confirmation is accepted.
10. Confirm no-guard turns warns before ending a 0-guard turn against an attacking intent.
11. Combat still supports card play, energy spending, draw/discard, enemy intent, enemy attacks, Focus/Fractured preview math, disabled reasons, reward choice, encounter 2 transition, final victory, defeat, and restart.

## Observed Timestamp Flow

- `00.0s`: Hosted game loads on desktop viewport. Start overlay and combat header both expose `Settings`.
- `00.4s - 01.4s`: Settings opens; defaults are visible through the active summary. Reset Defaults remains available.
- `01.8s - 03.5s`: Non-default settings are applied: Fast animation, Reduced Motion on, Compact tooltips, Large text, both confirmations on, Emphatic feedback, persistence on. Active summary updates accordingly.
- `04.2s - 04.6s`: Reload with persistence on retains all non-default settings.
- `04.8s - 07.0s`: Reset Defaults, turn persistence off, change text/tooltip, reload. After reload, defaults return and persistence is on.
- `07.9s - 09.1s`: Narrow viewport settings pass. Panel remains usable, but initial scroll position can clip the top settings until the panel is scrolled.
- `09.8s - 12.7s`: Confirm End Turn and Confirm no-guard turns both trigger browser confirmation dialogs. Cancel keeps the current player turn unchanged.
- `13.1s - 15.9s`: Combat settings adjusted during combat. Detailed card previews are visible and card play spends energy.
- `16.8s - 25.9s`: Enemy intent advances from Lance to Static Hex; enemy attack resolves; disabled cards show inline energy reasons.
- `25.9s - 37.5s`: Focus and Fractured math appears in card previews and resolves into the combat log.
- `28.9s`: Reward choice appears after encounter 1 with Flare Shot, Shield Loom, and Surge Plan.
- `29.8s - 37.5s`: Flare Shot is selected and appears in encounter 2; run status shows deck size 13 and reward: Flare Shot.
- `46.3s - 50.4s`: Encounter 2 completes. Final Victory screen appears.
- `53.7s - 59.2s`: Restart path begins a new run. Repeatedly ending turns without guard reaches Defeat.
- `59.3s`: Runtime error capture is empty.

## Supporting Screenshots

- `27-scroll-after-wheel-up.png`: Settings panel scrolled to top.
- `31-narrow-after-wheel-down.png`: Narrow viewport settings bottom controls.
- `32-reward-choice.png`: Reward choice after encounter 1.
- `33-disabled-reason.png`: Disabled card inline energy reason.
- `23-final-victory.png`: Final Victory state.
- `25-defeat-screen.png`: Defeat state.

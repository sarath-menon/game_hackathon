# Expected / Observed Flow - Ash Circuit Upgrade Phase 2

## Expected Flow

1. Load `http://127.0.0.1:8765/games/deckbuilder/index.html`.
2. From the title screen, Settings is discoverable. Audio feedback is off by default.
3. Reset Defaults restores audio feedback off, volume/muted state off if visible, detailed previews, standard feedback, and persistence on.
4. Start Run begins encounter 1 against Glass Warden with 40 player HP, 32 enemy HP, 3 energy, visible draw/hand/discard counts, Focus 0, and Fractured No.
5. Focus and Fractured chips expose rule text by hover/focus/click.
6. Before End Turn, the enemy intent panel shows the active intent chips and a next-intent preview from the deterministic cycle.
7. End Turn resolves the visible enemy intent and then shows Last enemy resolution chips for action, guard blocked, HP loss, and status application.
8. Static Hex applies Fractured. The next attack or mixed attack card has 2 damage reduced, then Fractured clears.
9. Focus adds +1 damage per Focus to every attack and mixed attack card. Card previews and combat log should match the final HP/guard/status outcome.
10. Winning encounter 1 opens reward choice. Choosing a reward adds it to the deck and starts encounter 2.
11. Winning encounter 2 shows Final Victory. New Run or Play Again restarts the deterministic run.

## Observed Clean Flow

1. Title loaded successfully: `01-title-first-load.png`.
2. Settings opened from title and showed documented controls: `02-title-settings-open.png`, `04-settings-top-verified.png`, `07-settings-after-end-key.png`.
3. Audio feedback was off by default and still off after Reset Defaults: `07-settings-after-end-key.png`, `08-after-reset-defaults-audio-off.png`.
4. Title returned after closing Settings: `09-title-after-settings-close.png`.
5. Combat started and showed player HP, guard, Focus, Fractured, energy, draw, hand, discard, enemy HP, and intent state: `13-combat-initial-intent.png`, `16-enemy-initial-intent-next-preview.png`.
6. Focus and Fractured help text was visible through status-chip interaction: `13-combat-initial-intent.png`, `14-fractured-help-click.png`.
7. Lance resolved with Last enemy resolution showing Lance, guard blocked, and HP loss: `29-after-lance-resolution-top.png`, `30-after-lance-resolution-intent.png`.
8. Static Hex became the active intent, showed Fractured in the active chips, then resolved with guard blocked, HP loss 0, and Fractured applied: `31-turn2-static-hex-before-actions.png`, `34-after-static-hex-resolution-top.png`, `35-after-static-hex-resolution-intent.png`.
9. With Focus 2 and Fractured Yes, attack previews showed Focus and Fractured math and Strike cleared Fractured: `36-turn3-focus-fractured-previews.png`, `37-turn3-after-strike-fractured-cleared.png`.
10. Heavy Spark then resolved with Focus-only damage as expected: `38-turn3-after-heavy-spark-focus-only.png`.
11. Crushing Arc resolved and the intent cycle returned to Lance with Static Hex as next preview: `39-after-crushing-arc-resolution-top.png`, `40-after-crushing-arc-resolution-intent.png`.
12. Blocking deviation: on turn 4, Focus 2 and Fractured No were visible, but Drive Plate preview still read `deal 4 damage (4 base +2 Focus)` and the card chip showed `Attack 4 / Guard 4`; Strike preview also showed inconsistent damage. Evidence: `41-turn4-focus-only-preview-bug.png`, `42-turn4-hand-preview-visible.png`.
13. Playing Drive Plate logged `dealt 4 damage, Focus added 2, gained 4 guard`; Glass Warden reached 0 HP and reward choice appeared. Evidence: `43-after-drive-plate-reward-screen.png`.

## Result

The expected flow fails at the Focus/mixed-card consequence step. Reward choice appeared, but encounter 2 transition, final victory, defeat, and full restart regression were not completed because the Focus preview/resolution mismatch is already a blocking local-game QA failure.

## Discarded Frames

Screenshots `17` through `24` are recovery/misclick frames and are not used for the verdict or expected-flow claims.

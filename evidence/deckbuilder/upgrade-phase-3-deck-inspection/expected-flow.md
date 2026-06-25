# Expected / Observed Flow: Ash Circuit - Upgrade Phase 3 Deck Inspection

## Expected Flow

1. Load `http://127.0.0.1:8765/games/deckbuilder/index.html`.
2. Title/start state shows run context, Settings, Inspect Deck, New Run, and combat controls.
3. Settings opens from the title state. Reset Defaults restores documented defaults, including generated audio off and volume at 0. Close Settings or Escape returns to the title/combat surface without trapping focus.
4. Starting combat shows player HP, guard, Focus, Fractured, energy, draw pile count, hand count, discard count, enemy HP, active enemy intent, next intent preview, and last enemy resolution.
5. Inspect Deck opens from combat and shows readable sections:
   - Current Deck
   - Hand
   - Draw Pile
   - Discard Pile
   - Exhaust / Removed, or explicit none
   - Recent Reward Additions, or explicit none
6. Card entries in the inspector show name, type, cost, concise effect text, and relevant chips.
7. Inspector counts match the HUD draw/hand/discard counts and visible hand state.
8. Escape and Close Inspection dismiss the inspector and return control to gameplay without playing a card, ending turn, or changing pile counts.
9. After playing a card, the HUD and inspector update: energy changes, hand count drops, discard count increases, and the played card appears in Discard Pile where expected.
10. End Turn resolves enemy intent, updates Last Enemy Resolution, advances the deterministic intent preview, and preserves visible state clarity.
11. Fractured status applies from enemy action, modifies the next attack/mixed card preview and resolution, then clears.
12. Winning encounter 1 opens reward choice. Inspect Current Deck opens from the reward state and still shows all deck zones.
13. Selecting a reward transitions to encounter 2. The updated deck count persists, and later inspection shows the selected reward in Current Deck, the relevant pile, and Recent Reward Additions.
14. New Run restarts back to encounter 1 cleanly.

## Observed Flow

1. The game loaded at the assigned URL. An early target-drift screenshot was discarded before verdict use; clean Deckbuilder evidence resumes at `02-recovered-title-load.png`.
2. Settings opened from title. Corrected Reset Defaults evidence at `15-after-correct-reset-defaults.png` showed audio feedback off, volume 0, Confirm End Turn off, and Confirm no-guard turns off. `16-after-correct-close-settings.png` showed the visible Close Settings control returning to the title surface.
3. Combat turn 1 loaded with 3/3 energy, draw 7, hand 5, discard 0, player HP 40/40, enemy HP 32/32, Lance as active intent, Static Hex as next intent, and no last enemy resolution (`17-combat-turn1-start.png`).
4. Inspect Deck opened from combat. The inspector showed Current Deck 12, Hand 5, Draw Pile 7, Discard Pile 0, Exhaust / Removed 0 with None, and Recent Reward Additions 0 with no reward added (`18-inspection-open-top.png`, `19-inspection-lower-sections.png`).
5. Escape closed the combat inspector without changing state (`20-after-escape-close-inspection.png`).
6. Playing Strike spent 1 energy, reduced enemy HP to 26, changed hand to 4, and changed discard to 1 (`21-after-playing-strike.png`). Reopening the inspector showed Strike in Discard Pile 1 with type, cost, and effect text (`22-inspection-after-strike.png`).
7. The visible Close Inspection button returned to combat without mutating state (`23-inspection-bottom-close-visible-attempt.png`, `24-after-close-inspection-button.png`).
8. Quick Study drew cards, Drive Plate/Heavy Spark/Strike combat actions resolved with readable previews/log feedback, and End Turn resolved the enemy action. Last Enemy Resolution showed Lance, guard absorption, and HP loss (`25-after-quick-study.png` through `27-after-end-turn-enemy.png`).
9. Static Hex later applied Fractured. Turn 3 previews showed Fractured-adjusted damage values, and the later reward state proved encounter 1 was won (`31-after-static-hex-turn.png`, `32-turn3-hand-fractured-previews.png`, `35-reward-inspect-current-deck.png`, `36-after-escape-close-reward-inspection.png`).
10. Reward-state Inspect Current Deck opened and showed the same deck zones with current hand/draw/discard state before reward selection (`35-reward-inspect-current-deck.png`). Escape returned to reward selection (`36-after-escape-close-reward-inspection.png`).
11. Selecting Flare Shot transitioned to encounter 2 with Deck 13 and reward: Flare Shot (`37-after-select-flare-shot-encounter2.png`).
12. Encounter 2 inspection showed Current Deck 13, Reward added: Flare Shot, Flare Shot listed in Current Deck, Flare Shot present in Draw Pile, and Recent Reward Additions 1 (`39-encounter2-inspection-after-reward.png`).
13. Escape closed the encounter 2 inspector and returned to gameplay (`40-after-escape-close-encounter2-inspection.png`).
14. New Run restarted to encounter 1 with Deck 12, draw 7, hand 5, discard 0, player HP 40/40, Glass Warden, and the opening hand restored (`41-after-new-run-restart.png`).

## Coverage Notes

- The shared Chrome viewport was `782 x 859`, which provided narrow desktop coverage. Dedicated mobile emulation was not used to avoid destabilizing the shared browser-harness surface.
- The final verdict is based on clean Deckbuilder URL evidence only. The discarded early target-drift screenshot is not used to support pass/fail findings.
- `34-after-heavy-spark-finisher.png` was a malformed capture and is not used as verdict evidence or as a frame in the final MP4. Adjacent reward and encounter-transition evidence proves the required flow.

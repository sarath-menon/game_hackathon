# Ash Circuit

Ash Circuit is a two-encounter, turn-based deck run. Defeat the first enemy, choose one reward card, carry the updated deck into the second encounter, and win the second fight for final victory.

## Objective

- Reduce each enemy HP to 0.
- After encounter 1, choose one reward card. The selected reward is added to your deck.
- Win encounter 2 to reach the **Final Victory** screen.
- If the player HP reaches 0 in either encounter, the run is lost.
- This phase has two fixed encounters only. There are no maps, shops, relics, random events, or additional fights.

## Controls

- Click **Start Run** to begin.
- Click **Settings** from the title screen or combat header to adjust readability, feedback, confirmations, and persistence.
- Click a card in your hand to play it.
- Read the card preview before clicking; it shows the current damage, guard, draw, and status outcome using active Focus or Fractured modifiers.
- Click **End Turn** when finished playing cards.
- Click one reward card after encounter 1 to add it to your deck and start encounter 2.
- Click **New Run** or **Play Again** to restart the deterministic run.

## Settings

Settings are available before starting and during combat.

- **Animation speed** changes HP bar timing, card trail speed, and floating feedback timing. Options are Relaxed, Standard, and Fast.
- **Reduced motion** removes card travel trails and removes most transition movement while keeping HP bars, previews, and feedback chips readable.
- **Tooltip detail** changes card previews. Detailed previews show Focus and Fractured math; Compact previews show final outcomes only.
- **Text size** changes the game UI between Small, Normal, and Large.
- **Confirm End Turn** shows a confirmation prompt before ending any player turn.
- **Confirm no-guard turns** warns before ending a turn with 0 guard while the enemy intends to attack.
- **Feedback intensity** changes floating damage, guard, draw, and status chip emphasis. Options are Quiet, Standard, and Emphatic.
- **Audio feedback** is off by default. The game plays no audio on first load and no audio after Reset Defaults. Turn this on in Settings to enable short generated feedback tones after player actions.
- **Persistence** saves settings to this browser using localStorage. When persistence is off, settings still apply for the current page but are not saved across reloads.
- **Reset Defaults** restores Standard animation speed, reduced motion off, Detailed previews, Normal text, confirmations off, Standard feedback, audio feedback off, and persistence on.

## Turn Rules

- Each player turn starts with 3 energy.
- A five-card hand is drawn at the start of each player turn.
- Playing a card spends its listed energy cost.
- Cards that cost more than your remaining energy are disabled and show a visible reason such as the energy needed and energy available.
- Ending your turn moves all unplayed hand cards to the discard pile.
- The enemy then resolves the intent shown in the center panel.
- Guard blocks the next enemy attack and resets to 0 after that attack.
- The enemy intent advances in a fixed cycle after each enemy turn.
- Player HP carries from encounter 1 into encounter 2.
- Guard, Focus, Fractured, energy, hand, draw pile, and discard pile reset at the start of each encounter.

## Enemy Intent

Encounter 1 is **Glass Warden** with 32 HP. It uses this repeating deterministic intent cycle:

1. **Lance**: attack for 6.
2. **Static Hex**: attack for 4 and apply Fractured.
3. **Crushing Arc**: attack for 9.

The active intent is shown before you end your turn, including its attack value and extra effect.

Encounter 2 is **Mirror Sentinel** with 42 HP. It uses this repeating deterministic intent cycle:

1. **Needle Burst**: attack for 7.
2. **Splinter Mark**: attack for 5 and apply Fractured.
3. **Overload Sweep**: attack for 10.

## Card Rules

- **Strike** costs 1 energy and deals 6 damage.
- **Heavy Spark** costs 2 energy and deals 10 damage.
- **Guard** costs 1 energy and gives 5 guard.
- **Brace** costs 2 energy and gives 9 guard.
- **Quick Study** costs 0 energy and draws 2 cards.
- **Drive Plate** costs 1 energy, deals 4 damage, and gives 4 guard.
- **Charge Coil** costs 1 energy and gives 2 Focus.

## Reward And Deck Update

After encounter 1, choose exactly one reward:

- **Flare Shot** costs 1 energy and deals 8 damage.
- **Shield Loom** costs 1 energy and gives 7 guard.
- **Surge Plan** costs 1 energy, deals 5 damage, and gives 5 guard.

The chosen reward is added to the run deck before encounter 2. The run status line shows the current encounter, deck size, and selected reward. Non-selected reward cards are not added.

## Status And Buff Rules

- **Focus** is a player buff. Each point of Focus adds 1 damage to every attack or mixed attack card.
- **Fractured** is a player debuff from Static Hex. It reduces the next attack or mixed attack card by 2 damage, then clears.
- Focus and Fractured are visible in the player status area.
- Card previews include Focus and Fractured changes before play, and the combat log reports the same resolved math after play.
- Guard still blocks only the next enemy attack and then resets to 0.

## Feedback Display

- Player and enemy HP are shown as numbers and animated HP bars.
- Damage, guard, draw, and status changes appear as floating feedback chips over the affected area.
- Played cards briefly travel toward the enemy, player, or center panel to show which target receives the effect.
- Disabled cards keep their card text visible and add an inline reason explaining why they cannot be played.

## Draw And Discard

- The starter deck order is fixed, so combat is deterministic.
- The selected reward is appended to the deck for encounter 2.
- Draw pile, hand, and discard pile counts are shown in the center panel.
- When the draw pile is empty and more cards are needed, the discard pile refills the draw pile in fixed order.

## Final Victory And Defeat

- Winning encounter 1 opens the reward choice instead of ending the run.
- Choosing a reward immediately starts encounter 2 with the updated deck.
- Winning encounter 2 shows **Final Victory**.
- Reaching 0 player HP in either encounter shows **Defeat**.

## Browser Requirements

- Use a current desktop browser with JavaScript enabled.
- The game is self-contained in `index.html` and uses no external assets or network resources.

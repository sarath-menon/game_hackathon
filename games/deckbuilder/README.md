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
- Click a card in your hand to play it.
- Click **End Turn** when finished playing cards.
- Click one reward card after encounter 1 to add it to your deck and start encounter 2.
- Click **New Run** or **Play Again** to restart the deterministic run.

## Turn Rules

- Each player turn starts with 3 energy.
- A five-card hand is drawn at the start of each player turn.
- Playing a card spends its listed energy cost.
- Cards that cost more than your remaining energy are disabled.
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
- Guard still blocks only the next enemy attack and then resets to 0.

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

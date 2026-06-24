# Ash Circuit

Ash Circuit is a single-fight, turn-based deck combat game. Defeat the Glass Warden by playing cards from a deterministic starter deck.

## Objective

- Reduce the enemy HP to 0 to win.
- If the player HP reaches 0, the fight is lost.
- This phase has one combat only. There are no rewards, deck upgrades, maps, shops, relics, status effects, or additional enemies.

## Controls

- Click **Start Combat** to begin.
- Click a card in your hand to play it.
- Click **End Turn** when finished playing cards.
- Click **New Combat** or **Play Again** to restart the deterministic fight.

## Turn Rules

- Each player turn starts with 3 energy.
- A five-card hand is drawn at the start of each player turn.
- Playing a card spends its listed energy cost.
- Cards that cost more than your remaining energy are disabled.
- Ending your turn moves all unplayed hand cards to the discard pile.
- The enemy then attacks once for 6 damage.
- Guard blocks the next enemy attack and resets to 0 after that attack.

## Card Rules

- **Strike** costs 1 energy and deals 6 damage.
- **Heavy Spark** costs 2 energy and deals 10 damage.
- **Guard** costs 1 energy and gives 5 guard.
- **Brace** costs 2 energy and gives 9 guard.

## Draw And Discard

- The starter deck order is fixed, so combat is deterministic.
- Draw pile, hand, and discard pile counts are shown in the center panel.
- When the draw pile is empty and more cards are needed, the discard pile refills the draw pile in fixed order.

## Browser Requirements

- Use a current desktop browser with JavaScript enabled.
- The game is self-contained in `index.html` and uses no external assets or network resources.

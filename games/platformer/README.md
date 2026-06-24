# Skyline Stepper

Skyline Stepper is a single-file browser game that scrolls across a rooftop route. Reach the green exit beacon at the far end of the level to complete the run.

## Objective

Start the run, move right through the side-scrolling level, collect glow cores, avoid red vent hazards, and touch the visible green `EXIT` beacon.

## Controls

- Start: `Enter` on the title screen or click `Start Run`
- Move: `A` / `D` or `Left Arrow` / `Right Arrow`
- Jump: `W`, `Up Arrow`, or `Space`

## Win Behavior

The level is complete when the player touches the green exit beacon. A `Level Complete` message appears and shows how many glow cores were collected plus how much health remained.

## Hazards And Damage

Red vent hazards damage the player on contact. Taking damage removes 1 health and respawns the player at the start of the level with a brief invulnerability blink. The run starts with 3 health.

If health reaches 0, the run ends and a summary shows how many glow cores were collected before failure.

## Collectibles

Blue glow cores are optional collectibles placed through the route. The HUD shows the current count and the total number available.

## Browser Requirements

Use a current desktop browser with JavaScript and HTML canvas enabled. The game is self-contained in `index.html` and does not require network assets.

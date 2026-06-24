# Expected Flow: Side-Scrolling Platformer Phase 3 Restart Retest

## Recording: Failure To Restart

- 0:00 - Title/run objective is visible with `Health: 3`, `Checkpoint: start`, `Cores: 0/8`, and `301 m`.
- 0:01 - Run starts with Enter.
- 0:02-0:04 - Player moves left into the documented red vent left of start and takes damage.
- 0:04-0:07 - Repeated vent contact reaches `Run Ended`, `Health: 0`, `Checkpoint: start`, `Cores: 0/8`, and the failure summary.
- 0:07-0:10 - Pressing Enter restarts to `Health: 3`, `Checkpoint: start`, `Cores: 0/8`, `301 m`; right movement is playable and collects a glow core.

## Completion Route Probe

- Start - Use Right Arrow to follow the safe lower-deck route.
- Around 205 m - First glow core is counted.
- Around 129 m - Mid-level checkpoint changes HUD to `Checkpoint: mid`.
- Around 3 m - Green EXIT is reached and `Level Complete` reports `1/8` glow cores and 3 health.
- After completion - Pressing Enter resets to `Health: 3`, `Checkpoint: start`, `Cores: 0/8`, `301 m`.

# Expected And Observed Flow - Platformer Upgrade Phase A

Game: Side-Scrolling Platformer / Skyline Stepper
Upgrade phase: Upgrade Phase A, Movement Feel Pass
Recording: `gameplay-recording.mp4`
Browser surface: `http://127.0.0.1:8765/games/platformer/index.html`

## Expected Visible Flow

1. Title screen loads with a clear start affordance and the documented objective to reach the green EXIT beacon.
2. Press `Enter` to start. HUD resets to `Health: 3`, `Checkpoint: start`, `Cores: 0/8`, and an exit distance near 301 m.
3. Basic movement responds to documented controls: right movement advances the camera, left movement is available, platforms remain solid, gravity returns the player to the route.
4. Movement-feel sequence:
   - A short jump tap produces a lower hop.
   - A held jump produces a higher, floatier arc.
   - Releasing jump early cuts the jump without causing accidental extra jumps.
   - Near-edge and near-landing jump inputs are forgiving enough for normal route play.
   - Landing/player-state feedback remains visible and does not obscure hazards or route markers.
5. Lower-deck route remains readable: continue right, collect visible glow cores when encountered, avoid optional upper hazards/patrols, and follow route markers toward the exit.
6. Mid-level checkpoint marker activates when touched. Later damage should respawn the player at the active checkpoint.
7. Red vents and orange patrol runners remain visually dangerous. Repeated damage can reach `Run Ended`; pressing `Enter` from failure restarts with health and cores reset.
8. Touching the green EXIT beacon triggers `Level Complete`, including collected core count and remaining health.
9. Pressing `Enter` from completion restarts the run with full health, start checkpoint, and `Cores: 0/8`.

## Recording Timestamp Notes

- 0:00-0:01 - Hosted game is loaded on the title/start state; canvas and HUD are visible.
- 0:01-0:02 - Run starts with `Enter`; objective and HUD reset are visible.
- 0:02-0:04 - Short-tap and held-jump probes are performed near the start, showing normal jump response and landing recovery.
- 0:04-0:06 - Player advances right on the lower route; camera follows and a glow core is collected.
- 0:06-0:08 - Mid-level checkpoint is reached and the lower-deck route remains clear.
- 0:08-0:10 - Player continues right through the safe route toward the green EXIT beacon.
- 0:10-0:11 - `Level Complete` summary appears with collected cores and remaining health.
- 0:11-0:12 - Pressing `Enter` restarts from completion; HUD returns to full health, start checkpoint, and `Cores: 0/8`.

## Additional Probe Notes

- Failure and restart were separately probed through the documented red vent left of start. Repeated contact produced `Run Ended` at `Health: 0`; pressing `Enter` restarted the run with `Health: 3`, `Checkpoint: start`, and `Cores: 0/8`.
- Checkpoint recovery was separately probed by activating the mid-level checkpoint, taking damage afterward, and observing recovery at the active checkpoint.
- No blocking console/runtime errors were observed during the recorded run or regression probes.

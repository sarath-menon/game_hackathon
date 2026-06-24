# Arcade Kart Racer Phase 3 Expected Flow

Evidence recording: `gameplay-recording.mp4`

## Intended visible route

1. Start screen shows the kart at the opening bend with HUD objective text, `LAP 0/1`, `NEXT CP1`, visible blue CP1/CP2/CP3 labels, cyan `BOOST` pads, red `CONE` / `BARRIER` labels, yellow `FINISH`, and a minimap marker cluster.
2. Press Enter or Space to start. The first action is to accelerate toward CP1 on the road between the white guard rails.
3. Clear CP1. HUD advances from `NEXT CP1` to `NEXT CP2`.
4. Continue through the bend toward CP2. If approaching the red barrier/cone area, the red obstacle label and object are visibly distinct from checkpoint and finish gates.
5. Hit a red barrier or cone. Expected feedback is a speed loss/bump plus message such as `BARRIER hit: recover with throttle and steering.` The kart should remain recoverable.
6. Accelerate back onto the route and hit a cyan `BOOST` pad. Expected feedback is a speed surge, higher speed-bar value, visual streaks, and message such as `Boost pad hit: speed surge.`
7. Clear CP2, then CP3. HUD advances in order: `CP1 -> CP2 -> CP3 -> Finish`.
8. Cross the yellow finish gate only after the ordered checkpoints. HUD reaches `LAP 1/1`, `NEXT Done`, and the Race Complete screen reports final time.
9. Press `R` after completion. The race resets to `LAP 0/1`, `NEXT CP1`, speed 0, and the start route is available again.

## Recording timestamp list

- `00:00.0`: Hosted game on start screen; manual controls and Phase 3 objective visible.
- `00:00.8`: Race started; HUD shows `LAP 0/1`, `NEXT CP1`; route, minimap, boost pads, obstacles, checkpoints, and finish are visible.
- `00:01.4`: Kart moves through CP1 toward CP2.
- `00:02.0`: Red obstacle interaction path; expected/observed recoverable barrier feedback.
- `00:02.4`: Cyan boost interaction; expected/observed speed surge feedback.
- `00:02.8`: Ordered checkpoint route continues through CP3 toward the yellow finish.
- `00:03.1`: Race Complete screen with `Lap 1/1` and final race time.
- `00:03.3`: Restart check returns to the reset state with `LAP 0/1` and `NEXT CP1`.

## Supplemental probe frames

- `probes/combined-00.png`: Start-state route readability.
- `probes/combined-03.png`: Barrier hit feedback while still recoverable.
- `probes/combined-04.png`: Boost pad hit and speed surge feedback.
- `probes/combined-05.png`: Race Complete after ordered checkpoints and finish.

# Expected And Observed Flow - Platformer Settings Phase 1

Game: Side-Scrolling Platformer / Skyline Stepper
Upgrade: Settings Panel Phase 1
Recording: `gameplay-recording.mp4`
Recording format: full-page browser-harness/CDP frame capture encoded at 8 FPS

## Expected Flow

1. Load the hosted game and confirm the title/start state exposes Settings.
2. Open Settings from the title/start state using the documented `Escape` shortcut or visible Settings button.
3. Verify the panel lists all documented settings: Jump Assist, Camera Smoothing, Camera Lookahead, Route Marker Intensity, Effect Intensity, Reduced Motion, HUD/Text Size, Generated UI Sounds, Volume, Reset Defaults, and Close Settings.
4. Change settings, close the panel, reload, and confirm changed values persist.
5. Use Reset Defaults and confirm the original values are restored and saved.
6. Start active play, move right, open Settings during play, and confirm gameplay pauses.
7. While Settings is open, press movement and jump inputs; expected result is no player movement or leaked jump.
8. Close Settings and confirm gameplay resumes.
9. Complete the lower-deck route, collect at least one glow core, reach the green EXIT beacon, and confirm Level Complete summary.
10. Open Settings from the completion/result context, close it, and restart.
11. Check the panel at a narrower viewport and confirm controls remain reachable and usable.
12. Trigger failure through the documented red vent left of start, confirm Run Ended summary, open Settings from the failure/result context, close it, and restart.

## Recorded Timestamp / Frame Notes

- 0:00 / frame 1 - Title/start state loaded.
- 0:00 / frame 2 - Settings opened from title/start via `Escape`.
- 0:00 / frame 3 - Settings changed from prior values: jump assist, camera, marker, effects, reduced motion, HUD size, UI sounds, and volume controls visibly update.
- 0:01 / frames 4-6 - Settings closed, page reloaded, Settings reopened; changed values persist after reload.
- 0:01 / frame 7 - Reset Defaults clicked.
- 0:01 / frame 8 - Settings closed after reset defaults.
- 0:01 / frame 9 - Run started with reset HUD.
- 0:01-0:02 / frames 10-14 - Player moves right before pausing.
- 0:02 / frame 15 - Settings opened during active play; HUD shows `Settings paused`.
- 0:02-0:03 / frames 16-21 - Movement and jump inputs sent while Settings is open; exit distance remains unchanged.
- 0:03 / frame 22 - Settings closed during active play.
- 0:03-0:18 / frames 23-143 - Lower-deck route traversal, core collection, checkpoint, camera follow, jumps, hazards avoided, and exit approach.
- 0:18 / frame 144 - Level Complete reached with summary visible.
- 0:18 / frames 145-147 - Settings opened and closed from completion context; run restarts with reset HUD.
- 0:18-0:19 / frames 148-150 - Narrow viewport check; Settings remains scrollable and controls remain reachable.
- 0:19-0:21 / frames 151-168 - Failure route through the red vent left of start reaches Run Ended.
- 0:21 / frame 169 - Settings opened from failure/result context.
- 0:21 / frame 170 - Restart from failure returns to normal playable state with full health and reset cores.

## Additional Probe Notes

- Pause/input leak check: exit distance was 269 m when Settings opened during active play, remained 269 m after movement and jump inputs while open, then advanced to 237 m after closing Settings and resuming movement.
- Persistence check: changed settings persisted after reload; Reset Defaults restored Jump Assist `standard`, Camera Smoothing `12`, Camera Lookahead `42`, Route Marker Intensity `100`, Effect Intensity `100`, HUD/Text Size `normal`, Generated UI Sounds off, Reduced Motion off, and Volume `45`.
- Audio probe: with Generated UI Sounds enabled and Volume set to 80%, normal start/jump/collection actions produced browser Web Audio context, gain, and oscillator-start events.
- No page error or unhandled rejection was captured during the main run.

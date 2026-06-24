# PolyTrack Expected Flow

Game URL: https://www.kodub.com/apps/polytrack

Manual reference: /Users/sarathmenon/Documents/game_hackathon/external-qa/polytrack/README.md

## Expected Player Flow

1. Open the PolyTrack URL.
2. The loading screen should complete without an uncaught runtime error.
3. If a hardware acceleration warning appears, the player should be able to acknowledge it and continue, or the game should clearly explain that play is blocked.
4. The main menu or start screen should become visible.
5. Visible UI should expose controls, start/play entry point, restart/reset behavior, and any graphics/audio/options controls that are available.
6. After focusing the game, documented or visible driving controls should move the car immediately.
7. The track, car position, route direction, and timing/run feedback should be readable from the start.
8. Restart/reset should return the run to a clean starting state.

## Observed Flow

1. The URL loaded in the required browser-harness remote browser.
2. PolyTrack displayed an unexpected error screen before the main menu or gameplay.
3. The screen reported: `Uncaught TypeError: Cannot read properties of undefined (reading 'autoReset')`.
4. A modal warning stated that hardware acceleration is disabled and may reduce performance.
5. Using the visible `Reset Settings` and `Reload` controls did not recover the game; the same error state returned.
6. Acknowledging the hardware acceleration warning with `OK` did not expose a playable menu or driving surface.

## Evidence Timeline

- `00:00-00:02`: Startup error visible with hardware acceleration warning.
- `00:02-00:04`: Reset/recovery attempt evidence.
- `00:04-00:06`: Reload returns to the same uncaught `autoReset` startup error.
- `00:06-00:08`: Warning acknowledged; gameplay remains blocked by the error screen.

## Result

The expected gameplay flow is blocked at startup. No route, driving, restart, timing, settings, or responsive gameplay checks can be completed until the game reaches the menu or playable track.

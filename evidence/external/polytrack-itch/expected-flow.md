# PolyTrack Itch.io Retry Expected Flow

Game: PolyTrack

Attempt: Retry 1, official Itch.io provider path

Game URL: https://kodub.itch.io/polytrack

Manual: /Users/sarathmenon/Documents/game_hackathon/external-qa/polytrack-itch/README.md

## Expected Flow

1. Open https://kodub.itch.io/polytrack.
2. Itch.io provider page loads without an auth wall or consent/ad blocker.
3. Click the visible `Run game` button.
4. The embedded game frame loads.
5. PolyTrack reaches a playable menu or track.
6. Click inside the game frame if needed for keyboard focus.
7. Use `WASD` or arrow keys to drive.
8. Confirm the track, car position, route, and timing/run feedback are readable from the starting camera.
9. Use `R` or `Enter` to restart and verify the run returns to a clean starting state.
10. Inspect visible fullscreen, audio, graphics, control, editor, quality, or reset options if present.

## Observed Flow

1. The Itch.io provider page loaded successfully.
2. A visible `Run game` button was present.
3. Clicking `Run game` created a visible embedded iframe:
   `https://html-classic.itch.zone/html/17754954/index.html?v=1782203181`
4. The game frame then displayed a PolyTrack runtime error before any playable menu or track:
   `Uncaught TypeError: Cannot read properties of undefined (reading 'autoReset')`
5. The same frame also displayed a hardware acceleration warning:
   `Hardware acceleration is disabled. Performance may be reduced. Please make sure hardware acceleration is enabled in your browser settings.`
6. Clicking `OK`, `Reset Settings`, and `Reload` did not reach a playable state.

## Evidence Timeline

- `00:00-00:02`: Itch.io provider page with visible `Run game`.
- `00:02-00:04`: Embedded game iframe after clicking `Run game`; PolyTrack startup error is visible.
- `00:04-00:06`: Hardware acceleration warning acknowledged.
- `00:06-00:08`: Visible reset/recovery attempt.
- `00:08-00:10`: Reload returns to the same blocked startup/error state.

## Result

The Itch.io provider path is reachable and creates the expected game iframe, but the browser-harness remote environment blocks reliable evaluation because the game reports disabled hardware acceleration and fails at startup before gameplay. This retry should be classified as `BLOCKED_ENVIRONMENT`, not as a final PolyTrack gameplay failure.

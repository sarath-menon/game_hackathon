# Stretchy Cat Expected And Observed Flow

## Surface Discovery

- Opened AI Studio URL: `https://aistudio.google.com/apps/bundled/stretchy_cat?showPreview=true&showAssistant=true&fullscreenApplet=true`
- AI Studio loaded without login or permission blocking.
- The playable surface appeared inside a visible `Preview` iframe:
  - `https://3mueeedfnj4nguehotpt8s2kolfqdmb5lnxulgjxzn816mk6q1-h933114957.scf.usercontent.goog/console-embed/shim.html?origin=https%3A%2F%2Faistudio.google.com&cache=1`
- Opening that iframe URL directly produced a blank SafeContentFrame shim, so testing continued on the AI Studio embedded preview as the playable black-box surface.

## Visible Rules

The in-game tutorial card states:

- Stretch and solve.
- Stretch the cat and fill every space on the board.
- End at the finish flag.
- Gather fish and stars to earn extra time while racing against the clock.

No explicit keyboard or pointer control instructions were visible. Arrow-key movement was discovered by focusing the game area and probing standard grid controls.

## Observed Successful Level 1 Flow

The successful run used the retry-generated Level 1 layout shown in `completion_frames/frame_000_start_new_layout.png`.

1. Start state: cat is on the lower-left light tile, fish is on the top row, and the flag is on the top row.
2. Press `ArrowUp`: cat stretches upward and occupies the next light tile.
3. Press `ArrowRight`: cat stretches right.
4. Press `ArrowUp`: cat stretches upward.
5. Press `ArrowLeft`: cat stretches left to cover the remaining left-side light tile.
6. Press `ArrowUp`: cat reaches the top-left light tile.
7. Press `ArrowRight`: cat moves through the fish tile and the fish is collected.
8. Press `ArrowRight`: cat reaches the finish flag after the visible light tiles are filled.
9. Result: game advances to `Level 2/12 - 90 Points`, with a new board, fish, flag, timer, score, and reset button visible.

## Additional Observations

- Initial tutorial modal can be dismissed with the close button.
- Timer and score are visible below the board.
- The first slow exploratory attempt timed out and displayed `Oh no! You ran out of time`, `20 Points`, and a `Retry` button.
- The `Retry` button is actionable when clicked at its actual visual center and regenerates a Level 1 board.

## Evidence Frame List

- `ai-studio-initial.png`: first AI Studio load, before full preview render.
- `ai-studio-after-wait.png`: AI Studio shell with preview iframe discovered.
- `direct-preview-initial.png`: direct SafeContentFrame URL, blank when opened outside AI Studio parent.
- `ai-studio-wait-10.png`: playable game visible with tutorial card.
- `control-test-after-close.png`: tutorial dismissed, Level 1 board visible.
- `control-test-arrow-right.png`: arrow movement collects fish and adds time/points.
- `control-test-arrow-up.png`: second movement confirms keyboard movement.
- `frames/frame_009_after_completion_wait.png`: exploratory timeout state.
- `after-retry-targeted.png`: retry returned to a playable board.
- `completion_frames/frame_000_start_new_layout.png` through `completion_frames/frame_008_after_result.png`: successful Level 1 completion sequence.
- `gameplay-recording.mp4`: MP4 assembled from successful completion frames at 4 FPS.

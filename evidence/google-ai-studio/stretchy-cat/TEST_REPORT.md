# Stretchy Cat Black-Box Test Report

## Game And Verdict

- Game: Stretchy Cat, hosted Google AI Studio app
- Verdict: `PASS`
- Final statement: The hosted game is playable in the AI Studio embedded preview. AI Studio loads without an auth wall, the game accepts keyboard input, Level 1 can be completed, and completion advances to Level 2.

## Test Inputs

- AI Studio URL: `https://aistudio.google.com/apps/bundled/stretchy_cat?showPreview=true&showAssistant=true&fullscreenApplet=true`
- Discovered preview iframe URL: `https://3mueeedfnj4nguehotpt8s2kolfqdmb5lnxulgjxzn816mk6q1-h933114957.scf.usercontent.goog/console-embed/shim.html?origin=https%3A%2F%2Faistudio.google.com&cache=1`
- Direct preview result: blank SafeContentFrame shim when opened standalone, so gameplay was tested in the AI Studio embedded preview.
- Browser/harness: browser-harness via local Chrome CDP
- Viewport: 1728 x 996 CSS pixels; screenshots captured at 3456 x 1992 device pixels
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/google-ai-studio/stretchy-cat/`
- Recording method: CDP screenshots captured after each visible action, assembled with `ffmpeg` at 4 FPS into `gameplay-recording.mp4`

## Access Result

- AI Studio page loads: Yes
- Login/auth wall: No
- Playable iframe found: Yes, `Preview` iframe covering the main viewport
- Direct iframe URL standalone playable: No, it loads as a blank shim without the AI Studio parent
- Tested black-box surface: AI Studio embedded preview

## Manual And Rules Discovery

Visible tutorial text explains the objective:

- Stretch the cat and fill every board space.
- End at the finish flag.
- Collect fish and stars for extra time.
- Race against the clock.

Controls were not explicitly stated in the visible tutorial. Arrow keys were discovered by focusing the game area and probing standard grid controls.

## Gameplay Findings

- Dismissing the tutorial reveals a grid board with cat, fish, flag, timer, score/level HUD, and reset button.
- `ArrowRight` moved the cat one cell, collected the fish, increased the timer from 15 seconds to 20 seconds, and increased score from 0 to 10 points.
- `ArrowUp` moved the cat again and increased score to 20 points.
- A slow exploratory attempt produced a timeout fail state with message `Oh no! You ran out of time`, score, and Retry button.
- Retry returned to a playable Level 1 board.
- A fresh Level 1 board was completed with `ArrowUp`, `ArrowRight`, `ArrowUp`, `ArrowLeft`, `ArrowUp`, `ArrowRight`, `ArrowRight`.
- Completion advanced the game to `Level 2/12 - 90 Points`.

## Usability And Readability

- Objective clarity: `PASS`. The tutorial clearly describes filling the board, ending at the flag, and collecting fish/stars for time.
- State clarity: `PASS`. Level, points, timer, cat, fish, flag, traversable light tiles, blocked dark tiles, reset, timeout, and next level are visually understandable.
- Control clarity: `WARN`. The visible tutorial does not name arrow keys or alternative controls. The game is still playable after probing, but first-time desktop players may not know how to move without guessing.

## Bugs And Risks

### Medium: Visible Tutorial Omits Controls

- Severity: Medium
- Status: Open
- Repro steps:
  1. Open the AI Studio game.
  2. Read the visible tutorial card.
  3. Close the tutorial and inspect the HUD.
- Expected behavior: The visible instructions should state how to move the cat, such as arrow keys or swipe/drag controls.
- Actual behavior: The tutorial explains the goal but not the controls. Arrow-key movement had to be discovered by probing.
- Evidence: `ai-studio-wait-10.png`, `control-test-after-close.png`

### Low: Standalone Preview Shim Is Blank

- Severity: Low
- Status: Known access behavior
- Repro steps:
  1. Open the discovered `*.usercontent.goog/console-embed/shim.html` URL directly.
- Expected behavior: If this were the standalone hosted game URL, it would load the playable surface.
- Actual behavior: It renders a blank SafeContentFrame page. The game is playable in the AI Studio embedded preview.
- Evidence: `direct-preview-initial.png`

## Evidence List

- Report: `/Users/sarathmenon/Documents/game_hackathon/evidence/google-ai-studio/stretchy-cat/TEST_REPORT.md`
- Expected/observed flow: `/Users/sarathmenon/Documents/game_hackathon/evidence/google-ai-studio/stretchy-cat/expected-flow.md`
- Gameplay recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/google-ai-studio/stretchy-cat/gameplay-recording.mp4`
- Screenshots and frame folders:
  - `/Users/sarathmenon/Documents/game_hackathon/evidence/google-ai-studio/stretchy-cat/*.png`
  - `/Users/sarathmenon/Documents/game_hackathon/evidence/google-ai-studio/stretchy-cat/completion_frames/`

## Approval Statement

`PASS`: The game is accessible and playable through the AI Studio embedded preview, with a demonstrated Level 1 completion and transition to Level 2. The main remaining issue is a non-blocking usability gap: controls are not documented in the visible tutorial.

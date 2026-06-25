# Townscaper Web - Expected and Observed Flow

## Inputs

- Provider URL: `https://oskarstalberg.com/Townscaper/`
- Player manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/townscaper/README.md`
- Browser surface: shared Chrome window through browser-harness only
- Viewport: 782 x 859 desktop viewport

## Expected Flow

1. Open the direct Townscaper Web URL.
2. Wait through WebGL startup until a playable scene appears.
3. Establish a stable camera view around an isolated, visible placement target.
4. Use visible/manual-supported controls to place or modify a block and confirm immediate visual feedback.
5. Use alternate click or removal tool behavior to remove the placed block and confirm the before/after state changes.
6. Try common undo/redo shortcuts or visible controls if available, and verify whether the removed block can be restored or whether the behavior is unsupported/unclear.
7. Exercise the gear/settings/help control and verify whether it opens a readable panel, toggles a state, or appears inert.
8. Use mouse drag and wheel controls to verify camera movement and zoom after placement/removal attempts.
9. Record usability, accessibility, and performance observations.

## Observed Flow

1. The direct provider URL reached a playable WebGL scene after a slow but finite startup sequence:
   - `01-initial-load.png`
   - `02-after-5s.png`
   - `03-after-12s.png`
   - `04-after-22s.png`
2. The scene showed a small Townscaper island/building, a gear icon, and color swatches.
3. Early placement attempts on visually plausible roof/tower targets did not create an obvious change:
   - `05-placement-before.png`
   - `06-after-blue-swatch.png`
   - `07-after-placement-click.png`
   - `08-before-tower-top-placement.png`
   - `09-after-tower-top-placement.png`
   - `10-before-screenshot-pixel-placement.png`
   - `11-after-blue-swatch-screenshot-pixel.png`
   - `12-after-roof-placement-screenshot-pixel.png`
4. Gear/settings/help clicks through visible target attempts did not open a visible panel or show readable help/settings state:
   - `13-after-gear-css-click.png`
   - `14-after-gear-screenshot-pixel-click.png`
   - `15-after-gear-raw-cdp-click.png`
5. A camera drag exposed a white outlined placement cell, giving a clearer target:
   - `16-before-camera-drag.png`
   - `17-after-camera-drag.png`
   - `18-before-outlined-cell-click.png`
6. Clicking the outlined cell placed a clearly identifiable detached platform/roof section to the right of the main building:
   - `19-after-outlined-cell-click.png`
   - `20-before-right-click-removal.png`
7. Right-click removal deleted that placed structure and returned the scene to the prior layout:
   - `21-after-right-click-removal.png`
   - `22-current-before-undo.png`
8. Ctrl+Z, Cmd+Z, and Ctrl+Shift+Z did not visibly restore the removed block or show undo/redo feedback:
   - `23-after-ctrl-z-undo.png`
   - `24-after-cmd-z-undo.png`
   - `25-after-ctrl-shift-z-redo.png`
9. Mouse wheel zoom visibly changed camera distance and framing:
   - `26-after-wheel-zoom-in.png`
   - `27-after-wheel-zoom-out.png`
10. A later empty-area drag rotated the camera to a different side of the building, proving the scene remained interactive after placement/removal:
    - `28-after-empty-area-camera-drag.png`

## Recording

- Continuous evidence recording: `gameplay-recording.mp4`
- Method: saved browser-harness screenshots encoded at 2 fps source cadence into a 30 fps H.264 MP4.


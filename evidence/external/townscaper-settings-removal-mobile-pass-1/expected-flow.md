# Townscaper Web - Deep Settings/Removal/Mobile Pass 1 Expected/Observed Flow

Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/townscaper-settings-removal-mobile-pass-1`

## Expected Flow From Manual

1. Open `https://oskarstalberg.com/Townscaper/`.
2. Wait for the direct WebGL scene to load.
3. Use visible controls and normal clicks to place or modify blocks.
4. Select a different visible color swatch and place/modify again.
5. Try visible/manual-described removal or undo behavior.
6. Try the visible gear/settings control.
7. Verify camera drag/orbit and scroll zoom if the harness can capture it.
8. Verify narrow/mobile viewport behavior if the harness can capture it without leaving the shared Chrome window.

## Observed Flow

1. `01-initial-load.png`: The direct Townscaper URL initially showed a loading/progress bar.
2. `02-after-long-load-wait.png`: After a longer wait, the WebGL scene loaded into a playable state with an island, building, left-side color swatches, and a gear icon.
3. `03-playable-scene.png`: The scene remained readable and interactive at desktop viewport size.
4. `04-after-place-click-1.png` and `05-after-place-click-2.png`: Placement/modification clicks were attempted on the existing structure. The scene remained stable and responsive, though the visual delta is subtle from the captured angle.
5. `06-after-color-swatch-select.png`: A different color swatch was selected from the visible palette.
6. `07-after-place-with-new-color.png`: A placement/modification click was attempted after color selection.
7. `08-after-right-click-removal-attempt.png`: Right-click removal was attempted using the manual's likely alternate-click expectation. No clearly visible removal feedback was captured.
8. `09-after-ctrl-z-undo-attempt.png` and `10-after-cmd-z-undo-attempt.png`: Keyboard undo attempts were captured. No clearly visible undo feedback was captured.
9. `11-after-gear-click.png` and `12-after-gear-second-click.png`: Gear clicks were captured. No readable settings/options panel appeared.
10. `13-after-left-drag-camera.png`: Camera drag/orbit was captured, showing a changed framing/position of the scene.
11. `14-after-scroll-zoom-in.png` and `15-after-scroll-zoom-out.png`: Scroll zoom in/out was captured with visible camera distance/framing changes.
12. `16-mobile-viewport.png`: A narrow/mobile-like viewport was captured. The scene remained rendered and readable, and color swatches moved to the bottom.
13. `17-mobile-after-center-click.png`: A center click in narrow viewport was captured.
14. `18-after-clear-mobile-viewport.png`: The desktop viewport was restored and the scene remained stable.

## Recording Status

`gameplay-recording.mp4` is expected to be encoded from screenshots `01` through `18`. If MP4 generation fails, that is an artifact-generation/environment issue, not a provider or game-quality block.

## Coverage Notes

- Playable WebGL load: verified after startup delay.
- Placement/build loop: smoke-tested, but visible build delta is subtle in the captured screenshots.
- Removal/undo: attempted, but no clear visible removal or undo affordance/feedback was proven.
- Gear/settings: visible gear exists, but no readable options panel was proven after clicks.
- Camera/zoom: verified through existing screenshots.
- Narrow/mobile: verified at smoke level through existing screenshots.

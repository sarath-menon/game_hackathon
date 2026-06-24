# Townscaper Web Expected Flow

Test input URL: `https://oskarstalberg.com/Townscaper/`

Manual reference: `/Users/sarathmenon/Documents/game_hackathon/external-qa/townscaper/README.md`

## Expected Player Flow

1. Open the Townscaper URL in a desktop browser with WebGL support.
2. Wait for the single WebGL canvas to render a small island/building scene.
3. Observe visible player-facing controls:
   - color swatches along the left edge
   - a small gear icon in the upper-right corner
   - existing blocks/building surfaces and nearby water/grid placement hints
4. Select a color swatch from the left palette.
5. Click visible water/grid positions around the island to place blocks.
6. Confirm each click produces immediate visual feedback by adding a block/structure and updating the URL hash.
7. Attempt alternate-click/right-click on an existing placed block to remove it.
8. Drag across the scene to rotate/orbit the camera and confirm the scene remains readable.
9. Use mouse wheel to zoom in/out and confirm the camera remains usable.
10. Click the visible gear icon and check whether settings/options are discoverable.
11. Resize or emulate a narrow/mobile viewport and confirm the canvas remains visible enough to inspect the scene.

## Evidence Map

- `scoped-00-before-gear.png`: desktop WebGL scene loaded with visible palette and gear.
- `scoped-01-gear.png`: click action adds visible block/island feedback.
- `scoped-02-gear-menu-click.png`: additional placement feedback with multiple structures.
- `scoped-03-right-lower-block.png`: right-click removal attempt did not visibly remove the targeted structure.
- `scoped-04-mobile.png`: narrow/mobile viewport renders the canvas and controls, with reduced usable space.
- `valid-06-drag-camera.png`: camera orbit changes the viewing angle and remains readable.
- `valid-08-zoom-out.png`: zoom/navigation remains visually stable after camera actions.
- `gameplay-recording.mp4`: continuous browser-harness recording from the Townscaper canvas. The clip is short because CDP screenshot capture was slow in the shared browser session.

## Notes

The browser-harness session intermittently drifted to another active tab when using global helpers. Final evidence screenshots used target-scoped CDP calls tied to the Townscaper target ID to avoid mixing surfaces.

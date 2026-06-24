# Townscaper Web QA Report

Game: Townscaper Web

Verdict: PASS WITH FINDINGS

## Test Inputs

- URL: `https://oskarstalberg.com/Townscaper/`
- Manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/townscaper/README.md`
- Browser: Chrome via browser-harness/CDP
- Desktop viewport observed: 1728x996 CSS pixels
- Narrow/mobile viewport observed: emulated 390x844, device scale factor 2

## Evidence

- Folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/townscaper/`
- Report: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/townscaper/TEST_REPORT.md`
- Expected flow: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/townscaper/expected-flow.md`
- Continuous recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/townscaper/gameplay-recording.mp4`
- Recording method: browser-harness target-scoped CDP screenshots encoded with ffmpeg at 8 FPS, 1280x738 output, 50 frames, 6.25 seconds.
- Additional visual evidence: `valid-contact-sheet.jpg`, `scoped-contact-sheet.jpg`, `recording-contact-sheet.jpg`

## Summary

Townscaper Web loads directly without an auth wall and renders a playable WebGL canvas. The scene is readable, the color palette is visible, mouse clicks place new structures with immediate feedback, URL hash updates indicate shareable state, and camera drag/zoom behavior remains visually stable. Core creative-toy functionality is playable on desktop.

The main issues are discoverability and documentation gaps: no in-game text explains controls, the visible gear did not expose a clear settings/options panel during testing, right-click removal was not confirmed from the tested surface, and the narrow viewport is usable only in a cramped way. These do not block basic placement and camera play, but they are meaningful black-box usability findings.

## Findings

### Medium: Block removal was not confirmed through documented/visible controls

- Status: Open
- Repro:
  1. Load the game.
  2. Place blocks on visible grid/water positions.
  3. Right-click a placed structure.
- Expected: If alternate click is the removal action, the targeted block should visibly disappear or provide feedback.
- Actual: The right-click attempt on a placed structure did not visibly remove it in the captured evidence.
- Evidence: `scoped-03-right-lower-block.png`
- Impact: Players relying only on the provided manual and visible UI may not discover how to undo or remove placed blocks.

### Medium: Gear/settings discoverability is unclear

- Status: Open
- Repro:
  1. Load the game.
  2. Click the visible gear icon in the upper-right.
- Expected: A gear icon should open visible settings/options, or the game should not imply configurable settings.
- Actual: No clear settings/options panel was observed in the valid evidence path; tested clicks continued to show canvas interaction rather than a readable menu.
- Evidence: `scoped-00-before-gear.png`, `scoped-01-gear.png`, `scoped-02-gear-menu-click.png`
- Impact: Settings/options quality could not be fully assessed beyond noting the absence of discoverable controls.

### Low: Controls are icon-only and undocumented in the game surface

- Status: Open
- Repro:
  1. Load the game.
  2. Inspect the first screen without outside knowledge.
- Expected: A minimal help overlay, tooltip, or readable labels should explain placement, removal, camera, zoom, and options.
- Actual: The canvas exposes swatches and a gear icon, but no textual control explanation was visible.
- Evidence: `scoped-00-before-gear.png`
- Impact: Experienced players can experiment successfully, but new players may need trial-and-error.

### Low: Narrow/mobile viewport is visually functional but cramped

- Status: Open
- Repro:
  1. Emulate 390x844 mobile viewport.
  2. Observe the scene and palette.
- Expected: The canvas should remain visible and controls should be accessible if mobile is supported.
- Actual: The scene rendered and controls remained visible, but the palette compresses along the bottom and the playable area is narrow.
- Evidence: `scoped-04-mobile.png`
- Impact: Usable for inspection, but not a polished mobile interaction surface.

### Low: Browser-harness capture instability limited recording length

- Status: Test limitation
- Details: Global browser-harness helpers intermittently drifted to another active tab in the shared Chrome profile. Target-scoped CDP calls produced valid Townscaper screenshots, but screenshot capture remained slow and the continuous MP4 is shorter than ideal.
- Evidence: valid Townscaper screenshots are target-scoped; invalid tab-drift screenshots were excluded from findings.
- Impact: The report relies on still evidence for several interactions and a short continuous recording for motion continuity.

## Regression Checklist

- Direct URL loads without authentication: PASS
- WebGL canvas renders: PASS
- Visible first screen is understandable as a creative building toy: PASS
- Color palette is visible: PASS
- Block placement produces immediate visual feedback: PASS
- Multiple placements are possible: PASS
- Camera orbit/drag changes viewpoint: PASS
- Zoom/navigation remains stable: PASS
- Settings/options discoverability: PARTIAL / FINDING
- Removal/undo discoverability: PARTIAL / FINDING
- Save/share behavior: PARTIAL, URL hash updates after edits; no explicit save UI observed
- Mobile/narrow viewport: PARTIAL / FINDING
- Runtime crash or auth wall: PASS, none observed

## Accessibility And Readability

Readability verdict: PASS WITH FINDINGS

The game is highly visual and the first scene is readable: the island, placed buildings, water, palette, and gear icon are clear. However, the game relies on icon/color-only controls and experimentation. There is no visible text help, no keyboard/accessibility affordance observed, and no confirmed reduced-motion or audio settings. The color palette is compact but visually distinguishable on desktop.

## Limitations

- Testing used only the provided URL and manual.
- No source, implementation, or external control documentation was inspected.
- Mobile testing was emulated through CDP rather than a physical touch device.
- The continuous recording is short due to browser-harness screenshot throughput in a shared browser profile.
- I could not verify audio behavior because no obvious audio was observed during the tested flow.

## Approval Statement

Townscaper Web is playable for the core desktop creative flow: load, inspect, place blocks, and move the camera. Approval is conditional on accepting the documented usability gaps around removal, settings/options discovery, and mobile polish.

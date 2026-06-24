# Townscaper Web - Deep Settings/Removal/Mobile Pass 1

## Verdict

`PASS_WITH_FINDINGS`

## Test Inputs

- Game URL attempted: `https://oskarstalberg.com/Townscaper/`
- Player manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/townscaper/README.md`
- Browser: shared Chrome window through browser-harness only
- Viewport: desktop approximately 1519 x 981; narrow/mobile-like viewport captured in harness emulation
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/townscaper-settings-removal-mobile-pass-1`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/townscaper-settings-removal-mobile-pass-1/gameplay-recording.mp4`
- Recording status: encoding attempted from existing screenshots 01-18. If the MP4 is absent or incomplete, classify that artifact issue as `BLOCKED_ENVIRONMENT` for recording only, not as the game QA verdict.

## Provider / Environment Classification

This attempt is not `BLOCKED_PROVIDER`: the direct Townscaper Web URL loaded a playable WebGL scene after a startup delay.

This attempt is not `BLOCKED_ENVIRONMENT` for game QA: the shared-window browser-harness captured the page, interacted with the scene, selected colors, attempted removal/undo/settings actions, captured camera/zoom changes, and captured a narrow viewport state.

This attempt is not `FAIL`: the game was playable and acceptable for the tested creative/WebGL smoke path. Remaining issues are nonblocking discoverability or coverage findings.

## Summary

Townscaper Web reached a playable WebGL scene in the shared Chrome/browser-harness setup after an initial loading delay. The scene, color swatches, gear icon, camera framing, and mobile/narrow layout were readable. Placement/color interactions were smoke-tested, camera drag and scroll zoom were captured, and narrow viewport rendering remained stable.

The main findings are discoverability-related: removal/undo behavior was not clear from visible UI/manual-level controls, the gear icon did not show a readable options/settings panel in the captured evidence, and the build-placement delta is subtle enough that creative/WebGL QA needs closer before/after camera positioning.

## Severity-Rated Findings

### Medium - Removal / Undo Behavior Not Clearly Discoverable Or Verified

- Status: Open
- Repro steps: Load playable scene, attempt right-click removal on the structure, then attempt `Ctrl+Z` and `Cmd+Z`.
- Expected behavior: The manual expects place and remove behavior; removal or undo should have visible feedback or a discoverable control.
- Actual behavior: Right-click and undo attempts were captured, but no clear block removal, undo, disabled state, or help text appeared.
- Evidence: `08-after-right-click-removal-attempt.png`, `09-after-ctrl-z-undo-attempt.png`, `10-after-cmd-z-undo-attempt.png`

### Low - Gear Icon Does Not Expose A Readable Settings Panel In Captured Evidence

- Status: Open
- Repro steps: Click the visible gear icon once, then again.
- Expected behavior: Gear/settings control opens a readable settings/options/help panel, or visibly toggles a documented setting.
- Actual behavior: No readable panel or visible settings state change was captured.
- Evidence: `11-after-gear-click.png`, `12-after-gear-second-click.png`

### Low - Placement Feedback Is Subtle From The Tested Camera Angle

- Status: Open
- Repro steps: Click existing structure/grid locations, select another color swatch, and click again.
- Expected behavior: Placement/modification feedback should be visually obvious in screenshot comparison.
- Actual behavior: The scene stayed responsive, but captured placement deltas are subtle from the selected camera angle.
- Evidence: `03-playable-scene.png`, `04-after-place-click-1.png`, `05-after-place-click-2.png`, `06-after-color-swatch-select.png`, `07-after-place-with-new-color.png`

### Low - Startup Requires Extended Wait

- Status: Open
- Repro steps: Open the direct URL.
- Expected behavior: WebGL scene reaches playable state promptly or provides clear load progress.
- Actual behavior: Initial screenshot showed only a loading bar; a later wait reached the playable scene.
- Evidence: `01-initial-load.png`, `02-after-long-load-wait.png`

## Coverage Table

- Direct URL load: PASS
- Playable WebGL scene: PASS
- Core place/build loop: PARTIAL, responsive but subtle captured delta
- Color selection: PASS
- Placement after color selection: PARTIAL
- Removal: PARTIAL/UNVERIFIED
- Undo: PARTIAL/UNVERIFIED
- Gear/settings/options: PARTIAL/UNVERIFIED
- Camera drag/orbit: PASS
- Scroll zoom: PASS
- Narrow/mobile viewport: PASS at smoke level
- Help/control discoverability: PARTIAL, mostly icon-only/color-only
- Readability/accessibility: PASS_WITH_FINDINGS
- Performance/load: PASS_WITH_FINDINGS, startup delay but stable once loaded

## Accessibility / Readability Assessment

PASS_WITH_FINDINGS. The WebGL scene is visually clear and readable at desktop and narrow widths, and color swatches remain visible. However, controls are icon-only or color-only, with no captured text help, tooltip, or keyboard/focus cue. Removal and settings behavior are especially hard to infer from visible UI alone.

## Performance / Load Assessment

The initial load required an extended wait, but the scene eventually rendered and remained stable through interaction, camera/zoom, and narrow viewport captures. No crash or WebGL error screen was captured.

## QA Methodology Carry-Forward

- For creative/WebGL games, capture tightly framed before/after placement shots from the same camera angle; broad scenic shots can hide small build changes.
- Always separate startup delay from provider block when the scene eventually becomes playable.
- For icon-only tools, test click response and document whether a readable panel, tooltip, cursor state, or visible world change appears.
- Removal/undo should be verified with a clearly isolated placed object so disappearance is easy to prove.
- Mobile/narrow checks should verify both layout relocation of controls and whether the central build target remains reachable.

## Approval / Retry Statement

Approved as `PASS_WITH_FINDINGS` for this direct provider pass. No alternate-provider retry is required. A future focused pass should isolate a single newly placed block, verify removal/undo with clearer before/after framing, and explore whether the gear icon exposes settings/help under different visible states.

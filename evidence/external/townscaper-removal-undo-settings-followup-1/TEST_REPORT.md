# Townscaper Web - Removal, Undo, Gear/Settings, And Placement-Clarity Follow-Up 1

## Verdict

`PASS_WITH_FINDINGS`

Townscaper Web reached a playable WebGL scene in the shared Chrome/browser-harness environment. Core creative-game behavior was verified: a visible placement target was established, a new block/section was placed, right-click removal deleted it, wheel zoom worked, and drag camera control remained interactive. The pass is acceptable with nonblocking usability and coverage findings around gear/settings/help behavior, undo/redo discoverability, and placement-target clarity.

## Test Inputs

- Provider URL: `https://oskarstalberg.com/Townscaper/`
- Manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/townscaper/README.md`
- Browser: shared Chrome window controlled through browser-harness only
- Viewport: 782 x 859 desktop viewport
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/townscaper-removal-undo-settings-followup-1/`
- Recording: `gameplay-recording.mp4`, encoded from captured screenshots at 2 fps source cadence into 30 fps H.264 MP4

## Provider and Environment Classification

- Provider classification: not blocked. The direct provider URL reached playable WebGL state.
- Environment classification: not blocked. The shared Chrome/browser-harness surface could load, interact with, and capture the game.
- Startup note: WebGL startup was slow, reaching playable scene around the `04-after-22s.png` frame, but it did complete and remained stable.

## Summary

The game loaded slowly but reached a playable WebGL scene. Placement initially had unclear targeting, but after moving the camera to reveal a white outlined cell, a click placed a distinct new platform/roof section to the right of the original building. Right-click removal then removed that section. Wheel zoom and camera drag both worked after the placement/removal path. No crash, provider block, or harness block occurred.

The main nonblocking concerns are that the gear icon did not visibly open any settings/help panel after multiple normal player-visible click attempts, undo/redo shortcuts did not visibly restore or redo the removed block, and valid placement targets were subtle until a hover/outline state appeared.

## Findings

### Medium - Gear/settings/help icon did not expose visible settings or help

- Status: Open
- Evidence clip: `gameplay-recording.mp4` @ 00:06-00:08
- Evidence status: Video clip plus same-folder stills document the normal gear activation attempts.
- Why this evidence proves the finding: The clip segment corresponds to the gear-click sequence, and the paired `13-after-gear-css-click.png`, `14-after-gear-screenshot-pixel-click.png`, and `15-after-gear-raw-cdp-click.png` frames continue to show the canvas without a readable settings/help panel or visible changed state.
- Evidence: `13-after-gear-css-click.png`, `14-after-gear-screenshot-pixel-click.png`, `15-after-gear-raw-cdp-click.png`
- Repro steps:
  1. Load the playable WebGL scene.
  2. Click the visible gear icon at the top-right through normal coordinate-click attempts.
  3. Observe whether a settings/help panel, toggle, or readable state appears.
- Expected behavior: A visible gear/settings/help control should either open a readable panel, change state visibly, or communicate that it is unavailable.
- Actual behavior: No visible panel, help copy, toggle state, or other readable feedback appeared.
- Impact: Settings/help discoverability remains unclear for players and testers, though core building remained playable.

### Low - Undo/redo behavior was not discoverable or visibly supported

- Status: Open
- Evidence clip: `gameplay-recording.mp4` @ 00:10-00:13
- Evidence status: Video clip plus same-folder stills document the removal state and subsequent shortcut attempts.
- Why this evidence proves the finding: The clip segment maps to the post-removal and undo/redo sequence; `21-after-right-click-removal.png`, `23-after-ctrl-z-undo.png`, `24-after-cmd-z-undo.png`, and `25-after-ctrl-shift-z-redo.png` show that the removed section did not visibly return and no explanatory feedback appeared.
- Evidence: `21-after-right-click-removal.png`, `23-after-ctrl-z-undo.png`, `24-after-cmd-z-undo.png`, `25-after-ctrl-shift-z-redo.png`
- Repro steps:
  1. Place a visible new block/section.
  2. Remove it with right click.
  3. Try common undo shortcuts: Ctrl+Z and Cmd+Z.
  4. Try common redo shortcut: Ctrl+Shift+Z.
- Expected behavior: If undo/redo is supported, the removed block should visibly restore or the UI should expose clear controls/help. If unsupported, lack of support should be discoverable from visible help/settings.
- Actual behavior: The removed block did not visibly return, and no feedback explained undo/redo availability.
- Impact: Nonblocking for basic creative play, but it limits recovery confidence after accidental removal.

### Low - Placement target clarity depends on a subtle outlined-cell state

- Status: Open
- Evidence clip: `gameplay-recording.mp4` @ 00:02-00:10
- Evidence status: Video clip plus same-folder stills document the before/after placement attempts.
- Why this evidence proves the finding: The clip covers the playable scene through the successful outlined-cell placement window, while the paired stills show earlier plausible placement attempts without an obvious change and the later `18-before-outlined-cell-click.png` to `19-after-outlined-cell-click.png` change once the subtle white target outline is visible.
- Evidence: `05-placement-before.png` through `12-after-roof-placement-screenshot-pixel.png`, `18-before-outlined-cell-click.png`, `19-after-outlined-cell-click.png`
- Repro steps:
  1. Load the playable scene.
  2. Click plausible roof/tower/building areas before a clear cell outline appears.
  3. Move the camera until a white outlined build cell appears.
  4. Click the outlined cell.
- Expected behavior: Normal players should be able to tell which visible areas can accept a placement and see immediate feedback.
- Actual behavior: Initial plausible clicks did not produce a clear change; the successful placement became obvious only after the outlined cell appeared.
- Impact: Core placement works, but target affordance can be subtle.

### Low - Color controls are color-only and selected-color feedback is limited

- Status: Open
- Evidence clip: `gameplay-recording.mp4` @ 00:01-00:06
- Evidence status: Video clip plus same-folder stills document the visible swatch-only palette and selected-color check.
- Why this evidence proves the finding: The clip shows the palette as color swatches without text labels, and `06-after-blue-swatch.png` plus `11-after-blue-swatch-screenshot-pixel.png` preserve the post-swatch state without a readable label, tooltip, or clear selected-state callout.
- Evidence: `04-after-22s.png`, `06-after-blue-swatch.png`, `11-after-blue-swatch-screenshot-pixel.png`
- Repro steps:
  1. Load the playable scene.
  2. Inspect the color swatches and click a non-default swatch.
  3. Observe selected state and any text/tooltip feedback.
- Expected behavior: Color selection should be understandable beyond color alone, ideally with clear selected-state feedback.
- Actual behavior: Swatches are icon/color-only. No labels or readable help were observed, and selected state was not clearly communicated in the captured evidence.
- Impact: Accessibility/readability concern for color perception and keyboard/focus discoverability.

### Low - Startup delay is noticeable but not blocking

- Status: Open
- Evidence clip: `gameplay-recording.mp4` @ 00:00-00:02
- Evidence status: Timelapse video clip plus same-folder load stills document slow-but-successful startup.
- Why this evidence proves the finding: The clip begins in the loading state and reaches the playable scene shortly afterward because the recording was encoded from spaced captures; the still sequence `01-initial-load.png`, `02-after-5s.png`, `03-after-12s.png`, and `04-after-22s.png` provides the real elapsed wait markers behind that condensed startup path.
- Evidence: `01-initial-load.png`, `02-after-5s.png`, `03-after-12s.png`, `04-after-22s.png`
- Repro steps:
  1. Open the direct Townscaper URL.
  2. Wait for the WebGL scene to become interactive.
- Expected behavior: Loading should complete or provide understandable progress.
- Actual behavior: The loading sequence took roughly 20-plus seconds before playable state appeared.
- Impact: Not a provider block, but it is a noticeable waiting period.

## Coverage Table

| Area | Result | Evidence |
| --- | --- | --- |
| Direct URL load | Pass with slow startup | `01-initial-load.png` to `04-after-22s.png` |
| Playable WebGL scene | Pass | `04-after-22s.png` |
| Clear before/after placement | Pass | `18-before-outlined-cell-click.png`, `19-after-outlined-cell-click.png` |
| Removal | Pass | `20-before-right-click-removal.png`, `21-after-right-click-removal.png` |
| Undo/redo | Finding | `23-after-ctrl-z-undo.png`, `24-after-cmd-z-undo.png`, `25-after-ctrl-shift-z-redo.png` |
| Gear/settings/help | Finding | `13-after-gear-css-click.png`, `14-after-gear-screenshot-pixel-click.png`, `15-after-gear-raw-cdp-click.png` |
| Camera drag/orbit | Pass | `16-before-camera-drag.png`, `17-after-camera-drag.png`, `28-after-empty-area-camera-drag.png` |
| Zoom | Pass | `26-after-wheel-zoom-in.png`, `27-after-wheel-zoom-out.png` |
| Accessibility/readability | Pass with findings | Gear icon, color-only swatches, subtle placement outline |
| Performance/stability | Pass with startup finding | No crash or visible runtime/provider error in captured path |

## Usability and Accessibility Assessment

State changes for the proven placement and removal path are readable once a valid outlined cell is visible. The camera and zoom controls are effective enough to inspect the structure. However, gear/settings/help is icon-only and produced no visible feedback, color swatches are color-only, keyboard/focus affordances were not visible, and placement target affordance can be subtle until the white outline appears.

## Performance and Load Assessment

Startup was slow but completed. After the playable scene appeared, WebGL interaction remained stable through placement, removal, shortcut attempts, zoom, and camera drag. No crash, provider error, or visible softlock occurred.

## QA Methodology Carry-Forward

- For creative/WebGL games, establish a stable camera framing and capture a before image before each placement/removal claim.
- Treat URL/hash changes as supporting context only; visual before/after evidence should carry the finding.
- When placement initially appears inert, look for hover outlines or target-highlight states before concluding failure.
- For icon-only settings/help controls, try a small set of normal visible activation paths, then stop and classify the discoverability issue instead of over-probing.
- Separate slow WebGL startup from provider blocking when the game eventually reaches a stable playable state.

## Approval Statement

Approved as `PASS_WITH_FINDINGS` for this external QA pass. No provider retry is required for basic playability. A future focused pass could target gear/help behavior and undo/redo documentation if the orchestrator wants deeper settings/help coverage.

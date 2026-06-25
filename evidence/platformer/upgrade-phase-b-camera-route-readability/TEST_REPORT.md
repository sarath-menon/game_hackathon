# Side-Scrolling Platformer / Skyline Stepper

Attempt: Upgrade Phase B - Camera And Route Readability Pass  
Verdict: FAIL

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/platformer/index.html`
- Manual URL: `http://127.0.0.1:8765/games/platformer/README.md`
- Manual path: `/Users/sarathmenon/Documents/game_hackathon/games/platformer/README.md`
- Browser/harness: browser-harness attached to the single shared Chrome window
- Viewport: desktop shared-window viewport, screenshots captured at approximately 3038 x 1962 source resolution and encoded to 1280 x 720 MP4

## Evidence

- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/upgrade-phase-b-camera-route-readability/`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/upgrade-phase-b-camera-route-readability/gameplay-recording.mp4`
- Recording method: browser-harness screenshots encoded with ffmpeg at 30 fps from the captured sequence
- Key screenshots: `01b-title-load-current-tab.png` through `22-in-run-settings-escape-close.png`

## Summary

The game and manual loaded, Settings matched the manual for the camera/readability controls, Player Variant Controls were visible, and Reset Defaults left generated sounds off with volume at `0%`. Early rightward movement showed improved lookahead: safe route rails, chevrons, optional route labeling, danger labeling, the mid-checkpoint marker, and hazards were visible before commitment.

The pass cannot be approved because the lower safe route did not remain playable to the checkpoint/exit through normal documented movement. After early progress to `179 m`, repeated normal right movement, right+jump, arrow-key movement, refocus, and a longer right-hold attempt left the player at the same approach with the HUD still showing `179 m` and `Checkpoint: start`. This blocks the required lower-safe-route completion and route/readability gate.

## Findings

### F-01 Critical - Lower safe route stalls before the mid checkpoint

- Status: Open
- Repro steps:
  1. Load `http://127.0.0.1:8765/games/platformer/index.html`.
  2. Start a run.
  3. Follow the visible lower safe route using documented right movement.
  4. Continue toward the mid checkpoint using right, right+jump, and arrow-key alternatives.
- Expected behavior: The lower safe route remains continuously readable and playable, reaches the mid checkpoint, and can continue toward Level Complete through normal play.
- Actual behavior: The player reaches the mid-checkpoint approach at `179 m` but does not continue progressing despite repeated documented movement/jump attempts. The HUD remains `Checkpoint: start`, and the mid checkpoint stays ahead.
- Evidence clip: `gameplay-recording.mp4 @ 00:08-00:15`
- Evidence status: Main recording segment
- Why this evidence proves the finding: The segment shows the player repeatedly attempting to move right and jump while the distance remains `179 m` and the checkpoint remains unreached.
- Screenshot evidence: `11-ordinary-jump-camera.png`, `16-after-refocus-move-check.png`, `18-jump-right-route-block-check.png`, `19-arrow-jump-route-block-check.png`, `20-long-right-still-blocked-check.png`

### F-02 Medium - In-run Escape close behavior was not confirmed

- Status: Open / secondary to F-01
- Repro steps:
  1. Start a run.
  2. Open Settings from the in-run Settings button.
  3. Press Escape through the browser-harness key dispatch.
- Expected behavior: Per the manual, Settings can be opened or closed with Escape, returning focus to the run.
- Actual behavior: The Settings overlay remained visible in the captured frame after the Escape attempt. Because the route blocker had already failed the pass, the visible Close Settings button was not further exercised in this run.
- Evidence clip: `gameplay-recording.mp4 @ 00:16-00:17`
- Evidence status: Main recording segment
- Why this evidence proves the finding: The recording shows the in-run Settings panel still open after the Escape-close attempt.
- Screenshot evidence: `21-in-run-settings-open.png`, `22-in-run-settings-escape-close.png`

## Coverage Limitations

### L-01 Narrow viewport was not attempted after the critical route failure

- Impact: Narrow/mobile-like layout remains unverified for this pass.
- Reason: Testing stopped after the route/readability gate failed on desktop; expanding into viewport coverage would not change the approval verdict.
- Evidence clip: `gameplay-recording.mp4 @ 00:08-00:15`
- Evidence status: Main recording segment
- Why this evidence proves the limitation: The route blocker is visible before the test reaches the narrow-viewport segment.

### L-02 Failure, checkpoint recovery, and completion regressions were not completed

- Impact: Health-zero failure, checkpoint respawn, and Level Complete are not fully regression-verified in this attempt.
- Reason: The lower safe route did not reach the mid checkpoint or exit.
- Evidence clip: `gameplay-recording.mp4 @ 00:08-00:15`
- Evidence status: Main recording segment
- Why this evidence proves the limitation: The player remains before the mid checkpoint and cannot proceed to the later regression states.

## Regression Checklist

- Game loads from hosted URL: PASS
- Manual loads from provided path/URL: PASS
- Title/start first action clarity: PASS
- Settings visible from title: PASS
- Player Variant Controls visible: PASS
- Camera/readability settings visible and aligned with manual: PASS
- Reset Defaults keeps generated sounds off and volume `0%`: PASS
- Early committed-direction lookahead: PASS
- Horizontal camera stability during early movement/fine positioning: PASS
- Ordinary jump camera behavior: PARTIAL, no disorienting vertical camera jump observed before route stall
- Safe route rail/chevrons, optional route, danger labels, checkpoint marker readability: PASS before route stall
- Lower safe route reaches Level Complete: FAIL
- Settings open during run: PASS
- Settings close/resume during run: INCONCLUSIVE / secondary finding
- Narrow viewport: NOT COVERED
- Blocking runtime errors: None observed

## State/Action Clarity Gate

Route/readability gate: FAIL

The visible route language is readable before the blocker, but the lower safe route cannot be approved when normal documented movement does not carry the player through the mid checkpoint and toward completion.

## Approval Statement

This phase is not approved. Route/readability completion is a required gate for Upgrade Phase B, and the current build fails that gate in clean browser-harness evidence.

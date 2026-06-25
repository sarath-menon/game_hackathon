# Expected / Observed Flow

Attempt: Side-Scrolling Platformer / Skyline Stepper - Upgrade Phase B

## Expected Flow

1. Load the hosted game URL and the player manual.
2. From the title screen, the player can clearly start a run or open Settings.
3. Settings should expose camera/readability controls documented in the manual:
   - Camera Smoothing
   - Camera Lookahead
   - Route Marker Intensity
   - Route Cue Style
   - High-Contrast Hazards
   - Objective Labels
   - Background Detail
   - Reduced Motion / effect controls
   - Generated UI Sounds off and Volume `0%` by default
4. Reset Defaults should restore documented defaults and keep generated sounds off with volume `0%`.
5. During a run, normal rightward movement should shift lookahead enough that safe route rails, chevrons, hazards, route choices, labels, checkpoint approach, and exit approach are visible before the player must commit.
6. Ordinary jumps should not cause disorienting vertical camera motion.
7. The lower safe route should remain continuously readable and playable from start through the mid checkpoint and onward to Level Complete.
8. Settings should open during a run, pause the run while open, then close and return control cleanly.
9. Regression checks should cover movement feel, jump forgiveness, checkpoint/damage where encountered, restart/failure/completion where practical, and narrow viewport if stable.

## Observed Flow

1. The game loaded at `http://127.0.0.1:8765/games/platformer/index.html`.
2. Title/start state was clear, with Start Run and Settings available.
3. Settings opened from title and showed the documented top controls, Player Variant Controls, camera/readability controls, route marker controls, reduced motion/effects, and audio defaults.
4. Reset Defaults kept Generated UI Sounds unchecked and Volume at `0%`.
5. Starting the run worked. Early rightward movement revealed safe-route chevrons, optional core path labeling, a danger label, hazards, and the mid-checkpoint marker before commitment.
6. A normal jump did not produce an obvious disorienting vertical camera jump in the captured segment.
7. The lower safe route stalled before the mid checkpoint. Repeated right movement, right+jump, alternate arrow-key movement, refocus, and a longer right-hold attempt did not move the player past the `179 m` checkpoint approach. The HUD remained `Checkpoint: start`.
8. Settings opened during the run and correctly showed `Settings paused`; the Escape close attempt did not dismiss the panel in the captured frame.
9. Narrow viewport, checkpoint recovery, failure, and Level Complete were not reached because the lower-route blocker already failed the route/readability gate.

## Verdict-Relevant Evidence

- Early lookahead and route labels: `07-run-start.png` through `10-right-lookahead-3s.png`
- Route stall: `11-ordinary-jump-camera.png`, `16-after-refocus-move-check.png`, `18-jump-right-route-block-check.png`, `19-arrow-jump-route-block-check.png`, `20-long-right-still-blocked-check.png`
- In-run Settings: `21-in-run-settings-open.png`, `22-in-run-settings-escape-close.png`
- Continuous recording: `gameplay-recording.mp4`

## Outcome

Verdict: FAIL

The build is playable enough to evaluate, but the lower safe route does not meet the required continuous readability/playability gate and cannot be approved for Upgrade Phase B.

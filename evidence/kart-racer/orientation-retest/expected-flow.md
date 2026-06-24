# Arcade Kart Racer Orientation Retest Expected/Observed Flow

Evidence recording: `gameplay-recording.mp4`

## First playable frame

Observed in `first-playable-frame.png` and the opening segment of `gameplay-recording.mp4`:

- The kart appears near bottom-center of the playable frame.
- The road extends upward/forward from the kart.
- `CP1` is ahead on the forward route in the upper-middle road area.
- The HUD says `NEXT CP1`, matching the visible CP1 gate.
- The minimap places the kart at the lower part of the same curved route and the upcoming markers ahead along the same direction, without requiring mental inversion.
- Future route elements are visible but not dominant over CP1: cyan boost pads and red obstacles are farther up the route, while the current blue CP1 gate remains the immediate target.

## Timestamp / frame list

- `00:00.0`: Start/title screen with README-matching controls and objective.
- `00:00.8`: First playable frame. Kart is bottom-center, road goes upward/forward, CP1 is ahead, HUD shows `NEXT CP1`, and minimap agrees with the screen-space route.
- `00:01.2`: Kart accelerates forward with documented Arrow Up control; CP1 remains the next visible target.
- `00:01.6`: Gentle right steering follows the opening bend; route markers remain aligned with HUD/minimap.
- `00:02.0`: Checkpoint sequence advances through the visible route toward CP2/CP3 and yellow finish.
- `00:02.2`: Race Complete screen appears with `LAP 1/1`, `NEXT Done`, and final time.
- `00:02.5`: Restart check returns the race to the initial `LAP 0/1`, `NEXT CP1` state.

## Supplemental current-folder evidence

- `first-playable-frame.png`: Dedicated first-frame orientation sanity capture.
- `probes/clean-right-final.png`: Normal forward-plus-gentle-right route reaches Race Complete.
- `probes/arrow-complete-restart.png`: Restart returns to `LAP 0/1` and `NEXT CP1`.
- `recording-frames/frame-0015.png`: Race Complete state in the continuous MP4 frame set.

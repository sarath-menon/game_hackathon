# Expected / Observed Flow

Game: PolyTrack  
Provider: Poki  
Attempt: shared-window retry 2  
URL tested: https://poki.com/en/g/polytrack

## Expected Flow

1. Close duplicate PolyTrack/Poki tabs from earlier project attempts.
2. Open the Poki provider URL in one controlled shared Chrome tab.
3. Wait for the embedded `games.poki.com` iframe to reach PolyTrack.
4. Use visible menu targets, not the canvas center, to enter Play.
5. Select a visible track and start a drivable run.
6. Verify race-start readability, HUD/timer feedback, keyboard focus, throttle, steering, restart/reset, and visible options/settings if reachable.
7. Record provider/environment blockers separately from game-quality findings.

## Observed Flow

1. Duplicate cleanup completed before the run.
   - Closed one leftover `https://poki.com/id/g/polytrack` tab.
   - No PolyTrack/Poki tabs remained before opening the fresh retry-2 tab.

2. Provider opened and redirected to localized Poki URL.
   - Attempted URL: `https://poki.com/en/g/polytrack`
   - Observed URL: `https://poki.com/id/g/polytrack`
   - Screenshot: `01-provider-loaded.png`

3. PolyTrack reached the visible in-game main menu.
   - Visible menu targets: Garage, Editor, Settings, Multiplayer, Play.
   - Screenshot: `02-main-menu-visible.png`

4. Visible Play flow was recovered after an initial mis-target.
   - `19-after-targeted-play-click.png` shows the official/community/custom track selection UI.
   - `29-after-trackselect-play-click.png` shows an actual drivable track start.

5. Race start was readable.
   - Track: `Summer 4`
   - HUD showed checkpoints `0/4`, current timer `00:00.000`, speed `0 km/h`, and record/difference fields.
   - Forward route and road edges were visible from the starting camera.
   - Screenshot: `29-after-trackselect-play-click.png`

6. Driving controls worked after game focus.
   - W acceleration moved the car forward and started the timer.
   - W+A and ArrowUp+ArrowRight changed heading/position on the track.
   - Screenshots: `31-track-w-accelerate.png`, `32-track-w-a-steer.png`, `33-track-arrow-drive.png`

7. Reset/restart controls worked.
   - R and T returned the car to the start line with timer reset to `00:00.000`.
   - Screenshots: `34-track-r-reset.png`, `36-track-t-reset.png`

8. Settings/options were reachable.
   - Settings screen exposed language, units, reset hint, ghost car, default camera, cockpit camera mode, checkpoint placement, reset, cancel, and apply.
   - Main/menu state also showed a `Music: On` toggle and a fullscreen icon.
   - Screenshots: `07-after-w-accelerate.png`, `17-before-targeted-cancel.png`

## Result

The provider and game were playable enough to evaluate core behavior. The run passes with nonblocking findings for localization and incomplete verification of some settings/persistence details.

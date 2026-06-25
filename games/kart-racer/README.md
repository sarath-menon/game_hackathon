# Arcade Kart Racer

Arcade Kart Racer is a single-kart race on a simple 3D loop track with ordered checkpoints, lap counting, boost pads, recoverable obstacles, drift boosts, and a race timer.

## Objective

Start the race, clear the checkpoint gates in order, use boost pads when helpful, avoid obstacles, and cross the yellow finish gate to complete the scored lap.
The required gates appear in sequence on the forward route from the start: `CP1`, then `CP2`, then `CP3`, then the yellow finish gate.

## Controls

- `W` or `Arrow Up`: accelerate
- `S` or `Arrow Down`: brake or reverse
- `A` or `Arrow Left`: steer left
- `D` or `Arrow Right`: steer right
- `Enter` or `Space`: start from the title screen
- `Space` or `Shift`: drift while steering at speed
- `O`: open or close settings
- `R`: restart the race

## Track Rules

Stay between the white guard rails. If the kart reaches the edge of the track, it is pushed back onto the road and loses speed so the route remains readable.

## Checkpoints And Laps

- Clear `CP1`, `CP2`, and `CP3` in order.
- The yellow finish gate only counts after all three checkpoints have been cleared.
- Crossing checkpoints out of order does not advance race progress.
- The lap counter starts at `0/1` while the scored lap is in progress.
- Crossing the finish gate after the required checkpoints completes lap `1/1`.
- The race is complete when the lap counter reaches `1/1`.

## Timer

The race timer starts when the race begins and stops when the scored lap is completed.

## Boosts And Obstacles

- Cyan `BOOST` pads give a short speed surge and stronger visual speed streaks.
- Red barriers and cones slow or bump the kart backward when hit.
- Obstacle hits show a message and camera shake, but the kart remains recoverable with throttle and steering.

## Drift Boosts

- Hold `Space` or `Shift` while steering left or right at moderate forward speed to start a drift.
- The drift meter charges quickly through visible stages: green `Early`, yellow `Ready`, and red `Strong`.
- Keep holding the drift key through the bend to build from `Early` to `Ready` and then `Strong`; the HUD message announces each stage.
- Release the drift key to convert the current charge into a short speed boost. Stronger stages give a stronger, longer boost and help the kart recover onto the route.
- Scraping the track edge weakens or cancels the drift charge. Hitting a red obstacle cancels drift charge.
- Drifting is optional; the checkpoint route can still be completed with normal acceleration and gentle steering.

## Speed Feedback

The HUD speed bar fills as speed increases. Boosting, drift release, and high speed add motion streaks, skid trails, and tire/exhaust particles.

## Settings

Open settings from the title screen, the in-race `Settings` button, the completion screen, or with `O`. Opening settings during a race pauses the timer and kart movement until the panel is closed.

Settings are grouped into Controls/Handling, Visual/Readability, Camera/HUD, Audio, and Data/Reset sections.

- Steering sensitivity changes how sharply the kart turns while driving and drifting.
- Driving assist changes acceleration, route alignment, and edge recovery. `Stable` is easiest to keep on route, `Standard` is the default, and `Sport` gives punchier throttle with less assist.
- Auto-accelerate keeps the kart driving forward during a race without holding `W` or `Arrow Up`; brake/reverse still works normally.
- Stability assist adds route-following correction after steering. Higher values help the kart settle back onto the road direction; lower values leave more manual control.
- Brake / recovery assist strengthens braking and helps the kart regain control after a slowdown.
- Edge recovery help softens wall slowdown and nudges the kart forward after road-edge contact.
- Camera distance zooms the heading-up chase view in or out.
- Camera height switches the chase camera between low, standard, and high views.
- HUD scale changes the size of the objective panel, stats, message, and settings button.
- Minimap size changes the heading-up minimap size.
- Route chevrons, checkpoint labels, input help, and the heading-up minimap can be shown or hidden independently.
- Route cue intensity changes the size and brightness of the forward-route chevrons.
- Marker intensity changes checkpoint and finish gate brightness and line weight.
- High contrast readability uses stronger guard rails, darker road surfaces, and heavier label outlines.
- Effect intensity scales speed streaks, skid trails, exhaust particles, and shake. Reduced motion cuts motion-heavy effects further.
- Audio is off and muted by default on first load and after `Reset Defaults`; no sound plays before you opt in.
- UI sounds enables short generated tones for start, boost, drift, collision, completion, and settings actions. Turn on `UI sounds` in settings and raise `Volume` above `0%` to hear them.
- Older saved settings that predate the audio opt-in are treated as muted until you enable sounds again.
- Settings save automatically in this browser and persist after reload.
- `Reset Defaults` restores every setting, including handling, camera/HUD, readability, effects, audio off, and volume `0%`.
- Keyboard focus moves into the settings panel when opened and returns to the opener when closed.

## Restart

Press `R` at any time to restart from the beginning. After race completion, use `R` or the `Restart Race` button.

## Win Behavior

Completing the scored lap shows the race-complete screen with the final time. Reload the page to play again.

## Browser Requirements

Use a current desktop browser with HTML5 Canvas and JavaScript enabled. The game has no external assets or network dependencies.

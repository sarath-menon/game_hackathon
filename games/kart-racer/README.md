# Arcade Kart Racer

Phase 2 is a single-kart race on a simple 3D loop track with ordered checkpoints, lap counting, and a race timer.

## Objective

Start the race, clear the checkpoint gates in order, and cross the yellow finish gate to complete the scored lap.
The required gates appear in sequence along the opening left-hand bend: `CP1`, then `CP2`, then `CP3`, then the yellow finish gate.

## Controls

- `W` or `Arrow Up`: accelerate
- `S` or `Arrow Down`: brake or reverse
- `A` or `Arrow Left`: steer left
- `D` or `Arrow Right`: steer right
- `Enter` or `Space`: start from the title screen

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

## Win Behavior

Completing the scored lap shows the race-complete screen with the final time. Reload the page to play again.

## Browser Requirements

Use a current desktop browser with HTML5 Canvas and JavaScript enabled. The game has no external assets or network dependencies.

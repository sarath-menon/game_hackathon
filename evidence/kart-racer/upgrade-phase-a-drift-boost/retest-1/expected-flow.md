# Arcade Kart Racer Upgrade Phase A Retest 1 Expected/Observed Flow

Evidence recording: `gameplay-recording.mp4`

## Expected player-visible flow

1. Load the hosted game and start from the title screen with Enter or Space.
2. First playable frame shows the kart near the bottom of the screen, road forward/up, HUD `NEXT CP1`, `LAP 0/1`, and `DRIFT Idle`.
3. Holding Shift or Space with steering from standstill should not start drift.
4. Accelerate to moderate speed, hold Shift or Space while steering, and watch the drift meter charge through `Early`, `Ready`, and `Strong`.
5. Releasing drift at a charged stage should show `DRIFT Boost` / boost messaging and a short recoverable speed surge.
6. Normal route should remain readable through CP1 -> CP2 -> CP3 -> yellow finish.
7. Race completion should show `LAP 1/1`, `NEXT Done`, Race Complete, and final time.
8. Restart should reset to `LAP 0/1`, `NEXT CP1`, `DRIFT Idle`.
9. Overholding drift into the wall/edge should show a `Cut` or wall-scrub weakening message.

## Recording timestamp / frame notes

- `00:00.0`: Hosted game/title screen visible with manual-matching controls.
- `00:00.7`: First playable frame shows `NEXT CP1`, `LAP 0/1`, and `DRIFT Idle`; route and minimap are readable.
- `00:01.2`: Standstill Shift+steer attempt remains idle.
- `00:01.8`: Restart/reset before charged-drift route.
- `00:02.3`: Drift starts at speed and shows build/early charge feedback.
- `00:02.6`: Drift reaches `Strong` in the HUD; probe frames also show `Ready`.
- `00:02.8`: Drift release produces boost; kart remains recoverable and continues the route.
- `00:03.3`: Race Complete appears with `LAP 1/1`, `NEXT Done`, and final time.
- `00:03.9`: Restart resets the route.
- `00:04.4`: Wall/edge scrub after overheld drift shows `Cut` / weakened-charge feedback.

## Supplemental retest probe evidence

- `hosted-load.png`: hosted game and visible controls load.
- `first-playable-frame.png`: first playable heading-up route and `DRIFT Idle`.
- `probes/standstill-01.png`: drift does not start from standstill.
- `probes/ArrowLeft-held-04.png`: `Ready` stage visible.
- `probes/ArrowRight-held-02.png`: `Strong` stage visible.
- `probes/poll-early-release-022.png`: Early release boost.
- `probes/poll-ready-release-022.png`: Ready release boost.
- `probes/poll-strong-release-022.png`: Strong release boost.
- `recording-frames/frame-0014.png`: Strong charge in continuous recording.
- `recording-frames/frame-0016.png`: Race Complete in continuous recording.

## Observed result

Retest 1 matches the manual from a player perspective. Early, Ready, and Strong are visible before cutoff when drift is started at speed, releases from charged states create clear boost feedback and speed surge, standstill drift remains idle, wall/edge scrub cuts or weakens charge, and the route remains readable through completion.

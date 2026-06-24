# Arcade Kart Racer Upgrade Phase A Expected/Observed Flow

Evidence recording: `gameplay-recording.mp4`

## Expected Flow From Manual

1. Load the hosted game and start from the title screen with Enter or Space.
2. First playable frame shows a heading-up route: kart near bottom-center, road forward/up, HUD `NEXT CP1`, and minimap aligned with the route.
3. Normal driving with acceleration plus gentle steering clears CP1, CP2, CP3, and the yellow finish.
4. Drift should not start from standstill.
5. At moderate forward speed, holding Space or Shift while steering should start a drift.
6. Drift feedback should visibly charge through green `Early`, yellow `Ready`, and red `Strong`.
7. Releasing the drift key should convert the current charge into a short visible speed boost.
8. Wall/edge contact should weaken or cancel charge; red obstacle contact should cancel charge.
9. Effects such as skid trails, tire/exhaust particles, speed streaks, and the drift meter should not hide checkpoints, finish, road edges, obstacles, or minimap.
10. Race completion should show `LAP 1/1`, Race Complete, and a final time; restart should reset to the beginning.

## Recording Timestamp / Frame Notes

- `00:00.0`: Hosted game/title screen visible; objective and controls match the README/manual.
- `00:00.8`: First playable frame after Enter; HUD shows `NEXT CP1`, `LAP 0/1`, `DRIFT Idle`; route and minimap are readable.
- `00:01.2`: Standstill Shift+steer attempt remains `DRIFT Idle`, matching the manual condition that drift requires speed.
- `00:02.2`: At-speed drift attempt begins; HUD drift panel changes into a build/charge state while route remains readable.
- `00:02.6`: Drift release/cut sequence does not show a clear manual-matching Ready/Strong stage or obvious release boost in the recording.
- `00:03.2`: Restart is used to reset after the drift probe.
- `00:03.8`: Normal route is driven with acceleration plus gentle steering.
- `00:05.0`: Race Complete screen appears with `LAP 1/1`, `NEXT Done`, and final time.

## Supplemental Probe Frames

- `hosted-load.png`: Hosted load and visible controls.
- `first-playable-frame.png`: Heading-up first playable frame.
- `probes/drift-cdp-standstill-01.png`: Standstill drift attempt remains idle.
- `probes/continuous-ArrowLeft-1.png`: Held drift shows `DRIFT Early`.
- `probes/continuous-ArrowRight-2.png`: Wall scrub weakens/cuts drift charge.
- `recording-frames/frame-0010.png`: Continuous recording shows drift build state.
- `recording-frames/frame-0024.png`: Continuous recording shows Race Complete.

## Observed Result

The base route and race completion remain playable, but the manual-described drift progression is incomplete from a player perspective. I observed `Early` / build feedback and wall-scrub weakening, but did not observe stable `Ready` or `Strong` charge stages, and release did not produce a clear short speed boost before the drift was cut or the kart lost speed.

# Expected And Observed Flow - Audio Default Hotfix

Game: Side-Scrolling Platformer / Skyline Stepper
Hotfix: Audio Defaults Off / Explicit Opt-In
Recording: `gameplay-recording.mp4`
Recording method: browser-harness/CDP full-page frame capture encoded to MP4

## Expected Flow

1. Load the hosted game in a fresh browser profile.
2. Open Settings from the title/start state.
3. Confirm Generated UI Sounds is off and visible Volume is `0%`.
4. Close Settings, start the run, jump, and move briefly before opting into audio. Expected result: no game audio activity.
5. Open Settings and explicitly enable Generated UI Sounds with non-zero Volume.
6. Close Settings and perform a normal action. Expected result: game audio is now allowed and produces generated sound activity.
7. Open Settings and use Reset Defaults. Expected result: Generated UI Sounds returns off and Volume returns to `0%`.
8. Close Settings and perform another action. Expected result: audio remains silent after reset.
9. Simulate a stale saved settings profile with audio enabled and volume non-zero but no consent/opt-in marker.
10. Reload, open Settings, and confirm the stale state is normalized to Generated UI Sounds off and Volume `0%`.
11. Start/jump/move after the stale reload. Expected result: no audio plays until the player explicitly opts in again.
12. Confirm title/start, settings open/close, and short platform movement still work.

## Recording Timestamp / Frame Notes

- 0:00 / frame 1 - Fresh platformer title loaded.
- 0:00 / frame 2 - Settings opened on first load; sounds are off and Volume is `0%`.
- 0:00 / frame 3 - Settings closed at defaults.
- 0:00 / frame 4 - Run started before audio opt-in.
- 0:00 / frame 5 - Jump before audio opt-in; no audio events were captured.
- 0:00-0:01 / frames 6-10 - Short right movement smoke path works.
- 0:01 / frame 11 - Settings opened for explicit opt-in.
- 0:01 / frame 12 - Generated UI Sounds enabled and Volume set to 80%.
- 0:01 / frame 13 - Settings closed after opt-in.
- 0:01 / frame 14 - Jump after opt-in; Web Audio activity was captured.
- 0:01 / frame 15 - Settings opened for reset.
- 0:02 / frame 16 - Reset Defaults restored sounds off and Volume `0%`.
- 0:02 / frame 17 - Settings closed after reset.
- 0:02 / frame 18 - Jump after reset; no new audio events were captured.
- 0:02 / frame 19 - Stale saved state written through browser profile storage: audio true, volume 80, no consent marker.
- 0:02 / frame 20 - Reload after stale state.
- 0:02 / frame 21 - Settings after stale reload show sounds off and Volume `0%`.
- 0:02 / frame 22 - Settings closed after stale check.
- 0:02 / frame 23 - Start and jump after stale reload; no audio events were captured.
- 0:03 / frames 24-27 - Short platform movement continues to work after the stale-state check.

## Observed Audio Event Counts

- Before explicit opt-in: `0` Web Audio events.
- After explicit opt-in: `+2` Web Audio events from normal action.
- After Reset Defaults: `+0` new Web Audio events.
- After stale saved state reload without consent marker: `+0` new Web Audio events.

## Stale State Probe

The stale profile-state probe wrote a saved settings object with `audioEnabled: true` and `volume: 80`, while removing the consent/opt-in marker. After reload, the visible Settings panel showed Generated UI Sounds off and Volume `0%`, and start/jump actions produced no audio events.

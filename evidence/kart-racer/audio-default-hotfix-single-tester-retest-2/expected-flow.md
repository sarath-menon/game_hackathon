# Expected / Observed Flow

Game: Arcade Kart Racer  
Hotfix: Audio Defaults Off / Explicit Opt-In  
Attempt: Single canonical tester shared-window retest 2

## Test Surface

- Game URL: http://127.0.0.1:8765/games/kart-racer/index.html
- Manual: /Users/sarathmenon/Documents/game_hackathon/games/kart-racer/README.md
- Browser method: browser-harness attached to the shared Chrome window only.
- Viewport observed: approximately 1519 x 981 CSS pixels.
- Recording: 83 continuous frames captured at roughly 10 FPS and encoded to `gameplay-recording.mp4`.

## Expected Flow From Manual

1. First load opens the title/start state with UI sounds off and Volume 0%.
2. Opening Settings should expose audio controls with UI sounds off/unchecked and Volume at 0%.
3. Reset Defaults should restore UI sounds off/unchecked and Volume at 0%.
4. Starting the race and driving while audio is off should produce no generated game audio.
5. The player can explicitly opt in by enabling UI sounds and raising Volume above 0%.
6. After explicit opt-in, a gameplay or settings action may generate a short tone.
7. After disabling UI sounds and pressing Reset Defaults, no new generated audio should start unless the player opts in again.
8. Stale saved settings without audio fields should reload as muted/off.
9. Title/start, Settings open/close, and a short driving path should remain functional.

## Observed Flow And Evidence

1. First load reached the title screen with no audio events.
   - Screenshot: `01-first-load-title.png`
   - Audio probe: 0 events.

2. Settings opened from the title state with muted defaults.
   - Screenshot: `02-settings-initial-audio-off-volume-zero.png`
   - Observed state: UI sounds unchecked, Volume 0%, no saved storage.
   - Audio probe: 0 events.

3. Reset Defaults remained silent and preserved muted defaults.
   - Screenshot: `03-reset-defaults-audio-off-volume-zero.png`
   - Observed state: UI sounds unchecked, Volume 0%.
   - Audio probe: 0 events.

4. Start and short driving smoke worked before opt-in without audio.
   - Screenshots: `04-race-start-audio-off.png`, `05-driving-smoke-audio-off.png`
   - Audio probe after driving before opt-in: 0 events.

5. Explicit opt-in worked.
   - Screenshots: `06-settings-before-enable.png`, `07-ui-sounds-enabled-volume-up.png`
   - Observed state: UI sounds checked, Volume 80%.
   - Storage: `sound:true`, `volume:80`, `audioOptIn:true`.

6. A post-opt-in action generated audio.
   - Screenshot: `08-driving-after-audio-enabled.png`
   - Audio probe: `AudioContext.construct` and `OscillatorNode.start`.

7. Retest-1 regression path passed.
   - Screenshots: `09-settings-before-disable-reset.png`, `10-reset-after-disable-audio-off-volume-zero.png`, `11-driving-after-reset-off.png`
   - Event count before disabling/resetting: 3. The third event occurred while still opted in, during the Settings action before opt-out.
   - Event count after disabling UI sounds: 3.
   - Event count after Reset Defaults: 3.
   - Event count after driving with UI sounds off and Volume 0%: 3.
   - Observed state after reset: UI sounds unchecked, Volume 0%, storage `sound:false`, `volume:0`, `audioOptIn:false`.

8. Stale saved settings did not force audio on.
   - Screenshots: `12-stale-saved-setup.png`, `13-saved-non-audio-setting.png`, `14-after-stale-saved-reload-audio-off.png`
   - Observed state after reload: UI sounds unchecked, Volume 0%.
   - Audio probe after stale reload: 0 events.

## Result

The expected flow was completed. The hotfix satisfies the audio default and explicit opt-in requirements in this retest.

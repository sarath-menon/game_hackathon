# Arcade Kart Racer - Audio Defaults Off / Explicit Opt-In

Verdict: FAIL

## Test Inputs

- Game URL: http://127.0.0.1:8765/games/kart-racer/index.html
- README/manual: /Users/sarathmenon/Documents/game_hackathon/games/kart-racer/README.md
- Browser: shared Chrome window controlled through browser-harness only.
- Viewport: approximately 1519 x 981 CSS pixels.
- Scope: audio defaults off, reset defaults, explicit opt-in, stale saved state, settings open/close, and short driving smoke.

## Evidence

- Evidence folder: /Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/audio-default-hotfix-single-tester-retest-1
- Recording: /Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/audio-default-hotfix-single-tester-retest-1/gameplay-recording.mp4
- Expected/observed flow: /Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/audio-default-hotfix-single-tester-retest-1/expected-flow.md
- Observation data: /Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/audio-default-hotfix-single-tester-retest-1/run-observations.json
- Recording method: browser-harness screenshots from the shared Chrome tab, captured continuously at roughly 10 FPS and encoded with ffmpeg to MP4.
- Audio method: page-level black-box audio probe installed before navigation, tracking `AudioContext`, `OscillatorNode.start`, `AudioBufferSourceNode.start`, and media `play()` calls.

## Summary

First load, Reset Defaults from a clean state, stale saved settings, and normal driving while audio was off all matched the manual: UI sounds were unchecked, Volume showed 0%, saved settings were muted when present, and no audio events occurred. The game loaded, Settings opened/closed, explicit audio opt-in worked, and short driving input worked without runtime errors.

The hotfix fails because after explicitly enabling audio, then turning UI sounds off and pressing Reset Defaults, the visible state returned to UI sounds off and Volume 0%, but the audio probe recorded a new `OscillatorNode.start`. Reset-to-muted must not generate game audio after opt-out.

## Findings

### HIGH - Reset Defaults can emit generated audio after opt-out

- Status: Open
- Repro steps:
  1. Clear the localhost game storage for the kart racer origin.
  2. Load the game, open Settings, verify UI sounds unchecked and Volume 0%.
  3. Start a race and drive briefly; observe no audio events.
  4. Open Settings, enable UI sounds, and raise Volume to 80%.
  5. Close Settings and perform a short action; observe audio events after explicit opt-in.
  6. Reopen Settings, uncheck UI sounds, press Reset Defaults, and observe UI sounds unchecked and Volume 0%.
  7. Continue after the reset/off sequence and inspect the audio probe events.
- Expected behavior: Once UI sounds are unchecked and Reset Defaults restores Volume 0%, no generated game audio should play unless the player explicitly opts in again.
- Actual behavior: The probe recorded a new `OscillatorNode.start` after the disable/reset sequence. The visible state showed UI sounds unchecked and Volume 0%, and storage showed `sound:false`, `volume:0`, `audioOptIn:false`.
- Evidence:
  - `07-ui-sounds-enabled-volume-up.png`: explicit opt-in with UI sounds checked and Volume 80%.
  - `10-reset-after-disable-audio-off-volume-zero.png`: post-reset UI shows UI sounds unchecked and Volume 0%.
  - `run-observations.json`: `enabled_events` has 2 events; `after_reset_action_events` has 3 events, with the extra `OscillatorNode.start` at `t:19789`.

## Passing Checks

- First load default: PASS. UI sounds unchecked, Volume 0%, no audio events.
- Reset Defaults from clean state: PASS. UI sounds unchecked, Volume 0%, storage saved muted defaults.
- No audio before explicit opt-in: PASS during the title/settings/start/short-driving portion before opt-in.
- Explicit opt-in: PASS. UI sounds could be enabled and Volume raised to 80%; subsequent action generated audio.
- Stale saved state: PASS. A saved settings object with non-audio fields only reloaded with UI sounds unchecked and Volume 0%.
- Smoke regression: PASS. Title/start state, Settings open/close, Start Race, and a short driving path worked.
- Runtime stability: PASS. No blocking console/runtime errors were captured.

## Audio-Default Approval Statement

Not approved. The game correctly defaults to muted on first load and stale saved reload, but Reset Defaults is not fully silent after previous opt-in and opt-out. Audio-default hotfix acceptance should remain blocked until reset/opt-out cannot emit generated sound.

## State / Action Clarity

FAIL. The visible state after Reset Defaults clearly communicates UI sounds off and Volume 0%, but an audio event still occurs. That makes the audio state misleading in normal play.

## Regression Checklist

- Hosted game loads: PASS
- Manual matches visible first-load audio defaults: PASS
- Manual matches explicit opt-in behavior: PASS
- Manual matches reset-to-muted behavior: FAIL due generated sound during/after reset off
- Settings discoverable/openable from title and race: PASS
- Settings close without breaking driving input: PASS
- Short driving path works: PASS
- No blocking runtime errors: PASS

## QA Methodology Carry-Forward

- For settings with custom visual labels but unlabeled form controls, map controls by visible order and confirm actual input values after each interaction.
- For audio hotfixes, compare audio event counts before and after every off-state action, especially Reset Defaults and opt-out flows, rather than checking only first load.
- Treat visible muted state plus generated audio as both a functional audio failure and a state/action clarity failure.

## Approval Statement

FAIL. Required evidence files are complete, but the hotfix does not meet the explicit audio opt-in requirement because Reset Defaults can still produce generated audio after the player turns sounds off.

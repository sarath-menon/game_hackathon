# Ash Circuit Audio Defaults Hotfix - Expected And Observed Flow

Test surface: `http://127.0.0.1:8765/games/deckbuilder/index.html`

Recording: `gameplay-recording.mp4`, 54 frames at 10 FPS, duration 5.4 seconds. The recording was captured in a controlled tab in the shared Chrome window through browser-harness. No isolated Chrome profile, separate Chrome window, or remote browser was launched.

## Expected Flow

1. Clear the localhost origin state for a clean shared-window retest.
2. Load the hosted game with an audio API probe installed before page load.
3. Confirm first load does not start audio before any player opt-in.
4. Open Settings and verify Audio feedback is off by default. If a volume control is visible, it should be 0 or muted.
5. Click Reset Defaults and verify Audio feedback remains off.
6. Start a run, play one card with Audio feedback off, and verify no generated audio starts.
7. Explicitly enable Audio feedback in Settings.
8. Play another action and verify generated audio starts only after that opt-in.
9. Disable Audio feedback and click Reset Defaults; verify Settings returns to audio off.
10. End the turn after reset/off and verify no new audio events occur.
11. Save a non-audio setting, reload, and verify stale/saved non-audio settings do not silently force audio on.

## Observed Timestamp Flow

- `00.0s`: Shared Chrome controlled tab loads Ash Circuit.
- `00.3s`: First-load audio probe shows zero audio events before interaction.
- `00.7s`: Settings opens. Audio feedback checkbox is unchecked and active summary says `audio off, saved`.
- `01.0s`: Reset Defaults keeps Audio feedback unchecked and active summary still says `audio off, saved`.
- `01.1s - 01.5s`: Start Run and play Strike while audio is off. Audio probe still reports zero events.
- `01.9s - 02.3s`: Settings opens during combat; Audio feedback is explicitly enabled. Active summary updates to `audio on, saved`.
- `02.4s - 02.6s`: Play Guard after opt-in. Audio probe records AudioContext construction and oscillator starts.
- `03.0s - 03.5s`: Audio feedback is disabled and Reset Defaults is clicked. Active summary returns to `audio off, saved`.
- `03.6s - 03.8s`: End Turn after reset/off. Audio event count does not increase.
- `04.2s - 05.2s`: Save Large text size with audio still off, reload, and open Settings. Saved state persists Large text while Audio feedback remains unchecked and active summary says `audio off, saved`.

## Evidence Screenshots

- `01-first-load-title.png`: First load title state.
- `02-settings-initial-audio-off.png`: Settings default with Audio feedback off.
- `03-reset-defaults-audio-off.png`: Reset Defaults keeps audio off.
- `05-card-play-audio-off.png`: Card play while audio is off.
- `08-audio-enabled.png`: Explicit Audio feedback opt-in.
- `09-action-audio-enabled.png`: Action after opt-in.
- `11-reset-after-disable-audio-off.png`: Disable/reset returns audio off.
- `12-end-turn-after-audio-off-reset.png`: End Turn after reset/off.
- `15-after-saved-non-audio-reload.png`: Saved non-audio preference reloads with audio still off.

## Audio Probe Summary

- First load before interaction: `0` audio events.
- Card play while audio off: `0` audio events.
- Card play after explicit opt-in: AudioContext construction plus oscillator starts observed.
- End Turn after disable/reset: no new audio events after the opt-in events already logged.
- Saved non-audio reload: Audio feedback remains off.

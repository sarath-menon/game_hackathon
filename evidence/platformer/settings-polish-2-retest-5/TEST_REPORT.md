# Skyline Stepper - Settings Polish 2 Retest 5

## Verdict: FAIL

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/platformer/index.html?settingsPolishRetest=5`
- Player manual URL: `http://127.0.0.1:8765/games/platformer/README.md`
- Player manual path: `/Users/sarathmenon/Documents/game_hackathon/games/platformer/README.md`
- Browser surface: shared Chrome window through browser-harness only
- Viewport: 1519 x 981 desktop
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-5`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-5/gameplay-recording.mp4`
- Recording method: clean screenshots encoded to MP4 at 2 FPS

## Summary

The exact cache-busted URL loaded and preserved the `settingsPolishRetest=5` query string throughout the pass. The stale-content suspicion from Retest 4 is resolved: the current Settings UI is visible on the cache-busted URL, including the `Player Variant Controls` block and all six Air Control / Damage Profile buttons.

The targeted variant-control fix is verified. `Snappy` and `Practice` buttons were present, readable, changed selected state, updated the matching dropdown values, persisted across reload, and Reset Defaults returned Air Control to `Steady`, Damage Profile to `Standard`, generated sounds off, and volume `0%`.

The pass still fails because the in-run settings close/resume path leaves the game in a paused state after the settings panel is closed. After closing Settings during a run, the panel disappears but the HUD still reads `Settings paused`; subsequent movement/jump input did not resume normal gameplay. This violates the manual statement that opening settings during play pauses the run until the panel closes.

## Findings

### HIGH - Closing Settings during a run leaves the game paused with no panel visible

- Evidence clip: gameplay-recording.mp4 @ 00:07-00:12
- Evidence status: Main recording segment
- Why this evidence proves the finding: The run segment shows the HUD reading `Settings paused`, then a no-panel gameplay view that still remains in the paused HUD state after follow-up movement/jump input, proving the in-run close path did not resume normal play.
- Status: Open
- Evidence:
  - `33-in-run-settings-closed.png` - Settings panel still visible during the attempted in-run close sequence
  - `53-after-click-close-settings.png` - Settings panel is gone, but HUD still says `Settings paused`
  - `59-actual-run-input-5.png` and `64-actual-run-input-10.png` - after movement/jump input, HUD still says `Settings paused` and the run does not visibly resume normal play
- Repro steps:
  1. Load `http://127.0.0.1:8765/games/platformer/index.html?settingsPolishRetest=5`.
  2. Start or reach a run state.
  3. Open Settings during the run.
  4. Click `Close Settings`.
  5. Try movement/jump input.
- Expected behavior: Closing Settings during play should unpause the run and restore normal movement/input.
- Actual behavior: the settings panel closes, but the HUD remains `Settings paused`; movement/jump input does not visibly resume normal gameplay.
- Impact: This blocks approval because settings usability from the in-run context is part of the manual and QA scope.

### LOW - Manual and current cache-busted UI now match for variant controls

- Evidence clip: gameplay-recording.mp4 @ 00:01-00:04
- Evidence status: Main recording segment
- Why this evidence proves the finding: The recording shows the cache-busted Settings UI with the `Player Variant Controls` block, Snappy/Practice selected states, persisted Settings view, and Reset Defaults returning the controls to their default states.
- Status: Verified fixed / informational
- Evidence:
  - `02-settings-open-after-cache-busted.png`
  - `03-after-snappy-button.png`
  - `04-after-practice-button.png`
  - `06-after-reload-settings-persisted.png`
  - `08-after-reset-defaults.png`
  - `09-after-reset-top.png`
- Notes: The previous stale UI was not reproduced on the cache-busted URL. The expected button UI is present and functional.

## Settings Coverage Table

| Area | Manual expectation | Result | Evidence / notes |
|---|---|---|---|
| Exact cache-busted URL | Query string loaded/preserved | Pass | `01-cache-busted-url-loaded.png` |
| Settings opens with Player Variant Controls | Block visible near top | Pass | `02-settings-open-after-cache-busted.png` |
| Air Control buttons | `Steady`, `Snappy`, `Floaty` visible/readable | Pass | `02-settings-open-after-cache-busted.png` |
| Damage Profile buttons | `Standard`, `Gentle`, `Practice` visible/readable | Pass | `02-settings-open-after-cache-busted.png` |
| Air Control button behavior | Button updates state and dropdown | Pass | `03-after-snappy-button.png`; value `snappy`, `aria-pressed=true` |
| Damage Profile button behavior | Button updates state and dropdown | Pass | `04-after-practice-button.png`; value `practice`, `aria-pressed=true` |
| Persistence/reload | Changed Air/Damage persist on reload | Pass | `05-after-reload-persistence-title.png`, `06-after-reload-settings-persisted.png` |
| Reset Defaults | Air `Steady`, Damage `Standard`, audio off, volume `0%` | Pass | `08-after-reset-defaults.png`, `09-after-reset-top.png` |
| Generated UI Sounds default/reset | Off and `0%` | Pass | `02`, `08`, `09` |
| Checkpoint Assist default | Off | Pass | visible unchecked in Settings evidence |
| Camera Smoothing / Lookahead | `12` / `42%` | Pass | visible in Settings evidence |
| Route Marker Intensity | `100%` | Pass | visible in Settings evidence |
| Route Cue Style | Full default visible | Pass | visible in Settings evidence |
| High-Contrast Hazards | Default off | Pass | visible unchecked in lower Settings evidence |
| Objective Labels | Normal default visible | Pass | visible in Settings evidence |
| Background Detail | Full Parallax default visible | Pass | visible in lower Settings evidence |
| In-run Settings close/resume | Closes panel and resumes run | Fail | HUD remains `Settings paused` after close. |
| Completion/failure contexts | Settings usable after completion/failure | Not completed | Stopped after in-run pause regression. |
| Lower-deck completion/checkpoint/exit | Reachable smoke path | Not completed | Blocked by in-run pause/resume regression. |
| Narrow viewport | Usable/readable | Not completed | Stopped after blocking in-run regression. |

## Regression Checklist

| Check | Result | Notes |
|---|---|---|
| Cache-busted game loads | Pass | URL query preserved. |
| Current UI, not stale UI | Pass | Player Variant Controls appear. |
| Variant buttons present | Pass | All six visible. |
| Variant buttons update state | Pass | Snappy/Practice verified. |
| Variant state persists | Pass | Snappy/Practice survived reload. |
| Reset Defaults | Pass | Returned Air/Damage/audio to defaults. |
| Settings from title | Pass | Opened from title modal. |
| Settings from run | Fail | Closing in-run Settings leaves run paused. |
| Gameplay movement smoke | Fail / blocked by pause state | Inputs after close did not resume normal play. |
| Route/checkpoint/exit/failure/restart | Not completed | Stopped after in-run settings regression. |
| No target drift | Pass | All captured URL checks stayed on cache-busted Platformer URL. |

## Readability / State Clarity Gate: FAIL

The cache-busted Settings UI is readable and the variant controls are discoverable. The gate fails because the in-run state becomes misleading after closing Settings: no panel is visible, but the HUD still says `Settings paused` and normal play does not resume. Available action/state is unclear to the player.

## Audio-Default Approval Statement

Audio defaults are approved for this pass. Generated UI Sounds were off with volume `0%` on first Settings view and after Reset Defaults.

## Provider / Environment Classification

This is a game `FAIL`, not `BLOCKED_ENVIRONMENT`. The cache-busted URL loaded the current UI, so stale-content suspicion did not block evaluation. The remaining failure is a visible game behavior regression on the verified Platformer URL.

## Final Approval / Retry Statement

Not approved. Route back to the Platformer builder to fix the in-run settings close/resume path so closing Settings clears the paused state and restores gameplay input. Retest can start from the cache-busted URL and should re-smoke variant controls, reset/defaults, then verify in-run settings close, movement, route/checkpoint/exit, failure/restart, completion context, and narrow viewport.

# Skyline Stepper - Settings Polish 2 Retest 4

## Verdict: FAIL

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/platformer/index.html`
- Player manual URL: `http://127.0.0.1:8765/games/platformer/README.md`
- Player manual path: `/Users/sarathmenon/Documents/game_hackathon/games/platformer/README.md`
- Browser surface: shared Chrome window through browser-harness only
- Viewport: 1519 x 981 desktop
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-4`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-4/gameplay-recording.mp4`
- Recording method: clean screenshots encoded to MP4 at 2 FPS

## Summary

The game loaded in the single shared Chrome tab, and the active page URL was verified as the Platformer game before each tested segment. No target drift or dashboard/evidence contamination was observed.

The retest fails because the follow-up fix target is not visible in the tested player-facing Settings panel. The manual states Air Control and Damage Profile can be changed with visible option buttons near the top of Settings. The handoff also expected a full-width `Player Variant Controls` block near the top with six buttons: `Steady`, `Snappy`, `Floaty`, `Standard`, `Gentle`, and `Practice`. In the clean Retest 4 evidence, Settings did not open at the top after reload, and after moving the panel to the top, the `Player Variant Controls` block and the six visible buttons were still absent. Only the prior dropdown controls were visible.

Per the handoff classification, missing top-level variant buttons while the active URL is verified as Platformer is a game `FAIL`, not `BLOCKED_ENVIRONMENT`.

## Findings

### HIGH - Required Player Variant Controls block and six variant buttons are missing

- Evidence clip: gameplay-recording.mp4 @ 00:00-00:03
- Evidence status: Main recording segment
- Why this evidence proves the finding: The recording includes the top Settings view and the post-reload top/lower Settings views; none show the expected full-width `Player Variant Controls` block or six Air/Damage option buttons.
- Status: Open
- Evidence:
  - `01-url-verified-title.png` - clean verified Platformer target
  - `02-settings-open-top.png` - Settings state before reload still shows old dropdown-only layout
  - `07-after-title-settings-dom-coord.png` - Settings opened after reload but landed near lower settings instead of top controls
  - `08-after-home-top.png` - top of Settings after Home; no `Player Variant Controls` block and no six visible Air/Damage option buttons
- Repro steps:
  1. Open `http://127.0.0.1:8765/games/platformer/index.html`.
  2. Verify the active URL is the Platformer game URL.
  3. Open Settings from the title/game state.
  4. Inspect the top of Settings.
- Expected behavior: a full-width `Player Variant Controls` block is visible near the top with Air Control buttons `Steady`, `Snappy`, `Floaty` and Damage Profile buttons `Standard`, `Gentle`, `Practice`.
- Actual behavior: the block and buttons are not visible. The panel shows the existing setting cards and dropdowns only.
- Impact: The primary builder fix cannot be verified, and players still do not have the documented visible button path for changing Air Control and Damage Profile.

### MEDIUM - Settings reopens scrolled near the bottom after reload/title flow

- Evidence clip: gameplay-recording.mp4 @ 00:01-00:03
- Evidence status: Main recording segment
- Why this evidence proves the finding: After the title/reload sequence, the recording shows Settings opening in the lower settings area before a top-of-panel inspection, demonstrating the inconsistent initial scroll position.
- Status: Open
- Evidence:
  - `07-after-title-settings-dom-coord.png`
  - `08-after-home-top.png`
- Repro steps:
  1. Reload the assigned Platformer URL.
  2. Open Settings from the title modal.
  3. Observe the initial scroll position.
- Expected behavior: Settings opens with the title, top controls, and Player Variant Controls visible immediately.
- Actual behavior: Settings opened near the lower section around Background Detail, Reduced Motion, Generated UI Sounds, Reset Defaults, and Close Settings. Pressing Home was needed to inspect the top.
- Impact: Settings first-control visibility is still inconsistent and weakens discoverability.

## Settings Coverage Table

| Area | Manual expectation | Result | Evidence / notes |
|---|---|---|---|
| Hosted game loads | Direct URL reaches Platformer | Pass | `01-url-verified-title.png` |
| Anti-contamination URL checks | Active URL remains Platformer | Pass | URL printed for each captured segment. |
| Settings opens with top controls visible | Title/top controls visible immediately | Fail | `07-after-title-settings-dom-coord.png` opens near lower settings; `08-after-home-top.png` required Home. |
| Player Variant Controls block | Visible near top | Fail | Missing in `08-after-home-top.png`. |
| Air Control buttons | `Steady`, `Snappy`, `Floaty` present/readable/usable | Fail | Buttons absent. |
| Damage Profile buttons | `Standard`, `Gentle`, `Practice` present/readable/usable | Fail | Buttons absent. |
| Air Control default | `Steady` | Pass | Dropdown value visible as `Steady` in `08-after-home-top.png`. |
| Damage Profile default | `Standard` | Pass | Dropdown value visible as `Standard` in `08-after-home-top.png`. |
| Checkpoint Assist default | `Off` | Pass | Checkbox unchecked in `08-after-home-top.png`. |
| Camera Smoothing / Lookahead | `12` / `42%` | Pass | Visible in `08-after-home-top.png`. |
| Route Marker Intensity | `100%` | Pass | Visible in `08-after-home-top.png`. |
| Route Cue Style | `Full` default | Pass | Visible in `08-after-home-top.png`. |
| High-Contrast Hazards | Default off | Pass | Visible unchecked in lower panel evidence. |
| Objective Labels | `Normal` default | Pass | Visible in lower/top evidence. |
| Background Detail | `Full Parallax` default | Pass | Visible in `07-after-title-settings-dom-coord.png`. |
| Generated UI Sounds default | Off, volume `0%` | Pass for visible default | `07-after-title-settings-dom-coord.png` shows unchecked sounds and `0%`. |
| Reset Defaults | Restores Air `Steady`, Damage `Standard`, audio off/0 | Not completed | Blocked by missing variant buttons. |
| Persistence/reload for changed Air/Damage | Changed values persist | Not completed | Cannot test button-driven persistence when buttons are absent. |
| In-run/failure/completion Settings | Usable contexts | Not completed | Stopped after blocking fix failure. |
| Narrow viewport | Usable/readable | Not completed | Stopped after blocking fix failure. |

## Regression Checklist

| Check | Result | Notes |
|---|---|---|
| Game loads | Pass | Clean Platformer URL evidence captured. |
| Settings can open | Pass | Opens from title/game state. |
| Settings opens at top | Fail | Reopened near lower section after reload/title flow. |
| New Player Variant Controls | Fail | Required block/buttons absent. |
| Air/Damage variant button changes | Fail | Buttons absent, so no change path available. |
| Audio default off/0 | Pass for default visibility | Reset path not tested. |
| Reset Defaults | Not tested | Blocked by missing variant controls. |
| Persistence/reload | Not tested | Blocked by missing variant controls. |
| Lower-deck completion/checkpoint/exit | Not tested | Stopped after blocking settings failure. |
| Standard health-zero failure | Not tested | Stopped after blocking settings failure. |
| Collectibles/hazards/restart | Not tested | Stopped after blocking settings failure. |
| Runtime/softlock blockers | No blocking runtime error observed | The failure is missing UI/control behavior. |

## Readability / State Clarity Gate: FAIL

The Settings panel text and existing controls are readable, but the state/action clarity gate fails because the documented and handoff-required `Player Variant Controls` block is missing. Players are told Air Control and Damage Profile have visible option buttons, but those buttons are not available in the tested UI, so the intended action path is not discoverable.

## Audio-Default Approval Statement

Generated UI Sounds were visibly off and Volume was `0%` in the Settings panel. Full audio-default approval is withheld because Reset Defaults was not reached after the blocking missing-variant-controls failure.

## Provider / Environment Classification

This is a game `FAIL`, not `BLOCKED_ENVIRONMENT`. The active page URL stayed `http://127.0.0.1:8765/games/platformer/index.html`, the evidence is clean Platformer evidence, and the failure is visible in the game Settings UI.

## Final Approval / Retry Statement

Not approved. Route back to the Platformer builder to ensure the shipped player-facing game displays the `Player Variant Controls` block near the top of Settings and exposes all six Air Control / Damage Profile buttons with visible selected states. Retest should first verify the block appears immediately on Settings open, then verify button state changes, dropdown synchronization, persistence/reload, Reset Defaults, audio reset, and the remaining gameplay regression scope.

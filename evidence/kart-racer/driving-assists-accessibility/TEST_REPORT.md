# Arcade Kart Racer - Driving Assists And Control Accessibility Upgrade

## Verdict

`BLOCKED_ENVIRONMENT`

The game loaded and the title Settings panel exposed the new assist/control settings, but the shared Chrome/browser-harness target repeatedly drifted away from the Kart game to the dashboard during the run. This prevented reliable evaluation of the required driving-assist behavior, reset/audio defaults, persistence, in-race settings, race completion, restart, drift/boost, and narrow viewport scope. This is not a Kart game `FAIL`.

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/kart-racer/index.html`
- Manual path: `/Users/sarathmenon/Documents/game_hackathon/games/kart-racer/README.md`
- Manual URL: `http://127.0.0.1:8765/games/kart-racer/README.md`
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/driving-assists-accessibility/`
- Browser: shared Chrome through browser-harness only
- Desktop viewport observed before drift: 1519 x 981
- Recording method: clean screenshot sequence encoded to H.264 MP4 at 30 fps

## Environment Classification

- Provider/local server: not blocked. The hosted game URL loaded.
- Game evaluation: `BLOCKED_ENVIRONMENT`.
- Exact blocker: browser-harness target drifted to `http://127.0.0.1:8765/dashboard.html` during the active QA run. A previous wheel-scroll attempt also timed out while interacting with the Settings panel.
- Contaminated evidence handling: dashboard-contaminated frames were removed from the evidence folder and are not used for the verdict or recording.

## Summary

Clean evidence confirms that the game and title Settings panel load, and that the new player-facing settings are visible and readable at the top/mid Settings positions. The panel showed assist/control settings matching the manual, including Driving assist, Auto-accelerate, Stability assist, Brake/recovery assist, Edge recovery help, Route cue intensity, Camera height, Reduced motion, High contrast readability, and related HUD/minimap controls.

The pass could not proceed reliably into required behavior verification. The target drift occurred before race-driving evidence could be captured, so this report does not approve or reject the game upgrade.

## Severity-Rated Findings

### Blocker - Shared browser-harness target drift prevents reliable QA

- Status: Open environment blocker
- Severity: Blocker
- Evidence: clean frames end at `08-settings-after-page-down.png`; later drift was observed in command output as `http://127.0.0.1:8765/dashboard.html`
- Repro steps:
  1. Open `http://127.0.0.1:8765/games/kart-racer/index.html` through browser-harness in the shared Chrome window.
  2. Open Settings and capture visible controls.
  3. Continue into additional settings/race-driving actions.
  4. Observe harness target drift to the dashboard.
- Expected behavior: Browser-harness remains attached to the active Kart game tab for the full QA pass.
- Actual behavior: Harness target drifted to dashboard, invalidating later gameplay captures and preventing reliable evaluation.
- Impact: Required scope could not be completed. This is an environment/harness blocker, not a game defect.

## Clean Evidence Captured

| Area | Result | Evidence |
| --- | --- | --- |
| Game URL loads | Captured | `01-title-load.png`, `04-fresh-title-before-settings.png` |
| Title Settings opens | Captured | `02-title-settings-top.png`, `05-settings-top-visible.png` |
| Top assist/control settings visible | Captured | `05-settings-top-visible.png`, `06-settings-after-top-toggles-dropdown.png`, `07-settings-after-assist-change.png` |
| Camera/HUD/readability settings visible | Captured | `03-title-settings-mid.png`, `08-settings-after-page-down.png` |
| Race-driving behavior | Blocked | Target drift before reliable capture |
| Reset Defaults/audio defaults | Blocked | Target drift before reliable capture |
| Persistence/reload | Blocked | Target drift before reliable capture |
| Narrow viewport | Blocked | Target drift before reliable capture |

## Settings Coverage Table

| Setting / Area | Clean Result |
| --- | --- |
| Steering sensitivity | Visible/readable |
| Driving assist | Visible/readable as dropdown; behavior not verified |
| Auto-accelerate | Visible/readable as checkbox; behavior not verified |
| Stability assist | Visible/readable as slider; behavior not verified |
| Brake / recovery assist | Visible/readable as checkbox; behavior not verified |
| Edge recovery help | Visible/readable as checkbox; behavior not verified |
| Effect intensity | Visible/readable; reduced state was visible after interaction |
| Reduced motion | Visible/readable as checkbox; behavior not verified |
| Marker intensity | Visible/readable as slider; behavior not verified |
| High contrast readability | Visible/readable as checkbox; behavior not verified |
| Camera distance | Visible/readable as slider; behavior not verified |
| Camera height | Visible/readable as dropdown; behavior not verified |
| HUD scale | Visible/readable as slider; behavior not verified |
| Minimap size | Visible/readable as slider; behavior not verified |
| Route chevrons | Visible/readable as checkbox; behavior not verified |
| Route cue intensity | Visible/readable as slider; behavior not verified |
| Checkpoint labels | Visible/readable as checkbox; behavior not verified |
| Input help | Visible/readable as checkbox; behavior not verified |
| Audio / volume | Blocked before clean capture |
| Reset Defaults | Blocked before clean capture |

## Regression Checklist

| Regression Area | Result |
| --- | --- |
| Start race | Blocked by target drift |
| Auto-accelerate movement | Blocked by target drift |
| Brake/reverse | Blocked by target drift |
| Stability/driving assist mechanical difference | Blocked by target drift |
| Brake/recovery or edge recovery effect | Blocked by target drift |
| Camera height visual framing | Blocked by target drift |
| Route cue intensity in race | Blocked by target drift |
| Reduced motion/effects in race | Blocked by target drift |
| In-race Settings open/close | Blocked by target drift |
| CP1 -> CP2 -> CP3 -> finish | Blocked by target drift |
| Race completion | Blocked by target drift |
| Restart | Blocked by target drift |
| Drift/boost | Blocked by target drift |
| HUD/minimap/readability/orientation gate | Blocked by target drift |
| Narrow viewport | Blocked by target drift |

## Audio-Default Statement

Audio default and Reset Defaults audio behavior were not reliably evaluated in this pass because the environment drifted before the audio section/reset controls could be captured and tested. No audio-default approval is given.

## Readability and Orientation Gate

The Settings UI was readable in clean title-state evidence. The race readability/orientation gate could not be evaluated because target drift occurred before reliable driving evidence.

## QA Methodology Carry-Forward

- For local games after repeated drift, capture URL-state evidence at every major segment and stop once the target leaves the assigned game.
- Remove contaminated frames before encoding or reporting.
- Do not convert harness drift into a game `FAIL`; preserve clean evidence and classify as `BLOCKED_ENVIRONMENT`.
- For the retry, request browser maintenance to leave exactly one Kart tab and no dashboard/evidence tabs before attempting race behavior.

## Final Statement

`BLOCKED_ENVIRONMENT`. The upgrade is not approved or rejected. Retry the same Kart driving-assists handoff after shared Chrome/browser-harness target stability is restored.


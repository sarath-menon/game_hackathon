# Turn-Based Deckbuilder / Ash Circuit - Settings Panel Phase 1

Verdict: PASS

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/deckbuilder/index.html`
- README/manual: `http://127.0.0.1:8765/games/deckbuilder/README.md`
- Browser: Chrome 149.0.7827.115 through browser-harness CDP, isolated `deckbuilder-settings` profile
- Viewports: desktop `1200x900`; narrow `430x820`
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/settings-phase-1`
- Recording: `gameplay-recording.mp4`, 593 frames, 10 FPS, 59.3s, H.264 MP4, padded to `1200x954`

## Summary

Settings Panel Phase 1 passes. All documented settings were discoverable, adjustable, resettable, and either visibly affected play or visibly updated the active settings state as documented. Persistence on/off behavior matched the manual. Core combat regression paths passed, including reward selection, deck update into encounter 2, Final Victory, Defeat, restart, Focus/Fractured preview math, disabled energy reasons, enemy intent/actions, and runtime stability.

One low-severity usability issue remains: the settings panel can open scrolled to the bottom with the first setting clipped above the viewport. Mouse-wheel scrolling exposes the top and bottom controls on desktop and narrow viewports, so this is not blocking.

## Findings

### LOW - Settings Panel Can Open With Top Controls Clipped

- Status: Open, non-blocking
- Repro steps:
  1. Load the game at `1200x900` or `430x820`.
  2. Open `Settings`.
  3. Observe the panel's initial scroll position.
- Expected behavior: Settings should open with the title and first setting visible, or otherwise make the scroll position obvious without hiding the initial control.
- Actual behavior: The panel can open near the bottom; on desktop the Animation speed select is partially above the viewport, and on narrow viewport several upper settings can be above the visible panel until scrolling.
- Evidence: `26-scroll-before-wheel.png`, `27-scroll-after-wheel-up.png`, `31-narrow-after-wheel-down.png`
- Evidence clip: `gameplay-recording.mp4 @ 00:01-00:08`
- Evidence status: Main recording segment
- Why this evidence proves the finding: The recording segment shows the Settings panel at different scroll positions where the top controls are not immediately visible until scrolling exposes them.

## Settings QA Checklist

- Discoverable from title/start state: PASS. `Settings` is visible beside `Start Run`.
- Discoverable during combat: PASS. Header `Settings` remains available during combat.
- Animation speed: PASS. Relaxed/Standard/Fast options are present; Fast selection updates active summary and was used during combat recording.
- Reduced motion: PASS. Toggle updates active summary and play remains readable with immediate HP/status/chip feedback.
- Tooltip/detail level: PASS. Detailed previews show Focus/Fractured math, e.g. `10 base +2 Focus -2 Fractured`; Compact previews show final outcomes only.
- Text size: PASS. Large text changed measured body font from 16px to 18px and updated visible UI sizing.
- Confirm End Turn: PASS. Browser confirmation appears before ending the turn; cancel leaves the player turn unchanged.
- Confirm no-guard turns: PASS. Browser confirmation appears when ending at 0 guard against an attacking intent; cancel leaves the player turn unchanged.
- Feedback intensity: PASS. Quiet/Standard/Emphatic options are present, active summary updates, and floating chips remain readable during card/enemy actions.
- Persistence on: PASS. Non-default settings persisted after reload.
- Persistence off: PASS. Session-only changes were not retained after reload.
- Reset Defaults: PASS. Restored Standard animation, motion on, Detailed previews, Normal text, confirmations off, Standard feedback, and persistence on.
- Repeated open/close: PASS. Settings opened and closed repeatedly from title and combat without breaking mouse interaction.
- Desktop viewport: PASS with low finding noted above.
- Narrow viewport: PASS with low finding noted above; controls remain reachable by scrolling.

## State/Action Clarity Assessment

PASS. Player HP, enemy HP, guard, Focus, Fractured, energy, draw/hand/discard counts, enemy intent, card previews, disabled reasons, reward choice, encounter number, selected reward, Final Victory, Defeat, and restart were understandable from normal play. Settings did not make important state, available actions, consequences, confirmations, enemy intent, statuses, or end states misleading.

## Regression Checklist

- Hosted game loads: PASS.
- README/manual matches visible behavior: PASS.
- Start run: PASS.
- Card play and energy spending: PASS.
- Draw, hand, and discard counts: PASS.
- Attack, guard, draw, Focus, and mixed cards: PASS.
- Enemy intent and enemy actions: PASS.
- Focus and Fractured status visibility and preview math: PASS.
- Disabled/unaffordable card reasons: PASS.
- Reward choice after encounter 1: PASS.
- Selected reward updates deck and persists into encounter 2: PASS. Flare Shot selected; encounter 2 status shows deck size 13 and reward: Flare Shot.
- Encounter 2 transition: PASS.
- Final Victory: PASS.
- Defeat path: PASS.
- Restart/Play Again: PASS.
- Console/runtime blocking errors: PASS. Captured runtime error list was empty.

## Evidence References

- Continuous recording: `gameplay-recording.mp4`
- Expected/observed flow: `expected-flow.md`
- Observation log: `run-observations.json`
- Reward choice: `32-reward-choice.png`
- Disabled reason: `33-disabled-reason.png`
- Final victory: `23-final-victory.png`
- Defeat: `25-defeat-screen.png`

## Approval Statement

Approved for Settings Panel Phase 1. Verdict is PASS because required evidence is complete, state/action clarity passes, no high or critical findings remain, and observed behavior matches the README/manual.

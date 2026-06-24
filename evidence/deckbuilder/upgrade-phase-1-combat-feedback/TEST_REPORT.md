# Ash Circuit Upgrade Phase 1 Test Report

- Game and upgrade: Turn-Based Deckbuilder / Ash Circuit, Upgrade Phase 1 Combat Feedback And Math Preview
- Verdict: `PASS`
- Date: 2026-06-25
- Tester role: dedicated black-box deckbuilder tester

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/deckbuilder/index.html`
- README/manual URL: `http://127.0.0.1:8765/games/deckbuilder/README.md`
- Direct manual path used as player-facing docs only: `/Users/sarathmenon/Documents/game_hackathon/games/deckbuilder/README.md`
- Browser: Chrome controlled through `browser-harness`
- Desktop viewport: 1728 x 996 CSS pixels
- Narrow viewport check: 430 x 820 CSS pixels

## Evidence

- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/upgrade-phase-1-combat-feedback/`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/upgrade-phase-1-combat-feedback/gameplay-recording.mp4`
- Expected flow: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/upgrade-phase-1-combat-feedback/expected-flow.md`
- Narrow viewport screenshot: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/upgrade-phase-1-combat-feedback/narrow-viewport-check.png`
- Supporting state log: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/upgrade-phase-1-combat-feedback/observations.json`
- Recording method: browser-harness `Page.captureScreenshot` frames saved at 10 FPS, encoded with ffmpeg to MP4/H.264.

## Summary

Upgrade Phase 1 passes. Card previews are visible and reflect Focus and Fractured math before play. Resolved HP, guard, draw, status, and log values match the previewed outcomes during tested actions. Unaffordable cards remain readable and show inline reasons such as required energy versus current energy. HP bars, floating feedback chips, played-card feedback, enemy intent/action feedback, reward choice, encounter 2 transition, final victory, defeat, and restart are understandable during normal play.

No blocking console/runtime errors were observed during a separate start, tactical-card, and End Turn smoke check.

## Findings

### P3 - Start overlay leaves the combat HUD visible behind it

- Status: Open, non-blocking
- Severity: Low
- Repro steps: Load the game URL before pressing Start Run.
- Expected behavior: The start panel should clearly gate the run until Start Run is pressed.
- Actual behavior: The start panel appears and works, but the dimmed combat HUD and controls remain visible behind the overlay.
- Evidence: `gameplay-recording.mp4`, initial seconds.
- Impact: Does not block the upgrade. Start Run is clear and functional.

## State/Action Clarity Assessment

Mandatory state/action clarity gate: `PASS`

Important state, available actions, disabled reasons, consequences, enemy intent, statuses, reward selection, encounter transition, final victory, defeat, and restart were understandable without source knowledge.

## Regression Checklist

- Hosted game loads: PASS
- README/manual matches observed behavior: PASS
- Desktop viewport readable: PASS
- Narrow viewport checked with no observed horizontal clipping: PASS
- Card previews visible before play: PASS
- Focus-adjusted previews match resolved damage: PASS
- Fractured-adjusted previews match resolved damage and clear after attack: PASS
- Unaffordable cards show visible disabled reasons: PASS
- HP bars and numeric HP update correctly: PASS
- Floating feedback chips appear for damage, guard, block, draw, and status feedback: PASS
- Played-card feedback/trail is visible: PASS
- Combat log matches resolved card and enemy math: PASS
- End Turn and enemy intent/action feedback work: PASS
- Reward choice appears after encounter 1: PASS
- Selected reward updates deck and persists into encounter 2: PASS
- Encounter 2 transition works: PASS
- Final Victory appears after encounter 2: PASS
- Defeat remains reachable after restart: PASS
- Restart/Play Again works: PASS
- Blocking runtime errors: PASS

## Approval Statement

`PASS`: The Combat Feedback And Math Preview upgrade meets the required behavior and has complete evidence.

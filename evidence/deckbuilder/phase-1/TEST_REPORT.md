# Turn-Based Deckbuilder Phase 1 Test Report

- Game and phase: Turn-Based Deckbuilder, Phase 1 Basic Card Combat
- Verdict: `PASS`
- Date: 2026-06-24
- Tester role: black-box deckbuilder tester

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/deckbuilder/index.html`
- README/manual: `http://127.0.0.1:8765/games/deckbuilder/README.md`
- Direct manual path used: `/Users/sarathmenon/Documents/game_hackathon/games/deckbuilder/README.md`
- Browser: Chrome controlled through `browser-harness`
- Viewport observed: 1200 x 953 CSS pixels

## Evidence

- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/phase-1/`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/phase-1/gameplay-recording.mp4`
- Expected flow: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/phase-1/expected-flow.md`
- Recording method: browser-harness pinned to the deckbuilder tab, `Page.captureScreenshot` frames saved at 10 FPS, encoded with ffmpeg to MP4/H.264.
- Supporting state log: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/phase-1/observations.json`

## Summary

Phase 1 passes. The hosted game loads, the manual matches observed mechanics, combat starts correctly, HP/energy/draw/hand/discard state is visible, attack and guard cards resolve, energy gating works, End Turn triggers the enemy attack, draw/discard refill is represented, restart works, and both victory and defeat states are reachable.

No blocking console/runtime errors were observed during a separate start/end-turn smoke check.

## Findings

### P3 - Start overlay leaves the combat HUD visible behind it

- Status: Open, non-blocking
- Severity: Low
- Repro steps: Load the game URL before pressing Start Combat.
- Expected behavior: A start screen appears and clearly gates combat until Start Combat is pressed.
- Actual behavior: The start panel appears and works, but the dimmed combat HUD and buttons are visible behind the overlay.
- Evidence: `gameplay-recording.mp4`, initial seconds.
- Evidence clip: `gameplay-recording.mp4 @ 00:00-00:02`
- Evidence status: Main recording segment
- Why this evidence proves the finding: The opening recording segment shows the Ash Circuit start modal with the dimmed combat HUD and controls visible behind it.
- Impact: Does not block the phase. Start Combat works and the manual's start flow remains usable.

## Regression Checklist

- Hosted game loads: PASS
- README/manual matches visible behavior: PASS
- Start flow works: PASS
- Player and enemy HP visible: PASS
- Draw pile, hand, and discard represented: PASS
- Energy spending works: PASS
- Cards over remaining energy become disabled: PASS
- Strike and Heavy Spark damage enemy HP: PASS
- Guard/Brace-style block behavior verified with Guard: PASS
- End Turn triggers enemy attack: PASS
- Enemy attack and guard math verified: PASS
- Draw/discard refill shown: PASS
- Victory reachable: PASS
- Defeat reachable: PASS
- Restart/Play Again works: PASS
- Blocking runtime errors: PASS

## Approval Statement

`PASS`: The phase meets the Basic Card Combat requirements and has complete required evidence.

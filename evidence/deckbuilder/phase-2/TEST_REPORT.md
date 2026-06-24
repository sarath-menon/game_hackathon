# Turn-Based Deckbuilder Phase 2 Test Report

- Game and phase: Turn-Based Deckbuilder, Phase 2 Tactical Variety
- Verdict: `PASS`
- Date: 2026-06-24
- Tester role: black-box deckbuilder tester

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/deckbuilder/index.html`
- README/manual: `http://127.0.0.1:8765/games/deckbuilder/README.md`
- Direct manual path used: `/Users/sarathmenon/Documents/game_hackathon/games/deckbuilder/README.md`
- Browser: Chrome controlled through `browser-harness`
- Viewport observed: 1728 x 996 CSS pixels

## Evidence

- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/phase-2/`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/phase-2/gameplay-recording.mp4`
- Expected flow: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/phase-2/expected-flow.md`
- Recording method: browser-harness `Page.captureScreenshot` frames saved at 10 FPS, encoded with ffmpeg to MP4/H.264.
- Supporting state log: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/phase-2/observations.json`

## Summary

Phase 2 passes. The hosted game loads, the README/manual matches observed behavior, Phase 1 combat remains functional, enemy intent is visible and accurate, the three-intent cycle is deterministic, added tactical cards work, Focus and Fractured are visible and resolve according to the manual, and deterministic victory and defeat are reachable.

No blocking console/runtime errors were observed during a separate start, tactical-card, and End Turn smoke check.

## Findings

### P3 - Start overlay leaves the combat HUD visible behind it

- Status: Open, non-blocking
- Severity: Low
- Repro steps: Load the game URL before pressing Start Combat.
- Expected behavior: A start screen appears and clearly gates combat until Start Combat is pressed.
- Actual behavior: The start panel appears and works, but the dimmed combat HUD and controls are visible behind the overlay.
- Evidence: `gameplay-recording.mp4`, initial seconds.
- Impact: Does not block the phase. Start Combat works and the manual's start flow remains usable.

## Regression Checklist

- Hosted game loads: PASS
- README/manual matches visible behavior: PASS
- Phase 1 HP, energy, draw, hand, discard, attack, guard, End Turn, victory, and defeat flow still works: PASS
- Enemy intent panel is visible before End Turn: PASS
- Lance intent attacks for 6: PASS
- Static Hex attacks for 4 and applies Fractured: PASS
- Crushing Arc attacks for 9: PASS
- Intent cycle advances deterministically: PASS
- Quick Study draws 2 cards for 0 energy: PASS
- Drive Plate deals damage and grants guard: PASS
- Charge Coil grants visible Focus: PASS
- Focus adds damage to attack/mixed attack cards: PASS
- Fractured reduces the next attack/mixed attack by 2 and clears: PASS
- Cards over remaining energy become disabled: PASS
- Draw/discard refill is represented: PASS
- Victory reachable: PASS
- Defeat reachable: PASS
- Restart/Play Again works: PASS
- Blocking runtime errors: PASS

## Approval Statement

`PASS`: The phase meets the Tactical Variety requirements and has complete required evidence.

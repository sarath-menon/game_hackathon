# Turn-Based Deckbuilder Phase 3 Test Report

- Game and phase: Turn-Based Deckbuilder, Phase 3 Run Structure
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

- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/phase-3/`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/phase-3/gameplay-recording.mp4`
- Expected flow: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/phase-3/expected-flow.md`
- Recording method: browser-harness `Page.captureScreenshot` frames saved at 10 FPS, encoded with ffmpeg to MP4/H.264.
- Supporting state log: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/phase-3/observations.json`

## Summary

Phase 3 passes. The hosted game loads, the README/manual matches observed behavior, Phase 1 and Phase 2 combat behavior remains intact, reward choice appears after encounter 1, selecting Flare Shot updates the deck, the updated deck persists into encounter 2, Mirror Sentinel starts correctly, Flare Shot appears and is playable in encounter 2, final victory appears after winning encounter 2, and defeat remains reachable after restart.

No blocking console/runtime errors were observed during a separate start, tactical-card, and End Turn smoke check.

## Findings

### P3 - Start overlay leaves the combat HUD visible behind it

- Status: Open, non-blocking
- Severity: Low
- Repro steps: Load the game URL before pressing Start Run.
- Expected behavior: A start screen appears and clearly gates the run until Start Run is pressed.
- Actual behavior: The start panel appears and works, but the dimmed combat HUD and controls are visible behind the overlay.
- Evidence: `gameplay-recording.mp4`, initial seconds.
- Impact: Does not block the phase. Start Run works and the manual's start flow remains usable.

## Regression Checklist

- Hosted game loads: PASS
- README/manual matches visible behavior: PASS
- Phase 1 HP, energy, draw, hand, discard, attack, guard, End Turn, victory, and defeat flow still works: PASS
- Phase 2 enemy intent, tactical cards, Focus, and Fractured behavior still works: PASS
- Encounter 1 starts with Glass Warden and deck size 12: PASS
- Reward choice appears after encounter 1: PASS
- Flare Shot, Shield Loom, and Surge Plan are shown as reward options: PASS
- Selected reward updates the deck: PASS
- Encounter 2 starts after reward selection: PASS
- Encounter 2 status shows deck size 13 and reward: Flare Shot: PASS
- Selected reward persists into encounter 2 and can be played: PASS
- Mirror Sentinel HP and intents are visible: PASS
- Needle Burst, Splinter Mark, and Overload Sweep are represented: PASS
- Final Victory appears after encounter 2: PASS
- Restart/Play Again works: PASS
- Defeat path remains reachable: PASS
- Blocking runtime errors: PASS

## Approval Statement

`PASS`: The phase meets the Run Structure requirements and has complete required evidence.

# Test Report: Ash Circuit - Upgrade Phase 3 Deck, Draw, And Discard Inspection

## Verdict

PASS

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/deckbuilder/index.html`
- Manual reference: `http://127.0.0.1:8765/games/deckbuilder/README.md` and `/Users/sarathmenon/Documents/game_hackathon/games/deckbuilder/README.md`
- Browser/harness: browser-harness in the single shared Chrome window
- Viewport covered: `782 x 859`
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/upgrade-phase-3-deck-inspection/`
- Recording method: sequential browser-harness screenshots encoded into `gameplay-recording.mp4`; malformed capture `34-after-heavy-spark-finisher.png` was excluded from verdict evidence and the final recording

## Summary

The hosted Deckbuilder build loaded and the Phase 3 deck inspection feature is discoverable from normal combat. The inspection panel showed Current Deck, Hand, Draw Pile, Discard Pile, Exhaust / Removed, and Recent Reward Additions with readable card names, type/cost/effect text, section counts, and explicit empty states.

Counts matched the HUD before and after card play. Playing Strike updated energy, hand, discard, enemy HP, combat log, and the inspector correctly showed Strike in the discard pile. Reward-state inspection worked before choosing a reward, and after selecting Flare Shot the updated 13-card deck persisted into encounter 2 with Flare Shot visible in Current Deck, Draw Pile, and Recent Reward Additions. Escape and Close Inspection returned focus without mutating combat state. New Run restarted cleanly.

Settings regression checks passed: corrected Reset Defaults restored audio off/volume 0 and cleared confirm toggles, and corrected Close Settings dismissed the overlay. Intent/status explainability remained readable, including active intent, next intent preview, Last Enemy Resolution, and Fractured-adjusted previews.

## Findings

### No Blocking Or Major Findings

- Severity: None
- Status: Closed
- Evidence: `15-after-correct-reset-defaults.png`, `16-after-correct-close-settings.png`, `18-inspection-open-top.png`, `22-inspection-after-strike.png`, `35-reward-inspect-current-deck.png`, `39-encounter2-inspection-after-reward.png`, `41-after-new-run-restart.png`
- Expected: Deck inspection, settings close/reset, reward update, and restart all work through visible controls.
- Actual: Behavior matched the manual and assigned QA scope.

### Narrow Viewport Coverage Was Limited To Shared-Window Width

- Severity: Low
- Status: Accepted coverage limitation
- Evidence: All clean screenshots from the shared `782 x 859` viewport
- Expected: Include responsive/narrow coverage if practical without destabilizing the run.
- Actual: The pass used a relatively narrow shared Chrome viewport and the UI remained readable. Separate mobile emulation was not attempted because the shared-window harness was already sufficient for the assigned pass and avoiding target instability was prioritized.

## Settings / Audio Regression

| Check | Result | Evidence |
| --- | --- | --- |
| Settings opens from title | PASS | `03-title-settings-open.png` |
| Reset Defaults restores generated audio off and volume 0 | PASS | `15-after-correct-reset-defaults.png` |
| Reset Defaults clears Confirm no-guard turns | PASS | `15-after-correct-reset-defaults.png` |
| Visible Close Settings dismisses overlay | PASS | `16-after-correct-close-settings.png` |
| Escape/close behavior does not block later gameplay | PASS | `17-combat-turn1-start.png` through `41-after-new-run-restart.png` |

Note: Early exploratory settings screenshots were superseded by corrected visible-control evidence. The final verdict uses the corrected Reset Defaults and Close Settings captures.

## Deck Inspection Coverage

| Requirement | Result | Evidence |
| --- | --- | --- |
| Hosted game loads | PASS | `01-title-load.png`, `02-recovered-title-load.png` |
| Manual-consistent combat HUD visible | PASS | `17-combat-turn1-start.png` |
| Inspection control discoverable in combat | PASS | `17-combat-turn1-start.png`, `18-inspection-open-top.png` |
| Current Deck section visible/readable | PASS | `18-inspection-open-top.png`, `35-reward-inspect-current-deck.png`, `39-encounter2-inspection-after-reward.png` |
| Hand section visible/readable | PASS | `18-inspection-open-top.png`, `22-inspection-after-strike.png`, `35-reward-inspect-current-deck.png` |
| Draw Pile section visible/readable | PASS | `18-inspection-open-top.png`, `35-reward-inspect-current-deck.png`, `39-encounter2-inspection-after-reward.png` |
| Discard Pile section visible/readable | PASS | `18-inspection-open-top.png`, `22-inspection-after-strike.png`, `35-reward-inspect-current-deck.png` |
| Exhaust / Removed section or explicit none | PASS | `18-inspection-open-top.png`, `35-reward-inspect-current-deck.png`, `39-encounter2-inspection-after-reward.png` |
| Recent Reward Additions section or explicit none | PASS | `18-inspection-open-top.png`, `35-reward-inspect-current-deck.png`, `39-encounter2-inspection-after-reward.png` |
| Card entries include name, type/cost, and effect text | PASS | `18-inspection-open-top.png`, `22-inspection-after-strike.png`, `39-encounter2-inspection-after-reward.png` |
| Counts match HUD before card play | PASS | `17-combat-turn1-start.png`, `18-inspection-open-top.png` |
| Counts update after card play | PASS | `21-after-playing-strike.png`, `22-inspection-after-strike.png` |
| Played card appears in discard | PASS | `22-inspection-after-strike.png` |
| Escape closes inspector without mutation | PASS | `20-after-escape-close-inspection.png`, `36-after-escape-close-reward-inspection.png`, `40-after-escape-close-encounter2-inspection.png` |
| Close Inspection returns focus/control | PASS | `23-inspection-bottom-close-visible-attempt.png`, `24-after-close-inspection-button.png` |
| Reward-state inspection works | PASS | `35-reward-inspect-current-deck.png`, `36-after-escape-close-reward-inspection.png` |
| Selected reward updates deck and persists into encounter 2 | PASS | `37-after-select-flare-shot-encounter2.png`, `39-encounter2-inspection-after-reward.png` |

## Regression Checklist

| Regression Area | Result | Evidence |
| --- | --- | --- |
| Active enemy intent readable before End Turn | PASS | `17-combat-turn1-start.png`, `27-after-end-turn-enemy.png` |
| Next-intent preview visible | PASS | `17-combat-turn1-start.png`, `27-after-end-turn-enemy.png` |
| Last Enemy Resolution shows action, guard absorption, and HP loss | PASS | `27-after-end-turn-enemy.png` |
| Focus / Fractured help text remains visible in status area | PASS | `17-combat-turn1-start.png`, `31-after-static-hex-turn.png` |
| Fractured modifies next attack/mixed card preview | PASS | `31-after-static-hex-turn.png`, `32-turn3-hand-fractured-previews.png` |
| Fractured-adjusted attack previews are readable | PASS | `31-after-static-hex-turn.png`, `32-turn3-hand-fractured-previews.png` |
| Reward choice appears after encounter 1 victory | PASS | `35-reward-inspect-current-deck.png`, `36-after-escape-close-reward-inspection.png` |
| Encounter 2 transition works | PASS | `37-after-select-flare-shot-encounter2.png` |
| Restart/New Run works | PASS | `41-after-new-run-restart.png` |
| No blocking runtime/provider/harness errors during clean Deckbuilder pass | PASS | Full clean evidence sequence |

## State / Action Clarity Gate

PASS. A normal player can understand which cards are in Current Deck, Hand, Draw Pile, Discard Pile, Exhaust / Removed, and Recent Reward Additions. Available actions remain visible, disabled/preview text is readable, enemy intent and last resolution are understandable, and closing inspection/settings returns to normal play without hidden state changes.

## Provider / Environment Classification

No provider or environment blocker. The assigned local URL loaded, the clean active target was verified as the Deckbuilder game, and the browser-harness completed the assigned QA path. One early target-drift screenshot was discarded and is not used as verdict evidence.

## QA Methodology Carry-Forward

- For deckbuilders, inspect zones before and after a single known card play, then cross-check HUD pile counts, visible hand count, log text, and inspector sections.
- Reward verification should inspect both before and after selection so “no reward yet” and “reward added” states are proven separately.
- Close/Escape controls for overlays should be tested as mutation checks: counts, hand, energy, and turn state should remain unchanged after dismissing inspection.

## Approval Statement

Approved as PASS for Upgrade Phase 3 Deck, Draw, And Discard Inspection. Required Markdown artifacts are written, and the MP4 recording is generated from the captured evidence.

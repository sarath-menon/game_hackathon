# Dungeons & Degenerate Gamblers Demo - Direct Official Build Follow-up 2

## Verdict
PASS_WITH_FINDINGS

## Test Inputs
- Game URL: https://html-classic.itch.zone/html/15020933/index.html
- Player manual: /Users/sarathmenon/Documents/game_hackathon/external-qa/dungeons-degenerate-gamblers/README.md
- Browser surface: browser-harness in the single shared Chrome window
- Viewport observed: approximately 782 x 859 CSS pixels
- Evidence folder: /Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-legality-restart-pass-1
- Recording: /Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-legality-restart-pass-1/gameplay-recording.mp4, encoded from captured screenshots at 2 fps

## Summary
The direct official browser build loaded and reached a playable table through visible controls. Continue entered the first table, HIT updated the visible card/score state across multiple actions, and STAND resolved the exchange with visible HP and chip changes. The pause menu opened cleanly, with Resume, Restart Run, Collection, Settings, Save and Quit, and Buy Full Game visible.

The focused follow-up did not find a clearly disabled or illegal table action. Post-resolution HIT/STAND attempts remained meaningful and advanced table state rather than producing an unavailable-action message. Restart Run was safely clicked once from the pause menu; it highlighted the option and did not immediately destroy the run, but no confirmation/cancel copy appeared before stopping to avoid destructive loss.

## Severity-Rated Findings

### LOW - Illegal/unavailable action feedback remains unproven
- Status: Open coverage limitation
- Repro steps: Load the direct build, Continue to the table, use HIT several times, STAND to resolve, then try HIT/STAND again after resolution.
- Expected behavior: If an action is unavailable or out of phase, the UI should disable it or explain why it cannot be used.
- Actual behavior: HIT/STAND remained active and appeared to advance into continued table play. No clearly invalid action state or explanatory rejection copy was produced.
- Evidence: `03-after-continue-click.png`, `04-after-hit-1.png` through `10-post-resolution-stand-attempt.png`.

### LOW - Restart Run confirmation/cancel copy not exposed by one safe boundary click
- Status: Open coverage limitation
- Repro steps: Open the pause menu with Escape, click Restart Run once.
- Expected behavior: A destructive restart/give-up control should expose clear confirmation and cancel copy before progress loss.
- Actual behavior: Restart Run became highlighted/selected, but no visible confirmation/cancel copy appeared after the safe first click. Testing stopped before additional clicks to avoid destructive loss.
- Evidence: `11-pause-menu-open.png`, `12-after-restart-run-click.png`.

## Coverage Table
| Area | Result | Evidence |
| --- | --- | --- |
| Direct official build load | PASS | `01-direct-build-menu.png`, `02-main-menu.png` |
| Reach playable state | PASS | `03-after-continue-click.png` |
| HIT action state changes | PASS | `04-after-hit-1.png` through `07-after-hit-4.png` |
| STAND resolution | PASS | `08-after-stand-resolution.png`, `09-post-resolution-hit-attempt.png`, `10-post-resolution-stand-attempt.png` |
| Visible HP/card/score/chip readability | PASS | `03-after-continue-click.png` through `10-post-resolution-stand-attempt.png` |
| Illegal/unavailable action clarity | LIMITED | Attempts did not produce a clearly invalid state |
| Pause/menu controls | PASS | `11-pause-menu-open.png` |
| Restart Run boundary | LIMITED | `12-after-restart-run-click.png` |
| Settings/menu reachability smoke | PASS | Settings entry visible in pause menu, `11-pause-menu-open.png` |
| Provider/environment | PASS | No provider or local harness blocker observed |
| Short-run performance/load | PASS | No crash, softlock, or blocking stall during captured path |

## Usability And Accessibility Assessment
Card values, table score, HP, chips, and HIT/STAND controls were readable from normal play. The table communicated legal actions and consequences through visible state deltas: player HP changed from 100 to 97 after resolution, chips changed, and card/score values updated. Pause menu labels were readable and discoverable. The main remaining clarity gap is unavailable-action feedback: this pass could not force a rejected action state, so explanatory disabled/rejection behavior remains unverified.

## Performance And Load Assessment
The direct official build reached the menu, table, and pause menu without a blocking provider error, crash, softlock, or severe frame stall during the tested path. The initial branded splash transitioned to the game menu after waiting.

## Provider/Environment Classification
No provider or environment blocker applies. The official direct build URL was playable in the shared browser-harness Chrome window, and the focused QA scope was executable far enough to issue a gameplay verdict.

## QA Methodology Carry-Forward
- For card/deckbuilder QA, record multiple before/after numeric deltas for cards, score, HP, and chips before judging whether an action is legal or rejected.
- For illegal-action testing, first map the normal turn flow; otherwise a post-resolution click may be a valid next-round action rather than an invalid action.
- For destructive controls, capture one safe boundary click and stop if confirmation/cancel copy is not clearly presented.

## Final Statement
Approved as `PASS_WITH_FINDINGS`. The direct build is playable and the focused turn-flow/restart-boundary checks are acceptable with documented nonblocking coverage limitations around unavailable-action feedback and restart confirmation copy.

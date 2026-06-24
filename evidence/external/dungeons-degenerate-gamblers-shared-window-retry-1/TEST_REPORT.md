# Dungeons & Degenerate Gamblers Demo - Shared-Window Canonical Retry 1

## Verdict

`PASS_WITH_FINDINGS`

## Test Inputs

- Game URL attempted: `https://purplemosscollectors.itch.io/dndg`
- Player manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/dungeons-degenerate-gamblers/README.md`
- Browser: shared Chrome window through browser-harness only
- Viewport: approximately 1519 x 981 browser viewport
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-shared-window-retry-1`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-shared-window-retry-1/gameplay-recording.mp4`
- Recording method: valid shared-window browser-harness screenshots encoded to MP4 at 10 FPS

## Provider / Environment Classification

This attempt is not `BLOCKED_PROVIDER`: the itch.io page loaded, the embedded player launched, the in-game menu was interactive, and the run reached deck selection, a tavern/node prompt, and the first table state.

This attempt is not `BLOCKED_ENVIRONMENT`: the single shared Chrome window and browser-harness could focus and drive the game through visible controls. A brief harness attachment drift captured the dashboard once, but the Dungeons tab was safely reattached and testing continued without opening a separate browser surface.

This attempt is not `FAIL`: the demo was playable enough to evaluate core flow and did not show a blocking game-quality failure in the tested path. The remaining issues are nonblocking usability or coverage findings.

## Summary

The hosted Dungeons & Degenerate Gamblers demo is playable through the canonical shared-window browser-harness path. The pass verified itch embed launch, main menu interaction, deck selection, first tavern/node entry, first table/combat state, card-state readability, and immediate feedback from `HIT` and `STAND` style actions.

Core card state was readable: player HP, enemy identity/HP, chip/currency values, score cards, draw piles, table cards, visible card ranks/suits, and `HIT` / `STAND` controls were all visible from normal play. The first action changed visible cards and score totals immediately, and later resolution reduced player HP from 100 to 90.

## Severity-Rated Findings

### Low - New Run Hit Target Is Not Self-Evident

- Status: Open, nonblocking
- Repro steps: Launch the demo, then click the underlined `NEW RUN` text at the main menu.
- Expected behavior: The visible `NEW RUN` label or its underlined region starts a new run clearly.
- Actual behavior: Multiple clicks on the label/lower region did not visibly advance. Clicking the larger Tavern logo/upper region did advance to deck selection.
- Evidence: `04-after-new-run-click.png`, `05-after-new-run-retry.png`, `16-after-upper-newrun-region-click.png`

### Low - Settings / Options Coverage Is Partial

- Status: Open, nonblocking coverage limitation
- Repro steps: Inspect main menu controls and visible in-game controls.
- Expected behavior: Audio, volume, settings, fullscreen, restart, and give-up controls should be discoverable and testable if present.
- Actual behavior: A collection/statistics-style book, social/external controls, and itch fullscreen were visible. Audio/volume, deeper settings, restart, and give-up behavior were not fully exercised in this pass.
- Evidence: `03-after-run-game.png`, `10-after-top-settings-icon-click.png`, `14-after-book-back.png`

### Low - Legal/Illegal Action Clarity Only Smoke-Tested

- Status: Open, nonblocking coverage limitation
- Repro steps: Reach first table and interact with `HIT` / `STAND`.
- Expected behavior: Legal and illegal actions are understandable from visible state, and unavailable actions should be disabled or explained.
- Actual behavior: Legal `HIT` / `STAND` controls were large and readable, and action feedback was visible. No clearly illegal or disabled action state was reached, so unavailable-action messaging remains unverified.
- Evidence: `23-after-bottom-action-click.png`, `25-after-hit-click.png`, `26-after-stand-click.png`, `27-after-post-stand-hit-attempt.png`

### Informational - One Invalid Capture Excluded From Verdict Evidence

- Status: Closed
- Repro steps: During the first launch continuation, browser-harness attachment drifted to an existing dashboard tab.
- Expected behavior: Evidence should represent the assigned Dungeons tab only.
- Actual behavior: `02-after-run-game.png` captured the dashboard and is invalid. It was excluded from the MP4 and not used for verdict support.
- Evidence: `02-after-run-game.png` marked invalid by this report.

## Controls / Progression Coverage

- Itch page load: PASS
- Embedded demo launch: PASS
- Main menu visible: PASS
- New run flow: PASS_WITH_FINDING, correct target was the larger Tavern logo/upper region rather than the smaller `NEW RUN` label
- Deck selection: PASS
- Locked/unlocked deck clarity: PASS, padlocks and `1/19 unlocked` text were visible
- Deck confirmation: PASS
- Map/node/tavern entry: PASS, visible `ENTER` node and tutorial text
- First table/combat state: PASS
- Player/enemy state readability: PASS
- Card values/suits readability: PASS
- `HIT` action feedback: PASS
- `STAND`/resolution feedback: PASS
- Legal/illegal action clarity: PARTIAL
- Settings/options/audio/fullscreen/restart/give-up: PARTIAL
- Performance/load behavior: PASS for tested path; no crash, severe stall, or input lag observed

## Card-State Readability Assessment

PASS for the tested first encounter. The table clearly presented score totals out of 21, player and bartender panels, HP, chip/currency values, draw piles, visible cards, enemy stand threshold, and large central `HIT` / `STAND` controls. Card draws and score changes after `HIT` were immediately visible. `STAND`/resolution feedback was visible through changed cards and a player HP decrease.

## Usability / Accessibility Assessment

PASS_WITH_FINDINGS. Text and pixel-art UI were readable at the desktop viewport. The main nonblocking issue is that the start-run target is visually ambiguous: the label reads as a button, but the larger Tavern logo/upper area was the reliable route into deck selection. Itch provider controls remained visible around the game but did not block the tested flow.

## Performance Assessment

The demo loaded and responded through menu, deck selection, node entry, and first table interactions. No crash, provider error, major frame stall, or obvious input lag was observed during the tested path.

## QA Methodology Carry-Forward

- For external card/deckbuilder QA, capture a dedicated readability frame before the first action, then one frame after each legal action to prove card totals, HP, and action consequences.
- Treat visible labels and larger graphic hit regions separately; if a label does not respond, test the surrounding visible affordance before calling input blocked.
- When browser-harness attachment drifts in a crowded shared Chrome window, explicitly reattach to the assigned URL tab and mark any contaminated screenshot invalid rather than using it for verdict support.
- For future card-game passes, deliberately seek an unavailable or illegal action state after core flow is proven, because legal-action success does not prove disabled-action clarity.
- Settings coverage should include a focused pass on audio/volume, fullscreen, restart, and give-up after first-combat reachability is established.

## Approval / Retry Statement

Approved as `PASS_WITH_FINDINGS` for this shared-window retry. No provider or environment retry is required for basic playability. Recommended follow-up, if desired, is a deeper settings/illegal-action pass rather than a provider reroute.

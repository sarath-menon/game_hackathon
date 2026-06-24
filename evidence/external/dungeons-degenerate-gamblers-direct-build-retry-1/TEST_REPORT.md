# Dungeons & Degenerate Gamblers Demo - Direct Official Build Retry 1

## Verdict: PASS_WITH_FINDINGS

The direct official browser build reached a playable run and allowed black-box verification of the menu, deck selection, tavern entry, first table state, legal HIT/STAND interaction, settings, and pause/menu controls. The prior wrapper-clipping blocker is resolved by this direct URL.

The pass has nonblocking findings: unavailable/illegal action feedback was not clearly demonstrated because HIT remained available after attempted STAND/out-of-state checks, and restart confirmation depth was only partially covered.

## Test Inputs

- Attempted URL: `https://html-classic.itch.zone/html/15020933/index.html`
- Player manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/dungeons-degenerate-gamblers/README.md`
- Browser: shared Chrome via browser-harness only
- Observed viewport: `782 x 859`
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-direct-build-retry-1`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-direct-build-retry-1/gameplay-recording.mp4`
- Recording method: MP4 encoded from 30 saved browser-harness screenshots at 2 FPS

## Summary

The direct official build loaded without the itch wrapper and displayed the full game menu. The `New Run` path was reachable after using the visible Tavern/New Run target area. Deck selection was readable: locked decks showed lock icons and explanatory tooltips, while the unlocked Hearts deck could be selected and confirmed. The run then reached a tavern/node entry screen with readable prompt text and an `ENTER` control.

The first table/combat state was playable. Player HP, opponent HP, chip counts, deck/discard areas, score cards, HIT/STAND controls, and tutorial/dialog text were visible. HIT resolved by drawing a player card, and STAND/HIT follow-up states changed visible table values and card layout. Settings were reachable from the pause/menu, with music/sound volume, fullscreen, display scaling, language, animation speed, visual effects, hover ticks, prompts, reset, and back controls visible. Pause/menu controls exposed Resume, Restart Run, Collection, Settings, Save and Quit, and Buy Full Game.

## Severity-Rated Findings

### LOW - Illegal or unavailable action feedback was not clearly proven

- Status: Open / nonblocking
- Evidence: `16-after-hit-click.png`, `17-after-stand-click.png`, `18-after-second-stand-click.png`, `19-after-post-stand-hit-attempt.png`
- Repro steps:
  1. Reach the first table.
  2. Use HIT, then STAND.
  3. Attempt further STAND/HIT interaction to look for out-of-state or unavailable action messaging.
- Expected behavior: If an action is no longer legal or is not meaningful in the current turn state, the UI should clearly indicate why.
- Actual behavior: HIT remained visibly available and continued changing table state. The pass did not find a clear disabled-state explanation or illegal-action message.
- Impact: Nonblocking for basic playability, but future card/deckbuilder QA should spend more time mapping turn phases and intentionally invalid actions.

### LOW - Restart/give-up confirmation depth was only partially verified

- Status: Open / coverage limitation
- Evidence: `20-after-escape-menu-attempt.png`, `22-settings-open.png`, `28-escape-menu-for-restart.png`
- Repro steps:
  1. Open the pause/menu during table play.
  2. Observe Restart Run and Save and Quit controls.
  3. Attempt to inspect restart confirmation without accepting a destructive action.
- Expected behavior: Restart/give-up/reset paths should provide clear warning or confirmation before destructive progress loss.
- Actual behavior: The menu clearly exposed Restart Run and Save and Quit, but this pass did not capture a definitive confirmation dialog before backing out safely.
- Impact: Nonblocking because the destructive controls are clearly separated from normal table controls, but confirmation copy remains unverified.

## Coverage Table

| Scope item | Result | Evidence / notes |
|---|---:|---|
| Direct official build URL loads | Pass | `01-direct-build-load.png`, `02-menu-after-startup.png` |
| Full menu reachable without wrapper clipping | Pass | `02-menu-after-startup.png` |
| Start normal run | Pass | `06-after-tavern-logo-click.png`, `07-after-tooltip-area-click.png` |
| Deck selection | Pass | `08-after-choose-for-me.png`, `10-after-unlocked-deck-click.png`, `11-after-deck-confirm-click.png` |
| Deck confirmation | Pass | `12-after-deck-confirm.png`, `14-after-confirm-enter.png` |
| Tavern/node entry | Pass | `14-after-confirm-enter.png`, `15-after-enter-tavern.png` |
| First table/combat state | Pass | `15-after-enter-tavern.png` |
| Card/deckbuilder state clarity | Pass with findings | HP, opponent HP, cards, score cards, HIT/STAND, chips, tutorial text visible |
| Legal HIT/STAND action feedback | Pass with findings | `16-after-hit-click.png`, `17-after-stand-click.png` |
| Illegal/unavailable action clarity | Limited | No clear disabled/illegal feedback captured |
| Settings/options | Pass | `20-after-escape-menu-attempt.png`, `22-settings-open.png` |
| Restart/give-up/reset boundary | Limited | Restart Run and Save and Quit visible; confirmation not captured |
| Provider/environment | Pass | Direct build avoids wrapper clipping; no auth wall or provider refusal |
| Short-run performance/load | Pass | Startup, menu, deck, table, settings were responsive enough for QA |

## Usability / Accessibility Assessment

The direct build is much more readable than the wrapper path at the tested viewport. Menu controls, deck cards, locked indicators, selected deck confirmation, tavern prompt, table state, HP values, opponent identity, score cards, and HIT/STAND buttons are visually understandable. The pixel-art typeface is stylized but readable at the tested size. Settings labels are dense but legible.

Potential accessibility/usability limitations remain: several controls rely on icon-only presentation until hovered or selected, and destructive menu controls should have explicit confirmation evidence in a future pass.

## Performance / Load Assessment

The direct build loaded to the menu, accepted progression into a run, and responded to table/menu/settings actions without a crash, auth wall, severe stall, or blocking runtime/provider error during the short run.

## Provider / Environment Classification

- Provider classification: Provider path is playable. The direct official itch-hosted build URL reached gameplay.
- Environment classification: No overall environment blocker. The shared-window harness could exercise the direct build successfully.
- Wrapper retry rationale: The prior itch wrapper path was environment-blocked by viewport clipping; the direct official build removed that wrapper limitation.

## QA Methodology Carry-Forward

- For external embedded games, ask the orchestrator for the official direct iframe/build URL when wrapper viewport clipping blocks play.
- Account for device-pixel screenshot scaling when translating screenshot coordinates into browser-harness click coordinates.
- For card/deckbuilder QA, capture: entry path, deck selection, first table before action, after legal action, after attempted invalid action, settings/menu, and destructive-control boundary.
- Do not overclassify unclear illegal-action feedback as `FAIL` until the turn rules are mapped from visible state and a clearly invalid action is tested.

## Final Approval / Retry Statement

Approve this direct-build retry as `PASS_WITH_FINDINGS`. No provider retry is needed for basic playability. A future deeper pass should focus specifically on turn-phase legality, disabled-action explanations, and restart/give-up confirmation copy.

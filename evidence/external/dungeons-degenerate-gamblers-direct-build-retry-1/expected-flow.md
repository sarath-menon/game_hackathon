# Expected / Observed Flow - Dungeons Direct Official Build Retry 1

## Verdict

`PASS_WITH_FINDINGS`

## Expected Flow From Manual

1. Open the direct official browser build URL.
2. Use visible game menu controls to start or resume a run.
3. Select a playable deck through visible controls.
4. Enter the tavern/node and reach a first table/combat state.
5. Verify readable player/enemy state, cards, values, legal actions, consequences, prompts, and turn/progress feedback.
6. Try at least one unavailable, illegal, disabled, or out-of-state action after core playability is established.
7. Explore visible settings/options/help/pause/restart/give-up/volume/fullscreen controls without unsafe destructive actions.
8. Record usability, accessibility, performance, provider/environment classification, and evidence.

## Observed Flow

1. `01-direct-build-load.png`: Direct build loaded with Purple Moss Collectors startup screen.
2. `02-menu-after-startup.png`: Full game menu appeared without wrapper clipping; `New Run` visible.
3. `03-after-new-run-click.png` through `07-after-tooltip-area-click.png`: Visible Tavern/New Run target was activated and run setup began.
4. `08-after-choose-for-me.png` and `09-after-choose-for-me-css-click.png`: Deck selection was visible; `choose for me` did not progress.
5. `10-after-unlocked-deck-click.png` and `11-after-deck-confirm-click.png`: Unlocked Hearts deck was selected directly; full deck preview and `confirm` appeared.
6. `12-after-deck-confirm.png`, `13-after-confirm-center-click.png`, `14-after-confirm-enter.png`: Deck confirmed and the tavern/node entry screen appeared.
7. `15-after-enter-tavern.png`: First table/combat state loaded with player HP, opponent HP, score cards, HIT/STAND controls, and tutorial/dialog text.
8. `16-after-hit-click.png`: HIT resolved and changed visible card/table state.
9. `17-after-stand-click.png`, `18-after-second-stand-click.png`, `19-after-post-stand-hit-attempt.png`: Follow-up STAND/HIT attempts changed state, but no clear illegal-action explanation was captured.
10. `20-after-escape-menu-attempt.png`: Pause/menu opened with Resume, Restart Run, Collection, Settings, Save and Quit, and Buy Full Game.
11. `21-after-left-icon-click.png`: Blue Chip tooltip showed readable status/effect text.
12. `22-settings-open.png`: Settings screen displayed music volume, sound volume, fullscreen, display scaling, language, animation speed, glitch intensity, smoking, card hover ticks, final boss music, unlock all, button prompts, reset, and back controls.
13. `23-after-settings-escape.png` and `24-after-restart-run-click.png`: Settings closed cleanly back to gameplay.
14. `25-menu-reopened-for-restart.png` through `30-after-restart-confirm-escape.png`: Additional menu/restart boundary attempts were captured, but definitive restart confirmation copy was not verified.

## Coverage Outcome

The direct official build reached playable state and met the core QA scope with nonblocking coverage findings. Illegal/unavailable action messaging and restart/give-up confirmation copy need a future deeper pass.

## Artifacts

- Report: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-direct-build-retry-1/TEST_REPORT.md`
- Expected/observed flow: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-direct-build-retry-1/expected-flow.md`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-direct-build-retry-1/gameplay-recording.mp4`

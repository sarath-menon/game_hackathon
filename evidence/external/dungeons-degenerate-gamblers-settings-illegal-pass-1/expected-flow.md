# Expected / Observed Flow - Dungeons Follow-up Pass 2

## Verdict

`BLOCKED_ENVIRONMENT`

## Expected Flow From Manual

1. Open the hosted itch.io game page.
2. Use the visible embedded-player start control.
3. Reach the game menu.
4. Start or resume a normal playable run through visible controls.
5. Enter card/table state.
6. Verify readable player/enemy state, card names/values/effects, legal actions, consequences, prompts, and turn/progress feedback.
7. Seek one unavailable/illegal/out-of-state action after core playability is established.
8. Explore visible settings/options/help/pause/restart/give-up/volume/fullscreen controls without unsafe destructive actions.
9. Record usability, accessibility, performance, and blocker classification.

## Observed Flow

1. `01-provider-load.png`: Opened `https://purplemosscollectors.itch.io/dndg`; itch provider page loaded with visible `Run game`.
2. `02-after-run-game-click.png`: Clicked `Run game`; embedded game began startup/loading.
3. `03-after-startup-wait.png`: Game reached its own menu. `Continue` was visible near center, but `New Run` was clipped off the right edge.
4. `04-after-continue-click.png` and `05-after-continue-second-click.png`: Clicking visible `Continue` did not enter a run.
5. `06-after-browser-zoom-out-attempt.png`: Browser zoom-out key attempts did not reveal the clipped `New Run` path.
6. `07-after-tab-focus.png`, `08-after-right-key.png`, `09-after-keyboard-enter.png`: Keyboard focus/right/enter attempts did not activate a start path.
7. `10-after-horizontal-scroll-attempt.png`, `11-after-horizontal-wheel-correct.png`, `12-after-second-horizontal-wheel.png`: Horizontal scroll attempts did not shift the clipped embedded game/menu.
8. `13-after-vertical-scroll-for-controls.png`: Vertical scroll revealed provider page content below the embed, not a usable fullscreen/start control.
9. `14-return-after-control-search.png` and `15-return-to-menu-before-new-run-edge.png`: Returned to the embedded menu.
10. `16-after-clipped-new-run-edge-click.png`: Clicking the partially visible right-edge `New Run` area did not enter a run.

## Coverage Outcome

The provider and embedded menu were reachable, but playable run entry was blocked by the shared-window viewport/harness. Card-state readability, legal/illegal action clarity, settings/options, restart/give-up, and gameplay performance were not evaluated.

## Artifacts

- Report: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-settings-illegal-pass-1/TEST_REPORT.md`
- Expected/observed flow: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-settings-illegal-pass-1/expected-flow.md`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-settings-illegal-pass-1/gameplay-recording.mp4`

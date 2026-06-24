# Dungeons & Degenerate Gamblers Demo - Follow-up Pass 2

## Verdict: BLOCKED_ENVIRONMENT

The itch.io provider loaded and the embedded game reached its own main menu, but the shared-window browser-harness viewport could not access the visible `New Run` path. `Continue` appeared inactive, and the `New Run` control was clipped off the right edge of the embedded game surface. Same-window recovery attempts did not reach a playable run, so the requested settings, restart/give-up, and legal/illegal action clarity checks could not be evaluated reliably.

This is not a game-quality `FAIL`: the pass did not reach a playable state deep enough to evaluate the requested QA scope.

## Test Inputs

- Attempted URL: `https://purplemosscollectors.itch.io/dndg`
- Player manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/dungeons-degenerate-gamblers/README.md`
- Browser: shared Chrome via browser-harness only
- Observed viewport: `782 x 859`
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-settings-illegal-pass-1`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-settings-illegal-pass-1/gameplay-recording.mp4`
- Recording method: MP4 encoded from 16 saved browser-harness screenshots at 2 FPS

## Summary

The provider page was reachable, and the itch `Run game` button launched the embedded game. The game completed startup and displayed the Dungeons & Degenerate Gamblers menu. However, the menu was wider than the shared Chrome viewport. The centered `Continue` option appeared unavailable/inactive, while the `New Run` option was only partially visible at the far right edge. Multiple same-window, player-visible remediation routes were attempted: clicking Continue, browser zoom out, keyboard focus/right/enter, horizontal wheel scrolling over the game area, vertical page scrolling to search for provider/fullscreen controls, and clicking the clipped New Run edge. None reached a normal run.

Because playable card/combat state was not reached, card-state readability, legal/illegal action clarity, settings/options, restart/give-up, and short-run performance inside gameplay remain unverified in this pass.

## Severity-Rated Findings

### BLOCKER - Shared-window viewport/harness cannot reach `New Run` from embedded menu

- Status: Open for this attempt
- Evidence: `03-after-startup-wait.png`, `04-after-continue-click.png`, `05-after-continue-second-click.png`, `06-after-browser-zoom-out-attempt.png`, `07-after-tab-focus.png`, `08-after-right-key.png`, `09-after-keyboard-enter.png`, `10-after-horizontal-scroll-attempt.png`, `11-after-horizontal-wheel-correct.png`, `12-after-second-horizontal-wheel.png`, `13-after-vertical-scroll-for-controls.png`, `15-return-to-menu-before-new-run-edge.png`, `16-after-clipped-new-run-edge-click.png`
- Repro steps:
  1. Open `https://purplemosscollectors.itch.io/dndg` in the shared Chrome browser-harness window.
  2. Click visible itch `Run game`.
  3. Wait for the embedded game menu.
  4. Observe inactive-looking `Continue` near the center and clipped `New Run` at the far right edge.
  5. Attempt same-window recovery: zoom out, keyboard navigation, horizontal wheel, vertical scroll for external controls, and clipped-edge click.
- Expected behavior: A normal player-visible path should allow starting or resuming a run from the current shared-window test surface.
- Actual behavior: The required new-run path remained inaccessible through the shared-window harness/viewport, and the pass could not reach playable state.
- Classification rationale: The provider reached the game menu, so this is not `BLOCKED_PROVIDER`. The local shared-window viewport/harness could not exercise the game menu reliably enough to continue, so the attempt is `BLOCKED_ENVIRONMENT`.

## Coverage Table

| Scope item | Result | Evidence / notes |
|---|---:|---|
| Hosted itch URL reachable | Pass | `01-provider-load.png` |
| Itch `Run game` launches embed | Pass | `02-after-run-game-click.png`, `03-after-startup-wait.png` |
| Reach playable run | Blocked | Game menu reached, but `Continue` inactive and `New Run` clipped |
| Card/deckbuilder state clarity | Not evaluated | Playable table/combat not reached |
| Legal/illegal action clarity | Not evaluated | Playable table/combat not reached |
| Settings/options/help/pause/restart/give-up | Not evaluated | Could not enter run or access in-game menu controls |
| Same-window remediation | Attempted | Zoom, keyboard, horizontal/vertical scroll, clipped edge click |
| Provider errors/auth wall | Pass | No auth wall or provider refusal observed |
| Performance/load to menu | Pass with limitation | Startup reached game menu; gameplay performance not evaluated |

## Usability / Accessibility Assessment

The visible provider `Run game` affordance was clear. The embedded menu itself was not fully usable at the observed shared-window width: the logo and menu controls were horizontally clipped, and the only centered visible option, `Continue`, appeared unavailable. The pass could not verify focus clarity, card text readability, control discoverability in gameplay, settings readability, or illegal-action messaging.

## Performance / Load Assessment

The itch provider and embedded game loaded to the game menu without a provider crash, auth wall, or obvious startup failure. No gameplay performance conclusion is possible because a run could not be started.

## Provider / Environment Classification

- Provider classification: Provider reachable. The itch page and embedded game menu loaded.
- Environment classification: `BLOCKED_ENVIRONMENT`. The single shared Chrome/browser-harness viewport could not reach the clipped `New Run` control or otherwise enter a playable run through reasonable same-window routes.
- Not a game `FAIL`: QA did not reach playable state; findings are about test-surface accessibility in this run.

## QA Methodology Carry-Forward

- For embedded external games, capture the provider wrapper and the actual game viewport separately when clipping appears.
- Treat inactive resume controls plus clipped start controls as an environment/setup blocker unless gameplay becomes reachable.
- Try same-window recovery in a bounded order before classifying: visible click, keyboard navigation, zoom, scroll, fullscreen/provider controls, then stop.
- Do not let screenshots of store-page media below the embed substitute for actual gameplay evidence.

## Final Approval / Retry Statement

This attempt should be retried only after the shared-window harness can provide a wider usable viewport, expose an itch fullscreen route, or otherwise make the embedded `New Run` path reachable. No alternate-provider retry is required from this evidence alone because the selected provider did reach the game menu.

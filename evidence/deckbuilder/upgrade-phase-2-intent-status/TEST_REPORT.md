# Ash Circuit - Upgrade Phase 2: Enemy Intent And Status Explainability

## Verdict: FAIL

The hosted game loaded and the main enemy-intent/status explainability flow is mostly readable, but the pass is not approvable because Focus math does not remain correct for mixed attack cards after Fractured clears. This affects both the visible card preview and the resolved combat log for Drive Plate, directly contradicting the manual's Focus rule for attack and mixed attack cards.

## Test Inputs

- Hosted URL: `http://127.0.0.1:8765/games/deckbuilder/index.html`
- Manual: `http://127.0.0.1:8765/games/deckbuilder/README.md`
- Manual path: `/Users/sarathmenon/Documents/game_hackathon/games/deckbuilder/README.md`
- Browser: shared Chrome window via browser-harness only
- Viewport covered: 782 x 859 CSS pixels
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/upgrade-phase-2-intent-status/`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/upgrade-phase-2-intent-status/gameplay-recording.mp4`
- Recording method: screenshot sequence encoded to MP4 at 30 fps from clean captured frames

## Summary

Verified cleanly:

- Title load and Settings access.
- Audio feedback remains off by default and after Reset Defaults.
- Focus and Fractured help text is accessible by visible status chip interaction.
- Active enemy intent chips are readable before End Turn.
- Next-intent preview follows the documented Glass Warden cycle.
- Last enemy resolution shows enemy action, guard blocked, HP loss, and Fractured application.
- Fractured applies after Static Hex, affects the next attack card, and clears.
- Reward choice appears after encounter 1 is cleared.

Blocking issue:

- With Focus 2 and Fractured cleared, Drive Plate still previews and resolves as 4 damage even though the manual says Focus adds damage to mixed attack cards. The log says Focus was added while still reporting only 4 damage, so the consequence preview and final resolution are misleading.

## Findings

### F-001 - Blocking - Focus is not correctly reflected or resolved for Drive Plate after Fractured clears

- Severity: High
- Status: Open
- Evidence: `36-turn3-focus-fractured-previews.png`, `37-turn3-after-strike-fractured-cleared.png`, `38-turn3-after-heavy-spark-focus-only.png`, `41-turn4-focus-only-preview-bug.png`, `42-turn4-hand-preview-visible.png`, `43-after-drive-plate-reward-screen.png`
- Evidence clip: `gameplay-recording.mp4 @ 00:23-00:29`
- Evidence status: Main recording segment
- Why this evidence proves the finding: The final recording segment shows Focus active after Fractured clears, the incorrect Drive Plate/Strike preview math, and the reward screen after Drive Plate resolves.

Repro steps:

1. Load the game and start a run.
2. Play through Lance, then on turn 2 play Charge Coil to gain Focus 2 and end the turn into Static Hex.
3. Confirm Static Hex applies Fractured.
4. On turn 3, play Strike; Fractured clears.
5. Play Heavy Spark; Focus-only damage resolves correctly as 12.
6. End turn through Crushing Arc.
7. On turn 4, with Focus 2 and Fractured No, inspect Drive Plate and Strike previews.
8. Play Drive Plate against Glass Warden at 4 HP.

Expected behavior:

- Focus 2 should add +2 damage to every attack or mixed attack card.
- Drive Plate should preview and resolve as 6 damage plus 4 guard.
- Strike should preview as 8 damage.
- Combat log should match final HP and the visible preview math.

Actual behavior:

- Drive Plate preview reads `deal 4 damage (4 base +2 Focus), gain 4 guard` and its chip reads `Attack 4 / Guard 4`.
- Strike preview reads `deal 4 damage (6 base +2 Focus)` while its chip still reads `Attack 6`.
- Playing Drive Plate logs `dealt 4 damage, Focus added 2, gained 4 guard`; Glass Warden moves from 4 HP to 0.
- The UI says Focus is included, but the final preview and resolved damage do not include it for Drive Plate.

## Coverage Table

| Area | Result | Evidence / Notes |
| --- | --- | --- |
| Hosted game load | Pass | `01-title-first-load.png` |
| Settings discoverability | Pass | `02-title-settings-open.png`, `09-title-after-settings-close.png` |
| Audio off by default | Pass | Settings summary shows audio off; `07-settings-after-end-key.png` |
| Reset Defaults audio off | Pass | Audio feedback unchecked after reset; `08-after-reset-defaults-audio-off.png` |
| Focus help | Pass | Focus rule visible in status help; `13-combat-initial-intent.png` |
| Fractured help | Pass | Fractured rule visible by chip interaction; `14-fractured-help-click.png` |
| Active enemy intent chips | Pass | Lance, Static Hex, Crushing Arc chips readable; `16-enemy-initial-intent-next-preview.png`, `30-after-lance-resolution-intent.png`, `35-after-static-hex-resolution-intent.png`, `40-after-crushing-arc-resolution-intent.png` |
| Next-intent preview | Pass | Cycle visible and consistent with manual through Lance -> Static Hex -> Crushing Arc -> Lance; same evidence as above |
| Last enemy resolution | Pass | Lance, Static Hex, and Crushing Arc resolution chips show action, guard blocked, HP loss/status; `30-after-lance-resolution-intent.png`, `35-after-static-hex-resolution-intent.png`, `40-after-crushing-arc-resolution-intent.png` |
| Fractured application and clear | Pass | Static Hex applies Fractured, Strike consumes it, status returns to No; `35-after-static-hex-resolution-intent.png`, `36-turn3-focus-fractured-previews.png`, `37-turn3-after-strike-fractured-cleared.png` |
| Focus/Fractured card previews | Fail | Strike/Heavy Spark mixed Focus+Fractured preview worked earlier, but Focus-only Drive Plate/Strike preview later becomes incorrect; `36-turn3-focus-fractured-previews.png`, `41-turn4-focus-only-preview-bug.png`, `42-turn4-hand-preview-visible.png` |
| Reward choice appears | Pass | Reward choices appear after encounter 1; `43-after-drive-plate-reward-screen.png` |
| Encounter 2 transition / final victory | Not completed | Stopped after blocking Focus/mixed-card math failure |
| Defeat path | Not completed | Stopped after blocking Focus/mixed-card math failure |
| Restart/new run regression | Partial | New Run/Start Run recovery returned to deterministic run state; final restart path not completed |
| Responsive/narrow coverage | Partial | 782 x 859 viewport remained usable for tested flow; no second viewport attempted after blocking fail |
| Blocking runtime errors | Not observed visibly | No visible crash or softlock during clean tested path; console capture was not used |

## State / Action Clarity Gate: FAIL

Important state and actions are not fully understandable without source knowledge because the card consequence preview and the combat log disagree with the documented Focus rule. A player cannot trust the preview for mixed attack damage when Focus is active and Fractured has cleared.

## Regression Checklist

- Title/start flow: Pass.
- Settings open/close from title: Pass.
- Audio off/default/reset: Pass.
- Enemy intent visibility: Pass.
- Next-intent preview: Pass.
- Last enemy resolution: Pass.
- Focus/Fractured status help: Pass.
- Fractured applies and clears: Pass.
- Reward choice: Pass.
- Encounter 2 transition: Not completed after blocking fail.
- Final victory: Not completed after blocking fail.
- Defeat: Not completed after blocking fail.
- Restart/new run: Partial.

## Discarded / Invalid Evidence Note

Screenshots `17` through `24` were recovery/misclick frames and are not used to support this verdict. One earlier contaminated dashboard/evidence capture was removed before finalization. The verdict is based on the clean Deckbuilder URL evidence listed above.

## QA Methodology Carry-Forward

- For card games, verify not only preview text but also post-play log and final HP/guard deltas for every status modifier class.
- When a debuff clears, immediately test the next same-category card and one mixed card; stale modifier state often hides in this transition.
- Treat contradictory math text such as `4 base +2 Focus` producing `4 damage` as a blocking state/action clarity failure even if the encounter can still progress.

## Approval Statement

Not approved. Retest after Focus math and preview/resolution consistency are fixed for mixed attack cards, especially Drive Plate after Fractured clears.

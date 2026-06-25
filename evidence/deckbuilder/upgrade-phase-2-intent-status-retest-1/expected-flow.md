# Expected And Observed Flow

Game: Turn-Based Deckbuilder / Ash Circuit
Attempt: Upgrade Phase 2 - Enemy Intent And Status Explainability - Retest 1
URL: http://127.0.0.1:8765/games/deckbuilder/index.html

## Expected Flow

1. Load the title screen and open Settings.
2. Confirm Settings exposes audio feedback controls, and Reset Defaults keeps audio feedback off before any explicit opt-in.
3. Start a deterministic run against Glass Warden.
4. On turn 1, the active intent should show Lance, the next-intent preview should show Static Hex, and the player hand should show playable cards with previews.
5. After ending turn 1, Last enemy resolution should show Lance, guard absorption, and HP loss.
6. On turn 2, playing Charge Coil should set Focus to 2.
7. After ending turn 2 through Static Hex, Last enemy resolution should show Static Hex, guard absorption, HP loss, and Fractured applied.
8. With Focus 2 and Fractured active, attack and mixed-card previews should include both modifiers.
9. Playing Strike in that state should resolve 6 damage from `6 base +2 Focus -2 Fractured`, clear Fractured, and log the same math.
10. With Focus 2 and Fractured cleared, Heavy Spark should preview and resolve 12 damage from `10 base +2 Focus`.
11. After ending turn through Crushing Arc, Last enemy resolution should show the heavy attack, guard blocked, and HP loss.
12. With Glass Warden at 4 HP, Focus 2, and Fractured cleared, Drive Plate should visibly communicate calculated 6 damage from `4 base +2 Focus` plus 4 guard, even though only 4 enemy HP remains.
13. Playing Drive Plate should reduce enemy HP to 0, show reward choice, and log the calculated 6 damage plus 4 guard without contradicting the preview/footer.
14. The reward choice should transition into encounter 2 with the selected reward added to the deck.
15. In encounter 2, Strike with Focus 2 and no Fractured should preview and resolve 8 damage from `6 base +2 Focus`.
16. Focus and Fractured status chips should expose rule help through visible interaction.

## Observed Flow

- `01-title-first-load.png` through `04-settings-after-reset-defaults-audio-off.png`: title/settings path loaded, Settings opened, and Reset Defaults left audio feedback off.
- `06-clean-run-start-top.png` through `17-after-static-hex-resolution-intent.png`: the run reached the expected deterministic intent sequence, including Lance, Static Hex, next-intent preview, and Last enemy resolution chips.
- `18-turn3-focus2-fractured-strike-preview.png` and `20-turn3-focus2-fractured-heavy-preview.png`: Focus 2 plus Fractured previews showed the expected damage reductions.
- `21-turn3-after-strike-fractured-cleared-top.png` and `22-turn3-after-strike-log.png`: Strike resolved 6 damage, Focus added 2, Fractured reduced damage by 2, and Fractured cleared.
- `23-turn3-focus-only-heavy-preview.png` through `25-turn3-after-heavy-log.png`: Heavy Spark then previewed/resolved 12 damage with Focus only.
- `26-turn4-after-crushing-arc-top.png` and `27-turn4-last-resolution-intent.png`: Crushing Arc resolution showed guard blocked 0 and HP loss 9.
- `29-turn4-drive-plate-focus-only-preview.png`: Drive Plate showed calculated 6 damage plus 4 guard at Focus 2 with Fractured cleared.
- `31-after-drive-plate-victory-reward-top.png` and `32-after-drive-plate-reward-log.png`: Drive Plate reduced Glass Warden to 0 HP, opened reward choice, and logged 6 damage plus 4 guard.
- `33-second-run-start-top.png` through `44-second-run-after-strike8-log.png`: reward selection transitioned to encounter 2, and Strike with Focus 2/no Fractured previewed and resolved 8 damage.
- `50-focus-status-help-via-chip.png` and `51-fractured-status-help-via-chip.png`: Focus and Fractured status-chip interactions exposed readable rule help.

## Evidence Notes

- `05-current-after-settings-reset-recovery.png`, `48-focus-status-help-after-click.png`, and `49-fractured-status-help-after-click.png` are discarded from verdict support. They were recovery or missed-coordinate frames and are not included in the MP4.
- `gameplay-recording.mp4` was encoded from 48 clean browser-harness screenshots at 3 FPS.

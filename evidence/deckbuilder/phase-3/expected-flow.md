# Expected Flow: Turn-Based Deckbuilder Phase 3

Recording: `gameplay-recording.mp4`

The recording shows a continuous 10 FPS browser-harness capture of Ash Circuit Phase 3 at `http://127.0.0.1:8765/games/deckbuilder/index.html`.

Expected sequence:

1. The game loads to the Ash Circuit start panel for a two-encounter run.
2. Start Run begins encounter 1 against Glass Warden with deck size 12 and Lance as the first visible intent.
3. Phase 1 and Phase 2 combat systems are exercised: Quick Study draws cards, Charge Coil grants Focus, Drive Plate deals Focus-boosted damage and grants guard, Guard blocks Lance, Static Hex applies Fractured, and Fractured reduces the next attack before clearing.
4. Encounter 1 is won and the reward choice panel appears with Flare Shot, Shield Loom, and Surge Plan.
5. Flare Shot is selected. Encounter 2 starts immediately against Mirror Sentinel with the run status showing deck size 13 and reward: Flare Shot.
6. Encounter 2 shows the Mirror Sentinel intent cycle: Needle Burst, Splinter Mark, and Overload Sweep.
7. The selected Flare Shot reward appears in the encounter 2 deck/hand and is played.
8. Encounter 2 is won and the Final Victory screen appears.
9. Play Again restarts the deterministic run.
10. Repeatedly ending turns without playing cards verifies the defeat path.

The capture was produced from browser-harness screenshots saved at 10 FPS, then encoded to MP4/H.264 with ffmpeg.

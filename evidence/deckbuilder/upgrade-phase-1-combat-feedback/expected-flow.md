# Expected Flow: Deckbuilder Upgrade Phase 1

Recording: `gameplay-recording.mp4`

The recording shows a continuous 10 FPS browser-harness capture of Ash Circuit at `http://127.0.0.1:8765/games/deckbuilder/index.html`.

Expected sequence:

1. The game loads to the Ash Circuit start panel.
2. Start Run begins encounter 1 with readable HP bars, enemy intent, player statuses, energy, draw/hand/discard counts, and card previews.
3. Heavy Spark is keyboard-focused to verify preview metadata is available through focus/title/ARIA state.
4. Quick Study, Charge Coil, Drive Plate, and Guard are played. The recording shows immediate feedback chips, card-play feedback, HP/guard/status changes, and matching combat log entries.
5. With 0 energy, remaining cards stay visible but disabled and show inline reasons such as the required energy and current energy.
6. End Turn resolves the enemy intent, including guard-block feedback and HP/intent updates.
7. Static Hex applies Fractured; card previews show Focus and Fractured math before play, and the next attack resolves with matching combat log math.
8. Encounter 1 is won and the reward choice panel appears with Flare Shot, Shield Loom, and Surge Plan.
9. Flare Shot is selected; encounter 2 starts with deck size 13 and reward: Flare Shot.
10. Encounter 2 verifies Mirror Sentinel intent flow, reward persistence, and Flare Shot being played from the updated deck.
11. Winning encounter 2 shows Final Victory.
12. Play Again restarts the run, and repeated End Turn actions verify the defeat state remains reachable and readable.

Additional viewport check:

- `narrow-viewport-check.png` captures a 430 x 820 viewport. The layout becomes vertically scrollable with no observed horizontal clipping in the checked state.

The capture was produced from browser-harness screenshots saved at 10 FPS, then encoded to MP4/H.264 with ffmpeg.

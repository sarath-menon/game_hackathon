# Expected Flow: Turn-Based Deckbuilder Phase 1

Recording: `gameplay-recording.mp4`

The recording shows a continuous 10 FPS browser-harness capture of Ash Circuit at `http://127.0.0.1:8765/games/deckbuilder/index.html`.

Expected sequence:

1. The game loads to the Ash Circuit start panel with a Start Combat button.
2. Start Combat begins the deterministic fight, showing player HP, enemy HP, energy, draw/hand/discard counts, and a five-card hand.
3. Heavy Spark is played for 2 energy, reducing enemy HP by 10 and leaving 1 energy.
4. Guard is played for 1 energy, setting player guard to 5 and reducing energy to 0. Remaining cards are disabled.
5. End Turn discards the remaining hand, the enemy attacks for 6, guard blocks 5, and player HP drops from 40 to 39.
6. The next turns show card draw, draw-pile refill from discard, attack cards reducing enemy HP, and victory when the enemy reaches 0 HP.
7. Play Again restarts a fresh deterministic fight.
8. Repeatedly ending turns without playing cards verifies the defeat path: enemy attacks reduce player HP to 0 and the defeat panel appears.

The capture was produced from browser-harness screenshots saved at 10 FPS, then encoded to MP4/H.264 with ffmpeg.

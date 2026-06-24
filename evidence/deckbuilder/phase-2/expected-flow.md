# Expected Flow: Turn-Based Deckbuilder Phase 2

Recording: `gameplay-recording.mp4`

The recording shows a continuous 10 FPS browser-harness capture of Ash Circuit Phase 2 at `http://127.0.0.1:8765/games/deckbuilder/index.html`.

Expected sequence:

1. The game loads to the Ash Circuit start panel.
2. Start Combat begins a deterministic fight with player HP, enemy HP, energy, draw/hand/discard counts, visible Focus and Fractured status, and the first enemy intent, Lance.
3. Quick Study is played for 0 energy and draws 2 cards.
4. Charge Coil is played for 1 energy and raises visible Focus to 2.
5. Drive Plate is played as a mixed attack/guard card. With Focus 2, it deals 6 damage and gives 4 guard.
6. Guard is played, raising guard before Lance. End Turn resolves Lance for 6 damage, guard blocks the attack, and the next visible intent becomes Static Hex.
7. Ending the next turn resolves Static Hex for 4 damage and applies visible Fractured.
8. A Strike is played while Fractured and Focus are active. The log shows Focus adding 2 and Fractured reducing damage by 2, then Fractured clears.
9. Crushing Arc appears and resolves as the high-damage intent, then the cycle returns to Lance.
10. Continued attacks reach the victory state.
11. Play Again restarts the deterministic fight.
12. Repeatedly ending turns without playing cards verifies the defeat state.

The capture was produced from browser-harness screenshots saved at 10 FPS, then encoded to MP4/H.264 with ffmpeg.

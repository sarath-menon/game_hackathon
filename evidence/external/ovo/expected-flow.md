# OvO Expected Flow

Game: OvO

Source URL: https://www.crazygames.com/game/ovo

Manual: /Users/sarathmenon/Documents/game_hackathon/external-qa/ovo/README.md

## Expected Player Flow

1. Open the CrazyGames OvO page.
2. Wait for the CrazyGames shell and embedded OvO game frame to finish loading.
3. Click or focus inside the game frame if keyboard input is not active.
4. Use the visible game controls or start/options UI to begin play.
5. Move through the opening platforming level with left/right movement, jumping, sliding/crouching where required, and restart/reset if a failure occurs.
6. Confirm that hazards, level geometry, movement state, and the goal are visually readable from normal play.
7. Use any visible settings/options menu to verify control, mode, remap, audio, or display choices if present.

## Observed Flow During This Test

1. The user-supplied CrazyGames URL loaded the portal shell.
2. The embedded game area displayed an OvO loading screen, then a black in-frame loading screen with a white OvO logo and a blue progress bar.
3. The progress bar did not complete during repeated waits and focus attempts.
4. The embedded frame URL was opened directly as a secondary hosted-surface check and reproduced the same loading screen.
5. Gameplay, controls, restart, level completion, and in-game settings/options could not be reached.

## Evidence Timeline

- `initial-load.png`: CrazyGames portal load screen for OvO.
- `remote-after-load.png`: isolated browser session at the CrazyGames URL, preparing the game.
- `load-tick-1.png` through `load-tick-4.png`: timed launch checkpoints on the CrazyGames URL.
- `direct-frame-load.png`: direct embedded game frame reproducing the same loading state.
- `final-load-state.png`: final post-reload state in the direct game frame.
- `mobile-load-state.png`: narrow/responsive spot check still blocked by loading.
- `gameplay-recording.mp4`: 60-second continuous capture of the repeated loading state after a fresh direct-frame reload.

## Completion State

Expected completion was not reached. The test is blocked by a launch failure before player control.

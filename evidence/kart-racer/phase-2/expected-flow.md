# Expected Flow: Arcade Kart Racer Phase 2 Second Retest

1. The hosted game opens to the Arcade Kart Racer Phase 2 start screen.
2. Starting the race begins the timer and shows speed, lap progress, race time, and next checkpoint.
3. The lap HUD starts at `0/1` while the scored lap is in progress.
4. The opening bend clearly presents CP1, CP2, CP3, then the yellow finish gate.
5. The player clears CP1, then CP2, then CP3 in order through normal W/A/S/D or arrow-key driving.
6. The HUD advances from CP1 to CP2 to CP3 to `Finish`.
7. After CP1, CP2, and CP3 are cleared, crossing the yellow finish gate completes lap `1/1`.
8. The completion screen displays the final race time.

Recording notes: `gameplay-recording.mp4` is the fresh second-retest recording captured continuously from the browser canvas with `HTMLCanvasElement.captureStream(30)` and `MediaRecorder`, then converted from WebM to H.264 MP4 with ffmpeg. It demonstrates the route reaching `NEXT Finish` after checkpoints, then remaining unable to score the visible yellow finish gate.

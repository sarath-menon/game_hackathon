# Expected Flow: Arcade Kart Racer Phase 1 Retest

1. The hosted game opens to the Arcade Kart Racer title/start screen.
2. Pressing Space or Enter starts the race and shows the third-person 3D track view.
3. Holding W or Arrow Up accelerates the kart and updates the visible speed readout.
4. Pressing S or Arrow Down brakes or reverses the kart.
5. Holding A/Left or D/Right steers the kart around the loop.
6. The camera remains readable while the kart approaches the yellow finish gate.
7. The white guard rails and road edge constrain the kart to the drivable route.
8. Entering/crossing the yellow finish gate triggers the finish-complete state.

Recording notes: `gameplay-recording.mp4` is the fresh retest recording. It was captured continuously from the browser canvas with `HTMLCanvasElement.captureStream(30)` and `MediaRecorder`, then converted from WebM to H.264 MP4 with ffmpeg. The recording demonstrates load/start, driving controls, the visible finish gate, and the `Finish Crossed` completion screen.

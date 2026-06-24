# Expected Flow: Arcade Kart Racer Phase 1

1. The game opens to the Arcade Kart Racer title/start screen.
2. Pressing Space or Enter starts the race and shows a third-person 3D track view.
3. Holding W or Arrow Up accelerates the kart and increases the visible speed readout.
4. Pressing S or Arrow Down brakes or reverses the kart.
5. Holding A/Left or D/Right steers the kart.
6. Driving into the white guard rail/off-track edge keeps the kart constrained to the road and reduces speed.
7. The yellow finish gate remains visible/reachable along the loop.
8. Crossing the yellow finish gate triggers the finish-complete screen.

Recording notes: `gameplay-recording.mp4` is a continuous browser canvas recording captured at 30 FPS via `HTMLCanvasElement.captureStream(30)` and converted from WebM to H.264 MP4 with ffmpeg. The recorded pass demonstrates loading, start flow, acceleration, braking, steering, boundary pressure, and the failed finish attempt.

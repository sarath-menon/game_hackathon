# Expected Flow: Arcade Kart Racer Phase 2 Final-Gate Retest

1. Start screen: `finalfix-record-00-title.png`, about 0.0s in the recording. The HUD/manual text says clear CP1, CP2, CP3, then finish, with lap at `0/1`.
2. Race start: `finalfix-record-01-started.png`, about 0.7s. The timer runs, HUD shows `NEXT CP1`, and the first gate is directly on the opening bend.
3. Opening bend: `finalfix-record-step-00.png`, about 1.9s. The kart accelerates through the opening bend and the HUD has already advanced through early checkpoint progress to `NEXT CP3`.
4. Final scoring: `finalfix-record-step-01.png` and `finalfix-record-final.png`, about 2.0s. The yellow finish gate scores after ordered checkpoints, the HUD reaches `LAP 1/1`, and the race-complete screen shows the final time.

Intended visible route: from the start, drive into the opening left-hand bend and follow the labeled gate sequence CP1 -> CP2 -> CP3 -> yellow finish. The camera, world labels, HUD `NEXT` panel, and minimap all point to the same short opening-bend route. The final gate is visibly on the road and scores once the ordered checkpoints are complete.

Recording notes: `gameplay-recording.mp4` is the fresh final-gate retest recording captured continuously from the browser canvas with `HTMLCanvasElement.captureStream(30)` and `MediaRecorder`, then converted from WebM to H.264 MP4 with ffmpeg.

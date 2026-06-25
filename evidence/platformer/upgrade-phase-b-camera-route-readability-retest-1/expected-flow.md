# Expected / Observed Flow

Attempt: Side-Scrolling Platformer / Skyline Stepper - Upgrade Phase B Retest 1

## Expected Flow

1. Load the hosted game URL and read the player manual.
2. From the title screen, the player can clearly start a run or open Settings.
3. Settings should expose Player Variant Controls and documented camera/readability/audio defaults.
4. Reset Defaults should restore documented defaults and keep generated sounds off with volume `0%`.
5. Starting a run should show the HUD and route cues.
6. Normal right movement should advance the player along the lower safe route.
7. The camera should reveal upcoming safe route, hazards, route choices, checkpoint, and exit cues before commitment.
8. Ordinary jumps should not cause disorienting vertical camera motion.
9. The lower safe route should progress through the mid checkpoint and continue to Level Complete through normal documented play.
10. Settings should open/close during a run and return control cleanly.
11. Narrow viewport should be attempted if the harness remains stable.

## Observed Flow

1. The game loaded at `http://127.0.0.1:8765/games/platformer/index.html`.
2. Title/start controls were visible.
3. Settings opened and showed Player Variant Controls with Air Control and Damage Profile options.
4. The lower settings area showed Generated UI Sounds off and Volume `0%`; Reset Defaults was exercised.
5. A run started and the HUD appeared with `Reach the exit beacon`, `Health: 3`, `Checkpoint: start`, `Cores: 0/8`, and `301 m`.
6. The route retest could not proceed. Browser-harness movement attempts did not move the player from the start state.
7. During input recovery, the active target drifted away from the Platformer URL to `http://127.0.0.1:8765/dashboard.html`.
8. Browser interaction stopped immediately after target drift. The drifted frame was moved to `discarded/` and was not used to support a gameplay verdict.

## Verdict-Relevant Evidence

- Title and settings: `01-title-load.png` through `07-title-after-settings-close.png`
- Run start and failed movement exercise: `08-run-start.png` through `18-right-route-progress.png`
- Input recovery before target drift: `23-focus-key-d-310-750.png` through `26-focus-key-ArrowRight-310-750.png`
- Discarded after drift: `discarded/27-focus-key-ArrowRight-450-725-target-drift-after-capture.png`
- Continuous clean recording: `gameplay-recording.mp4`

## Outcome

Verdict: BLOCKED_ENVIRONMENT

The retest did not produce reliable evidence for the lower-route fix. The current build is neither approved nor failed on game quality by this attempt.

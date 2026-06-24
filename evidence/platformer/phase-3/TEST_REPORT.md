# TEST_REPORT: Side-Scrolling Platformer Phase 3

## Game and Phase

- Game: Side-Scrolling Platformer
- Phase: Phase 3, Level Polish
- Build under test: Skyline Stepper

## Verdict

FAIL

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/platformer/index.html`
- README/manual URL: `http://127.0.0.1:8765/games/platformer/README.md`
- README/manual path: `/Users/sarathmenon/Documents/game_hackathon/games/platformer/README.md`
- Browser: Chrome controlled through `browser-harness`
- Viewport: 960x540 canvas capture from fresh platformer CDP targets

## Evidence

- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/phase-3/`
- Continuous recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/phase-3/gameplay-recording.mp4`
- Expected-flow description: `/Users/sarathmenon/Documents/game_hackathon/evidence/platformer/phase-3/expected-flow.md`
- Recording method: `HTMLCanvasElement.captureStream(30)` with `MediaRecorder`, then WebM transcoded to MP4/H.264 at 30 FPS with `ffmpeg`. Final MP4 duration is 10.866 seconds.

## Summary

The hosted game loads and the README/manual matches the visible Phase 3 HUD and controls. Phase 1 movement/jump/gravity/platform/camera behavior remains intact. The reliable lower-deck route still reaches the green EXIT beacon and shows `Level Complete`. The recorded run reaches completion with `Health: 3`, `Checkpoint: mid`, `Cores: 1/8`, and then pressing Enter restarts to `Health: 3`, `Checkpoint: start`, `Cores: 0/8`, `301 m`.

Phase 3 polish elements are visible in black-box visual probes: readable route markers such as `CORE ROUTE`, red vent hazards, an orange patrol runner on an upper platform, and the mid-level checkpoint. A focused probe confirmed checkpoint recovery: after touching `Checkpoint: mid`, upper-route hazard/patrol contact reduced health to 2 and respawned with `Checkpoint: mid`.

The phase cannot pass because the required health-zero failure summary could not be reproduced in Phase 3. Multiple repeated-damage probes either avoided damage, reached the checkpoint, or completed the level before health reached zero.

No blocking console/runtime errors were captured.

## Findings

### P1 - Health-zero failure summary not reproducible in Phase 3

- Severity: High
- Status: Open
- Repro steps:
  1. Open `http://127.0.0.1:8765/games/platformer/index.html`.
  2. Start the run.
  3. Attempt repeated contact with red vents or orange patrol runners using documented movement and jump controls.
  4. Wait out respawn invulnerability between attempts.
- Expected behavior: Repeated damage should eventually reduce health to 0 and show the documented `Run Ended` summary with collected glow cores.
- Actual behavior: Damage and checkpoint respawn can occur, but repeated attempts did not produce `Health: 0` or the `Run Ended` summary. Several attempts instead progressed to checkpoint or Level Complete.
- Evidence: Completion/restart is shown in `gameplay-recording.mp4`; probe state captured `Damaged - respawned`, `Health: 2`, `Checkpoint: mid`, but no Phase 3 health-zero summary.

## Regression Checklist

- Hosted game loads: PASS
- README/manual reachable and consistent with visible behavior: PASS
- Phase 1 movement/jump/gravity/platform/camera behavior preserved: PASS
- Phase 2 lower-deck completion route reaches exit: PASS
- Glow-core collectibles are visible and counted: PASS
- Level Complete summary reflects cores plus remaining health: PASS
- Phase 3 route/readability markers visible: PASS
- Orange patrol runner visible on upper platform: PASS
- Checkpoint marker and HUD state work: PASS
- Checkpoint respawn after damage works: PASS
- Restart from completion works: PASS
- Health-zero failure summary works: FAIL
- No softlocks encountered during recorded completion or probes: PASS
- No blocking console/runtime errors captured: PASS
- Smooth continuous MP4 evidence exists: PASS

## Approval Statement

Side-Scrolling Platformer Phase 3 is not approved. Completion, checkpoint recovery, patrol visibility, readability markers, and restart work, but the required health-zero failure summary was not reproducible in this black-box pass.

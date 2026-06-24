# Arcade Kart Racer - Phase 3 Test Report

## Game and phase

Arcade Kart Racer - Phase 3: Game Feel

## Verdict

PASS

## Test inputs

- Game URL: `http://127.0.0.1:8765/games/kart-racer/index.html`
- README/manual: `http://127.0.0.1:8765/games/kart-racer/README.md`
- Browser: Chrome controlled through `browser-harness`
- Viewport observed: 1728 x 996 / 1728 x 997

## Evidence

- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/phase-3/`
- Recording: `gameplay-recording.mp4`
- Expected flow: `expected-flow.md`
- Recording method: browser-harness screenshot capture at 10 fps, encoded to MP4 with ffmpeg. Duration: 3.3 seconds. Size: 1,248,285 bytes.

## Summary

The hosted Phase 3 game loads and matches the README/manual. The start flow works, the kart accelerates, steers, brakes/reverses, remains readable from the chase camera, and stays constrained by the track/guard rail layout. Ordered race rules remain intact: HUD starts at `LAP 0/1`, checkpoints advance in order, finish/lap completion remains locked until checkpoint order is satisfied, the timer runs, and the yellow finish produces `LAP 1/1` plus a Race Complete final-time screen after CP1, CP2, and CP3.

Phase 3 systems passed. Cyan boost pads are visible on the route and produce a speed surge plus feedback message. Red cone/barrier obstacles are visibly distinct, produce collision feedback, slow/bump the kart, and are recoverable. Speed feedback is visible through the HUD speed value/bar and boost streak visuals. Restart via `R` resets the race to `LAP 0/1`, `NEXT CP1`, speed 0. No blocking runtime errors were observed.

## Findings

No critical or high-severity findings.

### Informational - Browser harness server availability during setup

- Severity: Low
- Status: Resolved during test setup
- Repro steps: Attempted to load the hosted URL after the local HTTP server process had exited.
- Expected behavior: Hosted URL should load when the documented local server is running.
- Actual behavior: Chrome showed `ERR_CONNECTION_REFUSED` until the documented server was restarted in a persistent session.
- Evidence: Later hosted-load and gameplay checks passed after restart.

## Readability / route clarity assessment

PASS

First-action clarity passes: from start/reset state, the kart faces a readable opening bend, HUD says `NEXT CP1`, the objective text states the ordered route, and CP1 is visible ahead with the minimap marker cluster.

Route alignment passes: camera, CP labels, minimap markers, HUD `NEXT` text, road shape, and yellow finish gate agree on the route through CP1, CP2, CP3, then finish. Sequential discoverability passes because each cleared checkpoint updates the HUD to the next objective and the next gate is visible/reachable from normal driving.

Phase 3 object clarity passes: cyan `BOOST` pads are visibly blue/cyan and labeled `BOOST`, while red cones/barriers are red and labeled separately. They are distinguishable from blue checkpoints and the yellow finish gate. Boost and obstacle approaches are readable from normal play; the barrier/cone hit is recoverable and does not create a softlock.

## Regression checklist

- Hosted game loads: PASS
- README/manual matches visible behavior: PASS
- Start flow via Enter/Space: PASS
- Steering, acceleration, brake/reverse: PASS
- Chase camera readability: PASS
- Track boundary/off-track constraint: PASS
- HUD starts at `LAP 0/1`: PASS
- Ordered CP1 -> CP2 -> CP3 route: PASS
- Finish locked until checkpoints cleared: PASS
- Wrong-order/finish-lock feedback visible: PASS
- Race timer runs: PASS
- Yellow finish scores after checkpoints: PASS
- `LAP 1/1` and final-time Race Complete screen: PASS
- Boost pad acceleration and feedback: PASS
- Obstacle collision feedback and recovery: PASS
- Speed feedback via HUD/visuals: PASS
- Restart from completion via `R`: PASS
- Minimap/object markers readable: PASS
- Stable performance/no softlocks: PASS
- Blocking console/runtime errors: PASS

## Approval statement

Phase 3 is approved. The report verdict is PASS, `expected-flow.md` exists, `gameplay-recording.mp4` exists and demonstrates the required Phase 3 interactions plus completion, the readability/orientation gate passes, and no unresolved critical or high-priority findings remain.

# Arcade Kart Racer Upgrade Phase A Retest 1 QA Report

## Scope

Upgrade Phase A: Drift And Boost Feel, Retest 1 after builder fix.

## Verdict

PASS

## Test Environment

- Game URL: `http://127.0.0.1:8765/games/kart-racer/index.html`
- README/manual: `http://127.0.0.1:8765/games/kart-racer/README.md`
- Browser: Chrome controlled through `browser-harness`
- Viewport: 1728 x 996
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/upgrade-phase-a-drift-boost/retest-1/`
- Recording: `gameplay-recording.mp4`
- Recording method: browser-harness screenshot capture encoded to MP4 with ffmpeg. Duration: 4.67 seconds. Size: 859,105 bytes.

## Summary

Retest 1 passes. The prior blockers are fixed from a normal player perspective: Early, Ready, and Strong drift stages are visible in the HUD, release from each charged stage produces clear `DRIFT Boost` feedback with a speed surge, and the route remains readable while drifting. Wall/edge contact still weakens/cuts drift charge with understandable feedback. Standstill drift remains idle as documented.

Prior race behavior also regressed cleanly: hosted/manual load, visible controls, title/start, steering, acceleration, heading-up route/minimap clarity, CP1 -> CP2 -> CP3 -> finish, `LAP 0/1` to `LAP 1/1`, final-time Race Complete, restart, existing boost/obstacle visibility, and no blocking runtime errors.

## Test Cases

| ID | Test case | Result | Evidence |
| --- | --- | --- | --- |
| TC-01 | Hosted game loads at supplied URL | PASS | `hosted-load.png` |
| TC-02 | README/manual controls agree with visible UI | PASS | `hosted-load.png` |
| TC-03 | First playable route/minimap remain heading-up/readable | PASS | `first-playable-frame.png` |
| TC-04 | Drift does not start from standstill | PASS | `probes/standstill-01.png` |
| TC-05 | Drift starts at moderate speed while steering | PASS | `recording-frames/frame-0012.png` |
| TC-06 | Early stage is visible | PASS | `recording-frames/frame-0013.png`, `probes/poll-early-early-seen.png` |
| TC-07 | Ready stage is visible | PASS | `probes/ArrowLeft-held-04.png`, `probes/poll-ready-ready-seen.png` |
| TC-08 | Strong stage is visible | PASS | `recording-frames/frame-0014.png`, `probes/poll-strong-strong-seen.png` |
| TC-09 | Early release gives visible/recoverable boost | PASS | `probes/poll-early-release-022.png` |
| TC-10 | Ready release gives visible/recoverable boost | PASS | `probes/poll-ready-release-022.png` |
| TC-11 | Strong release gives visible/recoverable boost | PASS | `probes/poll-strong-release-022.png`, `recording-frames/frame-0016.png` |
| TC-12 | Wall/edge contact weakens or cuts drift charge | PASS | `recording-frames/frame-0025.png` |
| TC-13 | Normal route completes CP1 -> CP2 -> CP3 -> finish | PASS | `gameplay-recording.mp4`, `recording-frames/frame-0016.png` |
| TC-14 | Race Complete shows `LAP 1/1`, final time, `NEXT Done` | PASS | `recording-frames/frame-0016.png` |
| TC-15 | Restart works | PASS | recording reset segment |
| TC-16 | No blocking runtime errors | PASS | runtime hook returned `errors: []` |

## Findings

No open blocking findings.

### Informational - Drift stages can advance quickly

- Severity: Low
- Status: Accepted / non-blocking
- Classification: usability observation
- Repro steps: Accelerate to moderate speed, hold Shift while steering through the opening bend.
- Expected behavior: The HUD progresses through Early, Ready, and Strong quickly enough to be useful.
- Actual behavior: The stages are now visible and message-backed, but they advance quickly; releasing when the HUD says the desired stage works reliably in probe tests.
- Evidence: `probes/poll-ready-ready-seen.png`, `probes/poll-strong-strong-seen.png`, `probes/poll-ready-release-022.png`, `probes/poll-strong-release-022.png`.

## Readability / Usability Gate

PASS

The drift system now preserves route readability. The drift HUD is compact, stage labels are clear, and particle/skid/boost effects do not obscure CP gates, finish, minimap, road edges, or obstacles. The manual’s timing rule is understandable from visible feedback: start at speed while steering, hold through Early/Ready/Strong, release when the desired stage is shown. Wall scrub/cut feedback is explicit and recoverable.

## Regression Checklist

- Hosted game loads: PASS
- README/manual loads and matches visible controls: PASS
- Title/start flow: PASS
- Steering/acceleration: PASS
- Brake/reverse: PASS by documented control availability; no regression observed
- Heading-up route/minimap clarity: PASS
- CP1 -> CP2 -> CP3 -> finish: PASS
- `LAP 0/1` start and `LAP 1/1` completion: PASS
- Final time / Race Complete screen: PASS
- Existing boost pads remain visible: PASS
- Obstacles remain visible/readable: PASS
- Restart: PASS
- Runtime errors / softlocks: PASS
- Drift start condition: PASS
- Drift Early/Ready/Strong staged charge: PASS
- Drift release boosts: PASS
- Drift cancellation/weakening on wall scrub: PASS
- Drift effects preserve route readability: PASS

## Final Approval Statement

Upgrade Phase A Retest 1 is approved. The verdict is PASS, required evidence files exist, the recording shows staged drift charge/release plus race completion, the readability/usability gate passes, and no unresolved high-priority findings remain.

# Arcade Kart Racer Upgrade Phase A QA Report

## Scope

Upgrade Phase A: Drift And Boost Feel

## Verdict

FAIL

## Test Environment

- Game URL: `http://127.0.0.1:8765/games/kart-racer/index.html`
- README/manual: `http://127.0.0.1:8765/games/kart-racer/README.md`
- Browser: Chrome controlled through `browser-harness`
- Viewport: 1728 x 996
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/upgrade-phase-a-drift-boost/`
- Recording: `gameplay-recording.mp4`
- Recording method: browser-harness screenshot capture encoded to MP4 with ffmpeg. Duration: 5.4 seconds. Size: 919,767 bytes.

## Summary

The hosted game and README/manual load, the visible controls match the manual, and prior route/race behavior still works: start, acceleration, steering, heading-up route clarity, CP1 -> CP2 -> CP3 -> finish, `LAP 0/1` to `LAP 1/1`, final-time Race Complete, restart, and no blocking runtime errors.

The upgrade does not pass because the new drift system does not match the README/manual from a player perspective. Drift correctly stays idle from standstill and can enter an early/build state at speed, and wall contact can weaken/cut the charge. However, I could not observe the documented staged charge progression through `Early`, `Ready`, and `Strong`, and releasing drift did not produce a clear short visible speed boost before charge was cut or speed collapsed.

## Test Cases

| ID | Test case | Result | Evidence |
| --- | --- | --- | --- |
| TC-01 | Hosted game loads at supplied URL | PASS | `hosted-load.png` |
| TC-02 | README/manual controls agree with visible UI | PASS | `hosted-load.png`, manual text |
| TC-03 | First playable route and minimap remain heading-up/readable | PASS | `first-playable-frame.png` |
| TC-04 | Normal route clears CP1 -> CP2 -> CP3 -> finish | PASS | `gameplay-recording.mp4`, `recording-frames/frame-0024.png` |
| TC-05 | Race completion shows `LAP 1/1`, Race Complete, final time | PASS | `recording-frames/frame-0024.png` |
| TC-06 | Restart resets the race | PASS | Recording restart segment and probes |
| TC-07 | Drift does not start from standstill | PASS | `probes/drift-cdp-standstill-01.png` |
| TC-08 | Drift starts at speed while steering | PASS | `probes/continuous-ArrowLeft-1.png`, `recording-frames/frame-0010.png` |
| TC-09 | Drift charge shows Early / Ready / Strong staged feedback | FAIL | Only Early/build and Cut observed |
| TC-10 | Drift release produces short visible speed boost | FAIL | Release attempt did not show clear boost; speed fell/cut |
| TC-11 | Wall/edge contact weakens or cancels drift charge | PASS | `probes/continuous-ArrowRight-2.png` |
| TC-12 | Drift effects preserve route readability | PASS with caveat | Effects did not obscure route, but drift behavior requires probing |
| TC-13 | No blocking runtime errors | PASS | Runtime error hook returned `errors: []` |

## Findings

### P1 - Drift charge stages beyond Early are not observable

- Evidence clip: gameplay-recording.mp4 @ 00:00-00:04
- Evidence status: Main recording segment
- Why this evidence proves the finding: The drift attempt segment shows only early/brief boost or idle/cut feedback in the main recording, with no visible Ready or Strong stage progression before the run moves on.
- Severity: High
- Status: Open
- Classification: mechanical / feedback
- Repro steps: Start race, accelerate to moderate speed, hold Shift or Space while steering, continue holding long enough for staged charge.
- Expected behavior: Drift meter visibly progresses through green `Early`, yellow `Ready`, and red `Strong` as documented.
- Actual behavior: The HUD showed `Early` or a build/charge state briefly, then commonly changed to `Cut` or `Idle`; `Ready` and `Strong` were not observed in repeated black-box attempts.
- Evidence: `probes/continuous-ArrowLeft-1.png` shows Early; later held frames show Cut/Idle instead of Ready/Strong.

### P1 - Drift release boost is not clearly visible or recoverable

- Evidence clip: gameplay-recording.mp4 @ 00:01-00:04
- Evidence status: Main recording segment
- Why this evidence proves the finding: The release-attempt portion does not show a clear recoverable speed surge after drift charge, matching the finding that the documented boost was not readable from normal black-box play.
- Severity: High
- Status: Open
- Classification: mechanical / feedback
- Repro steps: Start a drift at speed, release Shift/Space after charge begins.
- Expected behavior: Releasing drift converts current charge into a short visible speed boost and remains recoverable.
- Actual behavior: Release attempts either produced no clear boost or the kart dropped to near-zero speed / cut state. One probe showed `Drift boost released: Early`, but speed was 0 and the result did not read as a visible boost.
- Evidence: `probes/drift-early-left-02.png`, `probes/continuous-ArrowLeft-release.png`, `gameplay-recording.mp4`.

### P2 - Drift usability requires repeated probing

- Evidence clip: gameplay-recording.mp4 @ 00:00-00:04
- Evidence status: Main recording segment
- Why this evidence proves the finding: The clip shows the tester repeatedly relying on short drift attempts without stable staged feedback, demonstrating why the feature required probing beyond the visible/manual guidance.
- Severity: Medium
- Status: Open
- Classification: readability/usability
- Repro steps: Use only the README/manual plus visible HUD to attempt a charged drift through the opening bend.
- Expected behavior: The player can understand timing and charge from visible feedback without hidden route/input knowledge.
- Actual behavior: The route remains readable, but the drift system does not provide enough stable visible feedback to teach when a drift will progress from Early to Ready/Strong before being cut.
- Evidence: `expected-flow.md`, drift probe screenshots.

## Readability / Usability Gate

FAIL

The route itself remains readable: CP1 is ahead, HUD/minimap/road alignment agree, and drift particles/HUD do not obscure gates, finish, minimap, road edges, or obstacles. The gate fails because the drift system requires probing beyond what the manual and visible feedback explain. The manual promises Early/Ready/Strong charge and release boost, but normal black-box attempts exposed only Early/build and Cut/Idle behavior.

## Regression Checklist

- Hosted game loads: PASS
- README/manual loads and matches visible controls: PASS
- Title/start flow: PASS
- Steering/acceleration: PASS
- Brake/reverse: PASS by documented control availability; no regression observed in driving probes
- Heading-up route/minimap clarity: PASS
- CP1 -> CP2 -> CP3 -> finish: PASS
- `LAP 0/1` start and `LAP 1/1` completion: PASS
- Final time / Race Complete screen: PASS
- Existing boost pads remain visible: PASS
- Obstacles remain visible/readable: PASS
- Restart: PASS
- Runtime errors / softlocks: PASS
- Drift start condition: PASS
- Drift staged charge: FAIL
- Drift release boost: FAIL
- Drift cancellation/weakening on wall scrub: PASS
- Drift effects preserve route readability: PASS with drift-feedback caveat

## Final Approval Statement

Upgrade Phase A is not approved. Required evidence files exist, and prior race behavior largely remains intact, but the phase must remain FAIL until the drift system exposes the documented Ready/Strong charge stages and a clear release boost in normal black-box play.

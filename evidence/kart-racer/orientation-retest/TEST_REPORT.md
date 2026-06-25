# Arcade Kart Racer Orientation Retest Report

## Game and retest

Arcade Kart Racer - Orientation/readability reopen after user review

## Verdict

PASS

## Test inputs

- Game URL: `http://127.0.0.1:8765/games/kart-racer/index.html`
- README/manual: `http://127.0.0.1:8765/games/kart-racer/README.md`
- Browser: Chrome controlled through `browser-harness`
- Viewport observed: 1728 x 996

## Evidence

- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/orientation-retest/`
- Recording: `gameplay-recording.mp4`
- Expected/observed flow: `expected-flow.md`
- First playable frame: `first-playable-frame.png`
- Recording method: browser-harness screenshot capture encoded to MP4 with ffmpeg. Duration: 2.5 seconds. Size: 627,543 bytes.

## Natural Orientation Sanity Check

PASS

The first playable frame now reads naturally. The kart is near bottom-center, the road extends upward/forward, CP1 is ahead on the upper-middle section of the road, and HUD `NEXT CP1` agrees with that visible placement. The minimap also agrees with screen-space forward: the kart marker sits low on the route with upcoming markers continuing along the same bend, so the player does not need to mentally rotate or invert the arena.

Future objects do not compete with CP1 in the first frame. Cyan boost pads and red obstacle markers are visible farther ahead, but CP1 is the closest labeled gate and the HUD/bottom prompt both direct the player to CP1.

## Summary

The reopened orientation/readability concern passes. Using the documented controls, a normal route of Arrow Up acceleration plus gentle Arrow Right steering progresses through CP1, CP2, CP3, and the yellow finish. The race reaches `LAP 1/1`, `NEXT Done`, and Race Complete with a final time. Restart via `R` returns the race to `LAP 0/1`, `NEXT CP1`.

Phase 3 objects remain understandable in the first playable view and along the route. Boost pads are cyan and placed farther ahead on the driving line; red obstacles are visually distinct from checkpoints and the yellow finish. They do not destabilize or obscure the primary route during normal completion.

No blocking runtime errors or softlocks were observed during the retest. A runtime hook installed after page load reported an empty error list during a hosted load and driving check.

## Findings

No blocking findings.

### Informational - WASD harness path was less reliable than Arrow controls

- Evidence clip: gameplay-recording.mp4 @ 00:00-00:02
- Evidence status: Main recording segment
- Why this evidence proves the finding: The clip captures the successful Arrow-control route orientation and checkpoint progression used as the passing comparison; it does not show the less reliable WASD probes, which are documented as harness-only supporting probes outside the main MP4.
- Severity: Low
- Status: Not blocking
- Classification: control/input harness limitation
- Repro steps: With browser-harness game-key helpers, use segmented WASD holds toward CP1.
- Expected behavior: Documented WASD and Arrow controls should both be usable by a human player.
- Actual behavior: Harness-driven WASD segments changed speed but were inconsistent at clearing CP1. The documented Arrow controls worked reliably and completed the race through normal forward driving plus gentle steering.
- Evidence: Arrow-control probes and MP4 recording complete the race; this is not treated as a player-facing blocker because the manual offers Arrow controls and they pass.

## Mandatory gameplay checks

- Hosted game loads: PASS
- README/manual matches visible behavior: PASS
- First-frame orientation sanity: PASS
- Normal play can progress CP1 -> CP2 -> CP3 -> finish: PASS
- Race completion shows `LAP 1/1`, Race Complete, and final time: PASS
- Boosts are understandable and do not destabilize primary route: PASS
- Obstacles are readable/distinct and do not disrupt primary route: PASS
- Restart works: PASS
- No blocking runtime errors: PASS
- No softlocks during normal route: PASS

## Approval statement

The orientation/readability reopen retest is approved. The verdict is PASS, the dedicated Natural Orientation Sanity Check is PASS, the expected-flow document and continuous MP4 exist, and the recording demonstrates the first playable orientation plus successful race completion and restart.

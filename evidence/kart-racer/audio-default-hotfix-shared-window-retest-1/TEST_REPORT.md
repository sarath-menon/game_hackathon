# Arcade Kart Racer - Audio Defaults Off / Explicit Opt-In

Verdict: INVALID / SUPERSEDED - SHARED-WINDOW CONTENTION

## Summary

This shared-window retest attempt is invalid and not approved. During the retest, the shared Chrome window became contaminated by concurrent browser-harness activity and switched from Arcade Kart Racer into the Deckbuilder game during the later stale-state portion. The orchestrator then ordered this tester to stop immediately and wait for a serialized fresh handoff.

No PASS verdict is issued. This is not classified as a Kart game failure; it is an environment/test-contention invalidation.

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/kart-racer/index.html`
- README/manual: `/Users/sarathmenon/Documents/game_hackathon/games/kart-racer/README.md`
- Browser policy: shared Chrome window only through browser-harness
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/audio-default-hotfix-shared-window-retest-1`

## Preserved Evidence

Partial artifacts remain in this folder for traceability, but they are not approval evidence:

- `gameplay-recording.mp4` if present
- `hotfix-observations.json` if present
- `recording-meta.json` if present
- `probes/`
- `recording-frames/`

## Preliminary Observations Before Invalidation

Early observations in the shared-window attempt showed Kart audio defaults behaving as expected before the contamination point: fresh settings displayed `UI sounds` off and `Volume` at `0%`, pre-opt-in start/driving recorded no generated-audio events, explicit opt-in could enable UI sounds at nonzero volume, and reset defaults returned audio controls to off/0.

Because the same run later switched to another game tab, these observations must be retested in a clean serialized run before approval.

## Findings

### ENV-001 - Shared-Window Contention Contaminated Test Surface

- Evidence clip: gameplay-recording.mp4 @ 00:00-00:15
- Evidence status: Main recording segment
- Why this evidence proves the finding: The recording starts on the Kart title/settings/race surface, then later shows a different game/settings surface, proving the attempt's captured test surface was contaminated and cannot approve Kart.
- Severity: High
- Status: Open for this attempt
- Classification: environment / test harness contention
- Repro steps: Run Kart shared-window retest while another browser-harness gameplay test can still affect the same shared Chrome window.
- Expected: All evidence is captured from the Arcade Kart Racer URL only.
- Actual: Later evidence captured the Deckbuilder settings surface instead of Kart.
- Evidence: Preserved probe screenshots and recording artifacts in this folder.

## Audio-Default Approval Statement

Not approved in this attempt. Retest is required in a fresh evidence folder after the orchestrator confirms no other browser-harness gameplay test is active.

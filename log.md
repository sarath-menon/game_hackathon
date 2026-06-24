# Signal Runner Project Log

This log records the important project decisions and milestone state so a fresh main agent can resume without chat history. The canonical operating protocol remains `AGENTS.md`.

## 2026-06-24

### Project Started

- Game selected: **Signal Runner**, a single-file HTML canvas game.
- Core concept: pilot a courier drone through a city-grid network, avoid obstacles, use switches/gates in later milestones, and deliver packets before time runs out.
- Constraint: the game must remain a single self-contained HTML file.
- Current game artifact: `index.html`.
- Player-facing manual: `README.md`.

### Lockstep Process Defined

- Main thread acts only as orchestrator.
- Builder and tester run as separate background threads.
- Builder and tester must never communicate directly.
- All communication must flow through the main orchestrator.
- Tester receives only the game URL and README/manual.
- Tester writes all findings into exactly one report per milestone, colocated with that milestone's evidence folder.
- A milestone advances only after tester PASS and orchestrator acceptance.

### Background Threads Created

- Builder thread: `019ef904-9758-7582-a5c6-cc57eae0f91e`.
- Tester thread: `019ef904-9a30-72e0-9b9c-3de9c6f94bf4`.
- Monitor automation: `signal-runner-lockstep-monitor`, scheduled every 10 minutes.

### Protocol Consolidated

- Initial protocol was written in `LOCKSTEP_PROTOCOL.md`.
- Protocol was later converted into canonical repo-level `AGENTS.md`.
- `LOCKSTEP_PROTOCOL.md` was removed to avoid duplicate sources of truth.
- `AGENTS.md` contains the full resume protocol, thread IDs, local URL, handoff packet rules, milestones, approval criteria, and current state.

### Local Hosting

- The game is served locally from `/Users/sarathmenon/Documents/game_hackathon`.
- Current local game URL: `http://127.0.0.1:8765/index.html`.
- Current local manual URL: `http://127.0.0.1:8765/README.md`.
- Restart command if needed:

```sh
python3 -m http.server 8765 --bind 127.0.0.1
```

### Milestone 1 Built

- Builder produced `index.html` and `README.md`.
- Milestone 1 scope:
  - title/start screen
  - canvas playfield
  - keyboard movement
  - wall and boundary collision
  - one visible delivery target, Dock 01
  - delivered/win state when the target is reached

### Milestone 1 Tested

- Tester completed black-box testing using the hosted URL and README/manual.
- `evidence/milestone-1/TEST_REPORT.md` verdict: `PASS`.
- Verified:
  - game loads
  - title/start flow works
  - Arrow keys and WASD work
  - wall and boundary collision work
  - Dock 01 is visible and reachable
  - delivered/win state triggers correctly
  - README/manual matches observed behavior

### Browser Automation Decision

- Tester initially struggled with browser input efficiency.
- Protocol was updated: tester must not use Codex native browser use.
- If browser support is blocked, tester must modify or repair the browser harness instead.
- Tester modified the browser-harness agent helper outside this repo to send correct game-style keyboard events through CDP.

### Evidence Requirement Added

- Protocol was updated to require an evidence folder for each approved milestone.
- Each evidence folder must contain:
  - a continuous gameplay screen recording
  - a markdown description of what is expected to happen in the recording
- For Milestone 1, tester created:
  - `evidence/milestone-1/gameplay-recording.mp4`
  - `evidence/milestone-1/expected-flow.md`
- The Milestone 1 report now lives at `evidence/milestone-1/TEST_REPORT.md` and references the evidence folder.
- Generated video files and raw frame dumps are intentionally ignored by git. The markdown description is intended to remain trackable.

### Continuous Recording Requirement

- The initial Milestone 1 evidence video was assembled from sparse browser-harness screenshots and looked jumpy.
- Protocol was tightened: evidence videos must show smooth continuous gameplay, not sparse checkpoint frames.
- Tester must regenerate Milestone 1 evidence using continuous capture at a fixed cadence, preferably at least 10 FPS, and update `evidence/milestone-1/TEST_REPORT.md` with the recording method.

### Test Report Location Changed

- The root `TEST_REPORT.md` was moved into the Milestone 1 evidence folder.
- Root-level progress and decisions are tracked in this `log.md`.
- Future milestones should use `evidence/milestone-N/TEST_REPORT.md`, plus the recording and expected-flow markdown in the same folder.

### Git State

- Initial committed baseline: `3a263ae Add Signal Runner lockstep prototype`.
- That commit included `AGENTS.md`, `README.md`, `TEST_REPORT.md`, and `index.html`.
- Later uncommitted changes include the relocated Milestone 1 test report, evidence description, generated evidence artifacts, ignore rules, and this log.

## Resume Checklist

1. Read `AGENTS.md`.
2. Read this `log.md`.
3. Check `git status --short`.
4. Verify local server: `curl -I http://127.0.0.1:8765/index.html`.
5. Read the active milestone report, currently `evidence/milestone-1/TEST_REPORT.md`.
6. If Milestone 1 evidence is complete and accepted, ask the user whether to proceed to Milestone 2.

# Signal Runner Project Log

This log records the important project decisions and milestone state so a fresh main agent can resume without chat history. The canonical operating protocol remains `AGENTS.md`.

## 2026-06-24: Project Goal Replaced

The user replaced the original single-game Signal Runner goal with the **Three-Game Lockstep Build/Test Suite**.

Signal Runner artifacts and evidence are now historical only. Do not continue Signal Runner milestones unless the user explicitly restores that goal.

The active project is now a nine-phase suite across three single-file HTML games:

1. Arcade Kart Racer
2. Side-Scrolling Platformer
3. Turn-Based Deckbuilder

The lockstep process remains unchanged:

- Main agent is the only orchestrator.
- Builder and tester threads must not communicate directly.
- Builder receives scoped phase goals from the orchestrator.
- Tester receives only hosted game URL, README/manual, and evidence/report paths.
- Tester writes findings only to the active phase evidence folder.
- A phase passes only with `TEST_REPORT.md`, `expected-flow.md`, and `gameplay-recording.mp4`.

Active phase:

- Game: Arcade Kart Racer
- Phase: Phase 1, Basic Drivable Track
- Planned game path: `games/kart-racer/index.html`
- Planned manual path: `games/kart-racer/README.md`
- Planned evidence folder: `evidence/kart-racer/phase-1/`
- Planned local game URL: `http://127.0.0.1:8765/games/kart-racer/index.html`
- Planned local manual URL: `http://127.0.0.1:8765/games/kart-racer/README.md`

The old Signal Runner tester was instructed to stop Milestone 2 testing and stand by for the new suite handoff.

### Per-Game Thread Pattern Adopted

The user decided the best implementation pattern is a separate builder/tester pair for each game, reused across that game's phases. This avoids cross-genre context mixing while preserving one main orchestrator.

Active thread pairs:

- Kart builder: `019ef96d-c407-7be3-9934-6595866643ee`
- Kart tester: `019ef96d-ef59-7d20-9dbe-b5d06edc720f`
- Platformer builder: `019ef96e-1dd7-7f13-91d4-855909736edc`
- Platformer tester: `019ef96e-42e6-7121-b9ea-bf266ce55a2e`
- Deckbuilder builder: `019ef96e-7780-7763-b444-12cf7698a97a`
- Deckbuilder tester: `019ef96e-99ee-7f62-b4d2-7d2c3cd29217`

All three Phase 1 builder goals were started:

- Kart Phase 1: Basic Drivable Track
- Platformer Phase 1: Core Movement
- Deckbuilder Phase 1: Basic Card Combat

The three tester threads are on standby. Each tester must wait for the orchestrator's explicit handoff with only URL, README/manual, and evidence paths.

Proactive orchestration rule:

- When a builder finishes, immediately hand that game to its tester.
- When a tester reports `PASS`, immediately start that same game's next phase builder goal unless the user pauses.
- When a tester reports `FAIL`, immediately summarize the blocker and send a narrow fix request to that same game's builder.
- Different game lanes may progress independently, but no single game advances past an unapproved phase.

### Phase 1 Builder Completion And Tester Handoffs

All three Phase 1 builders completed their initial artifacts, and the local server returned `200 OK` for each game and manual URL.

Completed Phase 1 build artifacts:

- Kart: `games/kart-racer/index.html`, `games/kart-racer/README.md`
- Platformer: `games/platformer/index.html`, `games/platformer/README.md`
- Deckbuilder: `games/deckbuilder/index.html`, `games/deckbuilder/README.md`

The orchestrator sent explicit test handoffs to all three matching testers:

- Kart tester handoff:
  - Game URL: `http://127.0.0.1:8765/games/kart-racer/index.html`
  - Manual URL: `http://127.0.0.1:8765/games/kart-racer/README.md`
  - Evidence folder: `evidence/kart-racer/phase-1/`
- Platformer tester handoff:
  - Game URL: `http://127.0.0.1:8765/games/platformer/index.html`
  - Manual URL: `http://127.0.0.1:8765/games/platformer/README.md`
  - Evidence folder: `evidence/platformer/phase-1/`
- Deckbuilder tester handoff:
  - Game URL: `http://127.0.0.1:8765/games/deckbuilder/index.html`
  - Manual URL: `http://127.0.0.1:8765/games/deckbuilder/README.md`
  - Evidence folder: `evidence/deckbuilder/phase-1/`

Current active work is Phase 1 testing for all three games.

### Platformer Phase 1 Approved

The Platformer tester completed black-box testing for **Side-Scrolling Platformer Phase 1: Core Movement** with verdict `PASS`.

Required evidence exists in `evidence/platformer/phase-1/`:

- `TEST_REPORT.md`
- `expected-flow.md`
- `gameplay-recording.mp4`

The orchestrator started **Side-Scrolling Platformer Phase 2: Hazards And Collectibles** on the Platformer builder thread `019ef96e-1dd7-7f13-91d4-855909736edc`.

Kart Phase 1 and Deckbuilder Phase 1 testing remain active.

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

### Milestone 1 Evidence Completed

- Tester produced smooth MP4 evidence using `HTMLCanvasElement.captureStream(30)` plus `MediaRecorder`, then transcoded WebM to MP4/H.264.
- Active evidence artifact: `evidence/milestone-1/gameplay-recording.mp4`.
- Milestone 1 is approved.

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

### Milestone 2 Redefined

- User changed Milestone 2 from the prior core-loop plan to a 3D equivalent of Milestone 1.
- New Milestone 2 scope: same behavior as Milestone 1, but implemented as a 3D game.
- Required behavior:
  - 3D scene
  - player courier drone
  - 3D wall/boundary collision
  - one visible Dock 01 target
  - keyboard movement
  - delivered/win state
  - updated README/manual
  - `evidence/milestone-2/TEST_REPORT.md`
  - `evidence/milestone-2/expected-flow.md`
  - `evidence/milestone-2/gameplay-recording.mp4`
- 3D implementation should use Three.js while preserving the single HTML deliverable.

### Milestone 2 Builder Replacement

- Original builder thread `019ef904-9758-7582-a5c6-cc57eae0f91e` was active but produced no visible progress or artifact changes for Milestone 2.
- Replacement builder thread created: `019ef95a-9fae-7be3-8965-e261781023ab`.
- Use the replacement builder thread for Milestone 2 unless the orchestrator explicitly decides otherwise.

## Resume Checklist

1. Read `AGENTS.md`.
2. Read this `log.md`.
3. Check `git status --short`.
4. Verify local server: `curl -I http://127.0.0.1:8765/index.html`.
5. Read the active milestone report, currently `evidence/milestone-2/TEST_REPORT.md`.
6. If Milestone 2 evidence is complete and accepted, ask the user whether to proceed to Milestone 3.

# Three-Game Lockstep Suite Agent Protocol

This file is the canonical handoff document for the active project in `/Users/sarathmenon/Documents/game_hackathon`. A fresh main agent with no chat history should be able to resume from this file.

## Active Project Goal

Build and test a three-game suite of diverse, single-file HTML games inspired by popular game genres while avoiding copyrighted names, characters, art, music, maps, branding, and other protected assets.

The suite contains:

1. **Arcade Kart Racer**: a mechanics-inspired kart racing game with a 3D track, vehicle control, laps/checkpoints, collisions, boost pads, and race completion.
2. **Side-Scrolling Platformer**: a mechanics-inspired platform game with running, jumping, gravity, platforms, hazards/enemies, collectibles, and a level exit.
3. **Turn-Based Deckbuilder**: a mechanics-inspired card combat game with draw pile, hand, energy, attacks, block, enemy intent, discard, turn transitions, and win/loss.

The previous Signal Runner work is historical only. Do not continue Signal Runner milestones unless the user explicitly restores that goal.

## Current State

- Workspace: `/Users/sarathmenon/Documents/game_hackathon`
- Canonical protocol: `AGENTS.md`
- Project log: `log.md`
- Active suite phases:
  - **Arcade Kart Racer, Phase 1: Basic Drivable Track**
  - **Side-Scrolling Platformer, Phase 1: Core Movement**
  - **Turn-Based Deckbuilder, Phase 1: Basic Card Combat**
- Local server command:

```sh
python3 -m http.server 8765 --bind 127.0.0.1
```

- Kart builder thread: `019ef96d-c407-7be3-9934-6595866643ee`
- Kart tester thread: `019ef96d-ef59-7d20-9dbe-b5d06edc720f`
- Platformer builder thread: `019ef96e-1dd7-7f13-91d4-855909736edc`
- Platformer tester thread: `019ef96e-42e6-7121-b9ea-bf266ce55a2e`
- Deckbuilder builder thread: `019ef96e-7780-7763-b444-12cf7698a97a`
- Deckbuilder tester thread: `019ef96e-99ee-7f62-b4d2-7d2c3cd29217`
- Historical Signal Runner builder threads:
  - `019ef904-9758-7582-a5c6-cc57eae0f91e`
  - `019ef95a-9fae-7be3-8965-e261781023ab`
- Historical Signal Runner tester thread: `019ef904-9a30-72e0-9b9c-3de9c6f94bf4`

## Required Roles

### Main Orchestrator

The main agent is the only orchestrator. It owns scope, sequencing, phase approval, thread isolation, and all communication. It must not build game features and must not perform acceptance testing directly. It sends scoped phase goals to the correct game builder, sends only approved testing inputs to the matching game tester, reads the active phase report, and decides whether a phase is approved or needs another builder pass.

The orchestrator should be proactive. Each game has its own lockstep lane, and those lanes may progress independently. As soon as a builder reports a phase complete, the orchestrator should hand that same game's URL and README/manual to that game's tester. As soon as a tester reports `PASS`, the orchestrator should start that game's next phase builder goal without waiting for unrelated games, unless the user explicitly pauses. As soon as a tester reports `FAIL`, the orchestrator should send a narrow fix request to that game's builder.

### Builder Thread

Each game has a dedicated builder. The builder creates and updates that game's files and player manual only. It reports only to the main orchestrator, and should report immediately when the assigned phase is complete or blocked. It must not communicate with testers or other builders. It must not inspect tester reports or evidence unless the orchestrator explicitly sends a summarized fix request.

### Tester Thread

Each game has a dedicated tester. The tester performs black-box testing only. It receives only the hosted game URL and README/manual from the orchestrator, plus evidence/report output paths. It should report immediately when its test pass is complete or blocked. The tester must not inspect source files, builder notes, git diffs, implementation details, or builder thread summaries.

For browser automation or browser-harness work, the tester must first read and follow:

`/Users/sarathmenon/Documents/startup/image_generation/browser-use-trial/browser-harness/SKILL.md`

The tester must not use Codex native browser use. If browser support is blocked, the tester should modify or repair the browser harness instead.

## Communication Rules

- Builder and tester must never communicate directly.
- The main orchestrator is the only communication hub.
- Builders and testers for different games must not coordinate with each other.
- A builder receives phase goals and orchestrator-summarized fixes only.
- A tester receives only the game URL, README/manual, and required evidence/report paths.
- The tester writes all findings only to that phase's evidence-folder report.
- A phase cannot advance until its report says `PASS`, required evidence exists, and the orchestrator accepts that result.

## Artifact Layout

Game artifacts:

- `games/kart-racer/index.html`
- `games/kart-racer/README.md`
- `games/platformer/index.html`
- `games/platformer/README.md`
- `games/deckbuilder/index.html`
- `games/deckbuilder/README.md`

Evidence artifacts:

- `evidence/kart-racer/phase-1/`
- `evidence/kart-racer/phase-2/`
- `evidence/kart-racer/phase-3/`
- `evidence/platformer/phase-1/`
- `evidence/platformer/phase-2/`
- `evidence/platformer/phase-3/`
- `evidence/deckbuilder/phase-1/`
- `evidence/deckbuilder/phase-2/`
- `evidence/deckbuilder/phase-3/`

Each phase evidence folder must contain:

- `TEST_REPORT.md`
- `expected-flow.md`
- `gameplay-recording.mp4`

Generated videos, raw frames, and transient capture files should stay ignored by git. Markdown reports and expected-flow documents should remain trackable.

## Phase Handoff Packet

For every testing pass, the orchestrator must send the tester one explicit handoff packet containing:

- Game and phase name
- Hosted game URL
- README/manual URL or path
- Evidence folder path
- Exact `TEST_REPORT.md`, `expected-flow.md`, and `gameplay-recording.mp4` paths
- Reminder that source files, builder notes, diffs, implementation details, and builder summaries are out of scope

The tester should remain on standby until this handoff packet is received.

## Lockstep Flow

For each game lane:

1. Orchestrator sends one scoped phase build goal to that game's builder.
2. Builder implements only that phase, updates that game's README/manual, and reports artifacts plus URL to the orchestrator.
3. Orchestrator sends only the hosted game URL and README/manual to that game's tester, plus evidence paths.
4. Tester performs black-box testing and writes only that phase's evidence-folder report.
5. Orchestrator reads the phase report.
6. If the report says `FAIL`, orchestrator summarizes the blocker and sends a narrow fix request to that game's builder.
7. The same phase repeats until approved.
8. After approval, orchestrator immediately starts that game's next phase unless the user explicitly pauses.

The three game lanes may be active at the same time, but no individual game may advance to its next phase until that game's current phase is approved.

## Phase Plan

### Game 1: Arcade Kart Racer

**Phase 1: Basic Drivable Track**
Build a single kart on a simple 3D loop track with start screen, steering, acceleration/brake, track boundaries, and finish line. Tester verifies driving, boundary collision, readable camera, and finish-line reachability.

**Phase 2: Race Rules**
Add checkpoints, lap counting, wrong-way/checkpoint validation, race timer, and completion screen. Tester verifies lap correctness, checkpoint order, timer, and race completion.

**Phase 3: Game Feel**
Add boost pads, obstacle cones/barriers, speed feedback, restart flow, and polish. Tester verifies boosts, obstacle collisions, restart, and stable performance.

### Game 2: Side-Scrolling Platformer

**Phase 1: Core Movement**
Build a side-scrolling level with player movement, jump, gravity, platforms, camera follow, start screen, and level exit. Tester verifies controls, jump feel, platform collision, camera, and exit reachability.

**Phase 2: Hazards And Collectibles**
Add hazards/enemies, collectibles, health/lives or fail state, respawn, and completion summary. Tester verifies damage, collectible counting, respawn, and win/loss behavior.

**Phase 3: Level Polish**
Add moving platforms or simple enemy patrols, checkpoints, clearer level readability, and restart flow. Tester verifies timing interactions, checkpoint behavior, and no softlocks.

### Game 3: Turn-Based Deckbuilder

**Phase 1: Basic Card Combat**
Build a card combat screen with player HP, enemy HP, draw pile, hand, energy, attack/block cards, end turn, enemy attack, and victory/defeat. Tester verifies card play, energy spend, damage/block math, draw/discard flow, and win/loss.

**Phase 2: Tactical Variety**
Add enemy intent, multiple card types, status effects or buffs, and at least two enemy turns. Tester verifies intent accuracy, status effects, card rules, and deterministic outcomes.

**Phase 3: Run Structure**
Add reward choice after combat, deck updates, second encounter, and final victory screen. Tester verifies reward selection, deck persistence, encounter transition, and final completion.

## Tester Report Format

Each phase report must include:

- Game and phase
- Verdict: `PENDING`, `PASS`, or `FAIL`
- Test inputs: URL, README/manual reference, browser, and viewport sizes
- Evidence folder path containing:
  - `gameplay-recording.mp4`
  - `expected-flow.md`
  - recording method, including capture cadence or FPS
- Summary
- Findings with severity, status, repro steps, expected behavior, actual behavior, and evidence
- Readability / route clarity assessment:
  - For spatial games, state whether the camera, labels, minimap, start pose, objective markers, and intended route make the next action visually clear from normal play.
  - For UI/card games, state whether important state, intent, card effects, status effects, and next actions are visually clear from normal play.
  - Ambiguous orientation, off-route labels, misleading minimaps, hidden objective order, or unclear safe/risk paths must be reported even when a functional script can brute-force progress.
- Regression checklist
- Approval statement

## Approval Standard

A phase is approved only when:

- `TEST_REPORT.md` says `PASS`
- `expected-flow.md` exists
- `gameplay-recording.mp4` exists
- The recording shows smooth continuous play rather than sparse checkpoint jumps
- The recording demonstrates the phase's required end state
- No unresolved critical or high-priority findings remain
- Observed behavior matches the README/manual

Ambiguous behavior should be reported as a documentation or design issue.

## Readability And Orientation Gates

Tester approval must include explicit human-readable clarity checks, not only mechanical completion. These checks are black-box and must rely only on the hosted game and README/manual.

- **Arcade Kart Racer:** the start pose, camera, track, checkpoint labels, minimap, and HUD must align so normal forward driving clearly reads as the documented checkpoint order. CP1, CP2, CP3, and the finish must be visibly on the drivable route, readable from the approach direction, and consistent with minimap marker order.
- **Side-Scrolling Platformer:** the safe route, optional risk route, hazards, collectibles, checkpoints, patrols/moving platforms, and exit must be visually distinguishable. A tester should not need source knowledge to understand which path is safe and which path is optional or dangerous.
- **Turn-Based Deckbuilder:** player HP, enemy HP, energy, hand, draw/discard counts, enemy intent, status effects, reward choices, deck changes, encounter number, and final victory/defeat states must be visibly understandable and consistent with the README/manual.

If a phase passes scripted mechanics but fails readability/orientation in a way that could mislead normal black-box play, the tester should report `FAIL` or a finding with enough severity to block approval.

## Current Resume Procedure

1. Read `AGENTS.md`.
2. Read `log.md`.
3. Check `git status --short`.
4. Verify or restart the local server.
5. Read the active builder/tester thread statuses.
6. If the current phase has not been built, send the builder the scoped phase goal.
7. If the builder has reported artifacts and the tester has not received a handoff, send the tester only the URL, README/manual, and evidence paths.
8. If the tester reports `FAIL`, summarize the blocker and send a narrow fix request to the builder.
9. If the tester reports `PASS`, notify the user and move to the next phase only after approval.

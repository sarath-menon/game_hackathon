# Signal Runner Agent Protocol

This file is the canonical handoff document for the Signal Runner lockstep game-generation project. A new main agent with no chat history should be able to resume from this file.

## Current State

- Workspace: `/Users/sarathmenon/Documents/game_hackathon`
- Game file: `index.html`
- Player manual: `README.md`
- Overall progress log: `log.md`
- Current milestone tester report: `evidence/milestone-1/TEST_REPORT.md`
- Canonical protocol: `AGENTS.md`
- Current milestone: **Milestone 1: Skeleton Playable**
- Local game URL: `http://127.0.0.1:8765/index.html`
- Local manual URL: `http://127.0.0.1:8765/README.md`
- Builder thread: `019ef904-9758-7582-a5c6-cc57eae0f91e`
- Tester thread: `019ef904-9a30-72e0-9b9c-3de9c6f94bf4`
- Monitor automation: `signal-runner-lockstep-monitor`

If the local URL is down, restart it from the workspace with:

```sh
python3 -m http.server 8765 --bind 127.0.0.1
```

## Project Goal

Build and test **Signal Runner**, a single-file HTML canvas game. The player pilots a courier drone through a city-grid network, collects data packets, activates signal switches, avoids patrols, and delivers packets before the timer expires. The game must remain self-contained in one HTML file with embedded CSS, JavaScript, and procedural assets.

## Required Roles

### Main Orchestrator

The main agent is the orchestrator only. It owns scope, sequencing, milestone approval, and communication. It must not build game features and must not perform acceptance testing directly. It sends scoped work to the builder, sends only approved testing inputs to the tester, reads the active milestone report in that milestone's evidence folder, and decides whether a milestone is approved or needs another builder pass.

### Builder Thread

The builder creates and updates only the game and player manual. It reports only to the main orchestrator. It must not communicate with the tester. It must not inspect or edit milestone test reports unless the orchestrator explicitly sends a summarized fix request.

### Tester Thread

The tester performs black-box testing only. It receives only the game URL and README/manual from the orchestrator. It must not inspect source files, builder notes, git diffs, or implementation details. All tester feedback for a milestone must be written into exactly one markdown file inside that milestone's evidence folder, for example `evidence/milestone-1/TEST_REPORT.md`.

For browser automation or browser-harness work, the tester must first read and follow:

`/Users/sarathmenon/Documents/startup/image_generation/browser-use-trial/browser-harness/SKILL.md`

The tester must not use Codex native browser use; if browser support is blocked, modify or repair the browser harness instead.
As proof that the game works, each approved milestone must include an evidence folder containing a continuous gameplay screen recording and a markdown description of what is expected to happen during that tested flow.
The gameplay recording must show smooth continuous play, not sparse checkpoint frames; capture at a fixed cadence during movement, preferably at least 10 FPS, and verify the final video shows the full tested flow from start through the required end state.

## Communication Rules

- Builder and tester must never communicate directly.
- The main orchestrator is the only communication hub.
- The tester receives only the URL and README/manual.
- The tester writes all findings into the active milestone's evidence-folder report, for example `evidence/milestone-1/TEST_REPORT.md`.
- The tester must not create scattered notes, inline comments, or separate bug reports.
- The builder may receive summarized findings or exact report excerpts only from the orchestrator.
- A milestone cannot advance until its evidence-folder report says `PASS` and the orchestrator accepts that result.

## Milestone Handoff Packet

For every testing pass, the orchestrator must send the tester one explicit handoff packet containing:

- Milestone name and number
- Game URL to open in the browser
- README/manual path or pasted README/manual content
- Reminder that source files, builder notes, diffs, and implementation details are out of scope
- Required milestone report file, located inside the milestone evidence folder

The tester should remain `PENDING` until this handoff packet is received.

Current Milestone 1 handoff already sent:

- Milestone: `Milestone 1: Skeleton Playable`
- Game URL: `http://127.0.0.1:8765/index.html`
- README/manual: `http://127.0.0.1:8765/README.md` and `/Users/sarathmenon/Documents/game_hackathon/README.md`
- Output file: `/Users/sarathmenon/Documents/game_hackathon/evidence/milestone-1/TEST_REPORT.md`

## Lockstep Flow

1. Orchestrator sends one scoped build goal to the builder.
2. Builder implements that slice, updates `README.md`, and reports artifacts plus URL to the orchestrator.
3. Orchestrator sends only the URL and README/manual to the tester.
4. Tester performs black-box testing and updates only that milestone's evidence-folder report.
5. Orchestrator reads the milestone evidence-folder report.
6. If the report fails, orchestrator sends a scoped fix request to the builder.
7. The same milestone repeats until approved.
8. Only after approval does the orchestrator start the next milestone.

## Milestones

1. **Skeleton Playable:** canvas layout, title/menu, player movement, walls, one delivery target, and working win state.
2. **Core Game Loop:** timer, packet pickup/dropoff, score, restart, and lose condition.
3. **Obstacles and Gates:** patrol enemies, colored signal gates, switches, and collision feedback.
4. **Level Progression:** five levels, increasing difficulty, level completion, and session progression.
5. **Polish and Accessibility:** pause, mute, keyboard support, reduced-motion option, readable contrast, and viewport stability.
6. **Final Regression:** full clean-session playthrough from the README only.

## Tester Report Format

Each milestone report, for example `evidence/milestone-1/TEST_REPORT.md`, must include:

- Current milestone
- Verdict: `PENDING`, `PASS`, or `FAIL`
- Test inputs: URL, README/manual reference, browser, and viewport sizes
- Evidence folder path containing:
  - Continuous gameplay screen recording for the tested flow
  - Markdown description of what is supposed to happen in that recording
  - Recording method, including capture cadence or FPS
- Summary
- Findings with severity, status, repro steps, expected behavior, actual behavior, and evidence
- Regression checklist
- Approval statement

## Approval Standard

A milestone is approved only when that milestone's evidence-folder report says `PASS`, includes an evidence folder path, that folder contains both a continuous gameplay screen recording and an expected-flow markdown description, the recording shows smooth play rather than sparse checkpoint jumps, no unresolved critical or high-priority findings remain, and the game behavior matches `README.md`. Ambiguous behavior should be reported as a documentation or design issue.

## Current Resume Procedure

1. Verify the local server is up with `curl -I http://127.0.0.1:8765/index.html`.
2. Read the tester thread status and the active milestone report, currently `evidence/milestone-1/TEST_REPORT.md`.
3. If the tester is still active and the report is `PENDING`, wait for completion.
4. If the tester reports `FAIL`, summarize the blocking findings and send a narrowly scoped fix request to the builder thread.
5. If the tester reports `PASS`, notify the user that Milestone 1 is approved and ask whether to proceed to Milestone 2.

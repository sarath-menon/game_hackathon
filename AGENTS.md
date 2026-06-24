# Three-Game Lockstep Suite Agent Protocol

This file is the canonical handoff document for the active project in `/Users/sarathmenon/Documents/game_hackathon`. A fresh main agent with no chat history should be able to resume from this file.

## Active Project Goal

Continuously improve the full Game QA Suite across two first-class tracks while avoiding copyrighted names, characters, art, music, maps, branding, and other protected assets.

Track 1 is the three locally built single-file HTML games. Builders keep improving settings, feel, accessibility, visuals, performance, and polish; every change is tested before approval.

Track 2 is the five discovered online browser games. These hosted games are not fixed by this project, but the canonical tester performs industry-style black-box QA on them so the methodology improves across diverse real games.

Each cycle:

- choose either one local-game improvement or one external-game QA target
- for local games, send a scoped upgrade goal to that game's builder, then send the updated URL/manual/evidence paths to the canonical tester after builder completion
- for external games, send only the playable URL/manual/evidence paths to the canonical tester
- require industry-style black-box QA with test cases, severity, regression checks, settings/options checks, accessibility/usability gates, provider/environment classification, browser checks, and continuous gameplay evidence
- route local-game failures back to the relevant builder, then retest
- route external-game provider/environment blockers into alternate reputable URL retries rather than treating setup failure as final game failure
- carry QA methodology lessons from every local and external test into later tests
- update dashboard/log with changes, findings, fixes, QA outcomes, evidence, methodology improvements, and next action
- commit often after coherent verified progress

There is no terminal success condition. Keep improving both the games and the tester unless the user pauses or redirects.

The suite contains:

1. **Arcade Kart Racer**: a mechanics-inspired kart racing game with a 3D track, vehicle control, laps/checkpoints, collisions, boost pads, and race completion.
2. **Side-Scrolling Platformer**: a mechanics-inspired platform game with running, jumping, gravity, platforms, hazards/enemies, collectibles, and a level exit.
3. **Turn-Based Deckbuilder**: a mechanics-inspired card combat game with draw pile, hand, energy, attacks, block, enemy intent, discard, turn transitions, and win/loss.

The previous Signal Runner work is historical only. Do not continue Signal Runner milestones unless the user explicitly restores that goal.

## Current Cycle: Settings Panels And External-Game QA

The current local-game cycle inside the broader continuous-improvement loop is settings quality. Each built game should gain a detailed settings panel that is useful to real players and testable to industry-style QA standards.

Each cycle:

- send a scoped settings-panel goal to that game's builder
- after the builder reports completion, send the updated URL/manual/evidence paths to the single canonical cross-game tester
- require industry-style black-box settings QA with test cases, severity, regression checks, defaults, persistence, reset behavior, edge cases, accessibility/readability controls, responsive layout, browser checks, and continuous gameplay/settings evidence
- route failures back to the builder, then retest
- update dashboard/log as work moves, not only at the end: active goal, selected upgrade, current builder/tester status, pending evidence, completed evidence, fixed feedback, and next action must stay visible in the UI
- treat dashboard freshness as a hard orchestration gate: after a builder handoff, builder completion, tester handoff, FAIL, fix request, retest, PASS closure, or new upgrade selection, the transition is not complete until the dashboard thread has been given the new state and either verified the UI or is actively working on that update
- if the dashboard lags the true project state, prioritize a dashboard-thread refresh before selecting more polish work, so the UI remains the user's source of truth
- commit often after coherent, verified progress

There is no terminal success condition for this loop. Keep improving settings depth, clarity, accessibility, and test coverage unless the user pauses or redirects.

### Required Settings Scope

- **Arcade Kart Racer:** settings for steering/handling sensitivity, acceleration or assist behavior, camera/readability aids, minimap/checkpoint marker visibility, reduced motion/effect intensity, audio/volume if present, persistence, and reset defaults.
- **Side-Scrolling Platformer:** settings for jump assist or forgiveness profile, camera smoothing/lookahead, reduced motion/effects, readability assists, HUD/text sizing, audio/volume if present, persistence, and reset defaults.
- **Turn-Based Deckbuilder:** settings for animation speed, reduced motion, tooltip/detail level, text size, confirm-end-turn or confirm-risky-action behavior, feedback intensity, persistence, and reset defaults.

Tester settings QA must verify that settings are discoverable, documented in the README/manual, actually change visible or mechanical behavior as documented, persist across reloads where documented, reset correctly, remain usable in narrow and desktop viewports, and do not regress already-approved gameplay paths.

## External Browser Game QA Track

The external browser-game QA track is a first-class part of the project, not a side activity. It uses five diverse discovered online browser games to improve the same canonical tester's QA methodology across real hosted games. The tester receives only the game URL, game manual/instructions, and evidence/report paths. It cannot fix hosted games; it only produces industry-style QA reports with findings, severity, reproduction steps, evidence, limitations, and methodology improvements that carry forward to later local and external tests.

Current external games:

- PolyTrack
- OvO
- Cookie Clicker
- Dungeons & Degenerate Gamblers
- Townscaper

External tests must run serially through the canonical tester in the same single shared Chrome window, not in parallel tester threads.

External game reports must distinguish game quality failures from provider or environment blockers:

- `FAIL`: the game is playable enough to evaluate, but fails functional, usability, accessibility, performance, settings, or QA acceptance criteria.
- `BLOCKED_PROVIDER`: the selected provider/URL, portal shell, iframe, startup state, storage state, ad/consent layer, or hosting path cannot reach playable state.
- `BLOCKED_ENVIRONMENT`: the local harness/browser/WebGL/audio/input/storage environment cannot exercise the game reliably.
- `PASS_WITH_FINDINGS`: the game is playable and acceptable with documented nonblocking issues.
- `UNTESTABLE_IN_CURRENT_ENVIRONMENT`: multiple reasonable provider paths were tried and all remained blocked, so no playable path was available in the current environment.

A popular external browser game must not receive final `FAIL` solely because one provider URL, portal wrapper, iframe, startup state, storage state, WebGL path, ad/consent layer, or browser-harness setup prevented testing. If a provider or environment blocks testing, the orchestrator must route a retry plan: find at least two alternate reputable/direct playable URLs or provider paths for the same game where legally accessible, prefer official/direct-hosted URLs over portal wrappers, update or create the player-facing manual for the new path, then hand only the new URL/manual/evidence paths to a tester for a fresh black-box QA attempt. Only after multiple reasonable providers have been tried and all are blocked may the final status become `UNTESTABLE_IN_CURRENT_ENVIRONMENT`, and the report must list every attempted URL, exact blocker, screenshots/recording evidence, and why no playable path was available.

## Current State

- Workspace: `/Users/sarathmenon/Documents/game_hackathon`
- Canonical protocol: `AGENTS.md`
- Project log: `log.md`
- Current phase state:
  - Initial Arcade Kart Racer, Side-Scrolling Platformer, and Turn-Based Deckbuilder phases are complete through Phase 3.
  - The Arcade Kart Racer orientation/readability reopen was fixed and black-box retested as `PASS`.
  - Arcade Kart Racer, Upgrade Phase A: Drift And Boost Feel is closed as `PASS` after Retest 1.
  - The original Phase A report remains preserved as `FAIL` evidence; Retest 1 verifies Early/Ready/Strong stage visibility, visible release boosts, wall-scrub feedback, normal route completion, and readability/usability gate `PASS`.
  - Side-Scrolling Platformer, Upgrade Phase A: Movement Feel Pass is closed as `PASS`.
  - The Platformer upgrade report verifies short-tap versus held-jump readability, jump forgiveness, lower-deck completion, hazard/failure/restart behavior, checkpoint recovery, route readability, and no blocking runtime errors.
  - Required evidence exists at `evidence/platformer/upgrade-phase-a-movement-feel/`: `TEST_REPORT.md`, `expected-flow.md`, and `gameplay-recording.mp4`.
  - Turn-Based Deckbuilder, Upgrade Phase 1: Combat Feedback And Math Preview is closed as `PASS`.
  - Required evidence exists at `evidence/deckbuilder/upgrade-phase-1-combat-feedback/`: `TEST_REPORT.md`, `expected-flow.md`, and `gameplay-recording.mp4`.
  - Current active suite lanes: local settings-panel quality and external browser-game QA methodology.
  - Arcade Kart Racer Settings Panel Phase 1 was superseded by the audio-default hotfix and must be retested through the canonical tester before approval.
  - Arcade Kart Racer settings-depth upgrade is builder-complete and awaiting a future canonical tester handoff after the active Cookie Clicker external QA pass closes. Changed files are `games/kart-racer/index.html` and `games/kart-racer/README.md`; do not mark approved until the canonical tester writes passing evidence.
  - Side-Scrolling Platformer Settings Panel Phase 1 is closed as `PASS`.
  - Turn-Based Deckbuilder Settings Panel Phase 1 is closed as `PASS`; Deckbuilder Settings Panel Polish 1 is also closed as `PASS`.
  - Cross-game audio-default hotfix:
    - Platformer is `PASS` at `evidence/platformer/audio-default-hotfix/`.
    - Deckbuilder shared-window retest is `PASS` at `evidence/deckbuilder/audio-default-hotfix-shared-window-retest-1/`.
    - Kart shared-window retest 1 is invalid/superseded by shared-window contention at `evidence/kart-racer/audio-default-hotfix-shared-window-retest-1/`.
    - Kart retest 2 through the old Kart tester was stopped before browser control.
    - Kart audio-default hotfix single-tester retest 1 through the canonical tester is `FAIL` at `evidence/kart-racer/audio-default-hotfix-single-tester-retest-1/`.
    - Kart builder completed a narrow reset/opt-out audio leak fix after that `FAIL`.
    - Kart audio-default hotfix single-tester retest 2 through the canonical tester is `PASS` at `evidence/kart-racer/audio-default-hotfix-single-tester-retest-2/`.
    - Cross-game audio-default hotfix is now closed for all three local games.
  - Settings and hotfix tester reports are handled only by the single canonical cross-game tester. If a report says `FAIL`, route only the summarized blocker to that game's builder; if it says `PASS` with `TEST_REPORT.md`, `expected-flow.md`, and `gameplay-recording.mp4`, close that phase and select the next highest-impact settings or quality improvement.
  - Browser-game research thread `019efaae-20f8-7473-8e01-69d4ae206994` is used for direct-URL game candidates, alternate provider paths, and settings/options quality references.
  - External browser-game QA:
    - PolyTrack original/Kodub provider failures are reclassified as blocked/needs retry, not game `FAIL`.
    - PolyTrack Poki provider shared-window retry 1 is `BLOCKED_ENVIRONMENT` at `evidence/external/polytrack-poki-shared-window-retry-1/`: provider and in-game menu/settings loaded, but harness targeting did not reliably enter a drivable track.
    - PolyTrack Poki provider shared-window retry 2 is `PASS_WITH_FINDINGS` at `evidence/external/polytrack-poki-shared-window-retry-2/`: provider, menu, track selection, drivable track, keyboard driving, timer/readability, reset, and settings access were verified; remaining findings are nonblocking localization/settings-depth items.
    - OvO original/CrazyGames provider failure is historical blocked evidence only; the later Poki retry reached playable state, so OvO no longer needs a basic provider retry.
    - OvO Classic Poki provider shared-window retry 1 is `PASS_WITH_FINDINGS` at `evidence/external/ovo-poki-shared-window-retry-1/`: provider/menu/playable level, movement, jump, slide/progression to finish area, reset, pause/menu recovery, readability, and short-run performance were verified.
    - Dungeons & Degenerate Gamblers shared-window canonical retry 1 is `PASS_WITH_FINDINGS` at `evidence/external/dungeons-degenerate-gamblers-shared-window-retry-1/`: itch embed launch, main menu, deck selection, tavern/node entry, first table/combat, card-state readability, HIT/STAND feedback, and short-run performance were verified; remaining findings are nonblocking hit-target, settings-depth, and unavailable-action coverage items.
    - Older Dungeons evidence at `evidence/external/dungeons-degenerate-gamblers/` is historical only because it predates the current single shared Chrome window rule and used an isolated browser profile.
    - Cookie Clicker completed as `PASS with limitations`; load, click/purchase loop, Options, save/export, and persistence were verified, with narrow viewport capture limited by the harness.
    - Cookie Clicker deeper settings/persistence/narrow-viewport pass 1 is `PASS_WITH_FINDINGS` at `evidence/external/cookie-clicker-settings-persistence-mobile-pass-1/`: direct provider load, language selection, banner dismissal, click/purchase loop, Options access/scrolling, export-save access, expected-flow, and MP4 evidence were completed; persistence/reload and narrow/mobile remain documented coverage gaps from the interrupted run.
    - Dungeons & Degenerate Gamblers completed as `PASS with nonblocking findings`; launch, run start, deck selection, tavern entry, and first table interaction were verified.
    - Townscaper completed as `PASS WITH FINDINGS`; WebGL load, block placement, URL hash state, camera movement/zoom, and mobile rendering were verified.
    - Townscaper deep settings/removal/mobile pass 1 is `PASS_WITH_FINDINGS` at `evidence/external/townscaper-settings-removal-mobile-pass-1/`: playable WebGL, placement, color selection, removal/undo attempts, gear clicks, camera drag, zoom, mobile viewport, and recording evidence were completed; remaining findings are nonblocking discoverability and subtle-feedback items.
    - Arcade Kart Racer settings-depth retest 1 is `BLOCKED_ENVIRONMENT` at `evidence/kart-racer/settings-depth-retest-1/`: title screen loaded and evidence was captured, but repeated tester-thread/system interruption prevented settings-depth evaluation. This is not a Kart game `FAIL`.
    - Arcade Kart Racer settings-depth retest 2 is `PASS` at `evidence/kart-racer/settings-depth-retest-2/`: title/settings coverage, audio opt-in/reset/defaults, reload persistence, in-race settings pause/close, route readability, drift smoke, restart smoke, expected-flow, and MP4 evidence were completed. The report explicitly notes race coverage was smoke-level, not full lap completion.
    - Side-Scrolling Platformer Settings Polish 2 attempt 1 is `BLOCKED_ENVIRONMENT` at `evidence/platformer/settings-polish-2/`: clean settings/default evidence was captured, but shared-window browser-harness target drifted to dashboard/evidence tabs during gameplay regression. This is not a Platformer game `FAIL`.
    - Side-Scrolling Platformer Settings Polish 2 Retest 1 is `BLOCKED_ENVIRONMENT` at `evidence/platformer/settings-polish-2-retest-1/`: anti-contamination URL check caught target drift to `dashboard.html` before gameplay. This is not a Platformer game `FAIL`.
    - Side-Scrolling Platformer Settings Polish 2 Retest 2 is `FAIL` at `evidence/platformer/settings-polish-2-retest-2/`: the active URL was verified as Platformer, but documented variant controls did not change through normal player interaction. Air Control remained `Steady`; Damage Profile remained `Standard`. This is a Platformer game failure, not an environment blocker.
    - Side-Scrolling Platformer Settings Polish 2 Retest 3 is `FAIL` at `evidence/platformer/settings-polish-2-retest-3/`: Settings now opens at the top, but Air Control and Damage Profile still do not change through normal visible controls, and the documented option buttons are not visible in the rendered Settings panel. This is a Platformer game failure, not an environment blocker.
    - Platformer builder `019ef96e-1dd7-7f13-91d4-855909736edc` completed the stricter follow-up fix: a full-width `Player Variant Controls` block near the top of Settings exposes Air Control and Damage Profile buttons, with builder-reported rendered visibility and click/state/localStorage checks at 1519 x 981.
    - Side-Scrolling Platformer Settings Polish 2 Retest 4 produced a tester `FAIL` at `evidence/platformer/settings-polish-2-retest-4/`, but the orchestrator has not accepted it as final game failure because current source/manual contain `Player Variant Controls` while the browser evidence showed the older layout. Treat this as suspected stale browser content until cache-busted retest resolves it.
    - Side-Scrolling Platformer Settings Polish 2 Retest 5 is `FAIL` at `evidence/platformer/settings-polish-2-retest-5/`: cache-busted URL loaded current UI and verified Player Variant Controls, Snappy/Practice persistence, Reset Defaults, and audio off/default/reset, but closing Settings during a run leaves the HUD at `Settings paused` and gameplay input does not resume.
    - Platformer builder `019ef96e-1dd7-7f13-91d4-855909736edc` completed a narrow in-run Settings resume fix after Retest 5: idempotent `openSettings`, `closeSettings` clears input state, restores non-paused HUD during active runs, clears saved pause snapshot, and resets frame timer before resuming.
    - Side-Scrolling Platformer Settings Polish 2 Retest 6 is `PASS` at `evidence/platformer/settings-polish-2-retest-6/`: the cache-busted URL loaded current UI, Player Variant Controls remained visible/usable, Reset Defaults restored Air `Steady`, Damage `Standard`, audio off, and volume `0%`, and both Escape and Close Settings returned active runs from `Settings paused` to the normal objective. Narrow viewport capture and full route/failure completion are documented nonblocking coverage limitations.
    - Current active external QA handoff: Cookie Clicker Follow-up Pass 2 through the canonical tester, evidence target `evidence/external/cookie-clicker-followup-pass-2/`, using direct URL `https://orteil.dashnet.org/cookieclicker/`. Scope is persistence/reload, narrow/mobile if harness permits, deeper Options/settings coverage, import/reset safety up to non-destructive warning/modality checks, usability/accessibility, and provider/environment classification.
  - The dashboard must reflect the live loop as it changes, including selected-upgrade, builder-active, builder-complete, tester-handoff, tester-active, FAIL, fix-active, retest-pending, retest-active, PASS closure, and next-upgrade selection states.
- QA upgrade artifacts:
  - `qa-upgrade/QA_STANDARDS_PROPOSAL.md`
  - `qa-upgrade/KART_BENCHMARK_AUDIT.md`
  - `qa-upgrade/PLATFORMER_BENCHMARK_AUDIT.md`
  - `qa-upgrade/DECKBUILDER_BENCHMARK_AUDIT.md`
- Local server command:

```sh
python3 -m http.server 8765 --bind 127.0.0.1
```

- Kart builder thread: `019ef96d-c407-7be3-9934-6595866643ee`
- Canonical cross-game QA tester thread: `019ef96e-99ee-7f62-b4d2-7d2c3cd29217`
- Platformer builder thread: `019ef96e-1dd7-7f13-91d4-855909736edc`
- Deckbuilder builder thread: `019ef96e-7780-7763-b444-12cf7698a97a`
- Browser maintenance thread: `019ef9ba-1477-7662-b7a3-c5da570cdb77`
- Dashboard thread: `019ef963-dc84-72f1-9542-1431bafaf31d`
- Browser-game research thread: `019efaae-20f8-7473-8e01-69d4ae206994`
- Deprecated per-game tester threads, kept only for historical evidence and standby unless the user explicitly reactivates them:
  - Kart tester thread: `019ef96d-ef59-7d20-9dbe-b5d06edc720f`
  - Platformer tester thread: `019ef96e-42e6-7121-b9ea-bf266ce55a2e`
- Historical Signal Runner builder threads:
  - `019ef904-9758-7582-a5c6-cc57eae0f91e`
  - `019ef95a-9fae-7be3-8965-e261781023ab`
- Historical Signal Runner tester thread: `019ef904-9a30-72e0-9b9c-3de9c6f94bf4`

## Required Roles

### Main Orchestrator

The main agent is the only orchestrator. It owns scope, sequencing, phase approval, thread isolation, and all communication. It must not build game features and must not perform acceptance testing directly. It sends scoped phase goals to the correct game builder, sends only approved testing inputs to the canonical cross-game tester, reads the active phase report, and decides whether a phase is approved or needs another builder pass.

The orchestrator should be proactive. Each game has its own builder lane, but QA is intentionally centralized into one cross-game tester so its methodology improves across kart, platformer, deckbuilder, and external browser games. As soon as a builder reports a phase complete, the orchestrator should queue that game's URL and README/manual for the canonical tester. As soon as the tester reports `PASS`, the orchestrator should start that game's next phase builder goal without waiting for unrelated builder work, unless the user explicitly pauses. As soon as the tester reports `FAIL`, the orchestrator should send a narrow fix request to that game's builder.

### Builder Thread

Each game has a dedicated builder. The builder creates and updates that game's files and player manual only. It reports only to the main orchestrator, and should report immediately when the assigned phase is complete or blocked. It must not communicate with testers or other builders. It must not inspect tester reports or evidence unless the orchestrator explicitly sends a summarized fix request.

### Canonical Cross-Game Tester Thread

There is one active tester for all built and external games: `019ef96e-99ee-7f62-b4d2-7d2c3cd29217`. The tester performs black-box testing only. It receives only the hosted game URL and README/manual from the orchestrator, plus evidence/report output paths. It should report immediately when its test pass is complete or blocked. The tester must not inspect source files, builder notes, git diffs, implementation details, builder thread summaries, old implementation notes, or unrelated evidence.

This single-tester model is deliberate. The tester must improve its QA methodology across diverse games and carry forward lessons from one genre to the next. Reports should include not only findings and verdicts, but also any methodology improvement that should apply to future settings, gameplay, provider, accessibility, performance, or regression testing.

For browser automation or browser-harness work, the tester must first read and follow:

`/Users/sarathmenon/Documents/startup/image_generation/browser-use-trial/browser-harness/SKILL.md`

The tester must not use Codex native browser use or Codex Computer Use. If browser support is blocked, the tester should modify or repair the browser harness instead.

Hard browser rule: all project browser-harness testing must use one shared Chrome window with controlled tabs; testers must not launch separate Chrome windows/profiles or remote sessions, and must report `BLOCKED_ENVIRONMENT` if shared-window testing is unavailable.

Shared-window browser-harness tests must be serialized by the orchestrator and run through the canonical tester only; do not run two active browser-harness gameplay tests at the same time in the shared Chrome window.

When testing Google AI Studio hosted games, first open the provided AI Studio app URL with browser-harness and inspect whether the actual playable app is embedded in a preview iframe. If an iframe points to a hosted preview origin such as a `run.app` URL, open that preview URL directly in a new browser-harness tab and test the game there as the black-box surface. Do not assume the lobby, room, create/join, start, or multiplayer flow is reusable across apps; those controls are app-specific and must be discovered from the visible UI and any user-provided manual. Reusable checks are only: confirm the AI Studio page or direct preview loads without an auth wall, identify the real playable surface, focus the game canvas or interactive area, use visible controls/documented keys through browser-harness, and stop for user help if Google login, permissions, or unavailable preview errors block access.

### Browser Maintenance Thread

The browser maintenance thread keeps browser-harness and Chrome state from accumulating stale tabs. It reports only to the main orchestrator and must not communicate with builders or testers. It must not modify game files, manuals, protocol docs, dashboard files, or evidence reports unless the orchestrator explicitly asks.

Cleanup policy:

- Close stale browser-harness/Chrome tabs related to this project, including old dashboard, game, manual, evidence, duplicate, completed probe, or idle test-attempt tabs.
- Keep project browser usage consolidated in one shared Chrome window with controlled tabs; close duplicate or isolated Chrome windows/profiles when clearly stale or unauthorized.
- Preserve any tab that may be part of an active current test run or active recording.
- If uncertain whether a tab is active, leave it open and report it as skipped.
- Do not use Codex native browser use.
- If browser-harness work is needed, first read and follow `/Users/sarathmenon/Documents/startup/image_generation/browser-use-trial/browser-harness/SKILL.md`.
- Do not kill the local HTTP server unless explicitly instructed.

When browser cleanup is needed, the orchestrator should use the browser maintenance thread and avoid overlapping cleanup passes. On each maintenance pass, the orchestrator should check whether the maintenance thread is idle; if it is idle, send a cleanup prompt, and if it is active, avoid starting another cleanup.

### Dashboard Thread

The dashboard thread owns dashboard UI updates and reports only to the main orchestrator. It must not communicate with builders or testers and must not modify game files or tester evidence.

The dashboard is the live project control surface, not a historical archive. Whenever the main goal changes, a new upgrade is selected, a builder starts or finishes, a tester handoff is sent, a tester reports `FAIL`, a fix request is routed, a retest starts, a phase closes `PASS`, or the next action changes, the orchestrator must send the dashboard thread a same-turn update. That update must ask the dashboard thread to verify the visible first viewport and the relevant evidence drawer when no canonical tester browser run is active. The next orchestration transition should wait until the dashboard is verified or visibly marked as updating.

Dashboard updates must not use browser-harness, open Chrome tabs, or run rendered browser verification while the canonical tester is active or about to start a retry. During active QA, dashboard updates are static-only: file edits, HTTP checks, JavaScript syntax checks, and link checks. Browser-harness dashboard verification can resume only after the canonical tester is idle.

The dashboard should make the lockstep process auditable. In addition to phase status, evidence videos, and inline `TEST_REPORT.md` rendering, it should show a feedback/fix tracker that links tester feedback to the builder's next fix iteration and the later retest status. Each tracked item should identify:

- tester blocker or feedback summary
- builder fix summary from the next iteration
- current status: fixed, still open, retesting, or superseded
- related phase report path
- related evidence/video state when present

## Communication Rules

- Builder and tester must never communicate directly.
- The main orchestrator is the only communication hub.
- Builders and testers for different games must not coordinate with each other.
- A builder receives phase goals and orchestrator-summarized fixes only.
- A tester receives only the game URL, README/manual, and required evidence/report paths.
- The tester writes all findings only to that phase's evidence-folder report.
- A phase cannot advance until its report says `PASS`, required evidence exists, and the orchestrator accepts that result.
- Old per-game tester threads are historical/standby only. Do not send new QA handoffs to them unless the user explicitly changes the model.

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
- For spatial games, a reminder that readability/orientation is a blocking criterion, including first-action clarity, route alignment, sequential objective discoverability, and blocker classification.
- For UI/card games, a reminder that state/action clarity is a blocking criterion, including visibility of current state, available actions, consequences, intent, and end states.
- Reminder that source files, builder notes, diffs, implementation details, and builder summaries are out of scope

The tester should remain on standby until this handoff packet is received.

## Lockstep Flow

For each game lane:

1. Orchestrator sends one scoped phase build goal to that game's builder.
2. Builder implements only that phase, updates that game's README/manual, and reports artifacts plus URL to the orchestrator.
3. Orchestrator sends only the hosted game URL and README/manual to the canonical cross-game tester, plus evidence paths.
4. The canonical tester performs black-box testing and writes only that phase's evidence-folder report.
5. Orchestrator reads the phase report.
6. If the report says `FAIL`, orchestrator summarizes the blocker and sends a narrow fix request to that game's builder.
7. The same phase repeats until approved.
8. After approval, orchestrator immediately starts that game's next phase unless the user explicitly pauses.

The three builder lanes may be active at the same time, but browser-harness QA runs must be serialized through the canonical tester in the single shared Chrome window. No individual game may advance to its next phase until that game's current phase is approved.

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
  - This section is mandatory and must have an explicit `PASS` or `FAIL`.
  - For spatial games, state whether the camera, labels, minimap, start pose, objective markers, and intended route make the next action visually clear from normal play.
  - For UI/card games, state whether important state, intent, card effects, status effects, and next actions are visually clear from normal play.
  - Ambiguous orientation, off-route labels, misleading minimaps, hidden objective order, or unclear safe/risk paths must be reported even when a functional script can brute-force progress.
  - If an objective cannot be completed, classify the likely blocker as mechanical, collision/trigger, control/input, readability/orientation, documentation/manual mismatch, or unknown.
  - If completion required repeated probing, hidden knowledge, or a route found only by scripted search, explain why normal black-box play would or would not discover it.
- Regression checklist
- Approval statement

## Approval Standard

A phase is approved only when:

- `TEST_REPORT.md` says `PASS`
- `expected-flow.md` exists
- `gameplay-recording.mp4` exists
- The recording shows smooth continuous play rather than sparse checkpoint jumps
- The recording demonstrates the phase's required end state
- The mandatory readability/orientation or state/action clarity gate says `PASS`
- No unresolved critical or high-priority findings remain
- Observed behavior matches the README/manual

Ambiguous behavior should be reported as a documentation or design issue.

## Readability And Orientation Gates

Tester approval must include explicit human-readable clarity checks, not only mechanical completion. These checks are black-box and must rely only on the hosted game and README/manual.

This is a hard approval gate. A phase cannot pass if the tester can complete it only through repeated trial-and-error, hidden implementation knowledge, or a scripted route that is not understandable from visible in-game cues and the README/manual.

The tester must evaluate these items before assigning `PASS`:

1. **First-action clarity:** from the start or reset state, the next intended action/direction is visually obvious.
2. **Route/state alignment:** camera, labels, arrows/markers, minimap, HUD text, and world layout agree on the next objective or action.
3. **Sequential discoverability:** after each required objective/action, the next required objective/action becomes visually reachable and understandable.
4. **Approach readability:** required gates, hazards, platforms, cards, targets, or buttons are readable from the direction/state where the player naturally encounters them.
5. **Natural orientation sanity check:** for spatial games, screen-space forward, camera heading, minimap orientation, world labels, and HUD objective order must agree without the player needing to mentally rotate or invert the arena. A route that is only understandable after scripted probing or after learning an inverted minimap/camera relationship must fail this gate.
6. **Failure diagnosis:** if progress blocks, the tester must classify the blocker as mechanical, collision/trigger, control/input, readability/orientation, documentation/manual mismatch, or unknown.
7. **Evidence:** `expected-flow.md` must describe the intended visible flow step by step. For spatial games it must include a frame/screenshot list or timestamp list showing the route from start to required end state, including the start/reset view and a note on whether the visible forward direction, minimap, labels, and next objective agree. For UI/card games it must include the expected visible state transitions.

- **Arcade Kart Racer:** the start pose, camera, track, checkpoint labels, minimap, and HUD must align so normal forward driving clearly reads as the documented checkpoint order. CP1, CP2, CP3, and the finish must be visibly on the drivable route, readable from the approach direction, and consistent with minimap marker order. The tester must explicitly judge whether the first player-facing view feels upside down, inverted, or rotated relative to the expected route; if yes, the phase fails even if a scripted route can complete.
- **Side-Scrolling Platformer:** the safe route, optional risk route, hazards, collectibles, checkpoints, patrols/moving platforms, and exit must be visually distinguishable. A tester should not need source knowledge to understand which path is safe and which path is optional or dangerous.
- **Turn-Based Deckbuilder:** player HP, enemy HP, energy, hand, draw/discard counts, enemy intent, status effects, reward choices, deck changes, encounter number, and final victory/defeat states must be visibly understandable and consistent with the README/manual.

If a phase passes scripted mechanics but fails readability/orientation or state/action clarity in a way that could mislead normal black-box play, the tester must report `FAIL` or a high-priority blocking finding.

## Current Resume Procedure

1. Read `AGENTS.md`.
2. Read `log.md`.
3. Check `git status --short`.
4. Verify or restart the local server.
5. Read the active builder statuses and the canonical cross-game tester status.
6. If the current phase has not been built, send the builder the scoped phase goal.
7. If the builder has reported artifacts and the tester has not received a handoff, send the tester only the URL, README/manual, and evidence paths.
8. If the tester reports `FAIL`, summarize the blocker and send a narrow fix request to the builder.
9. If the tester reports `PASS`, notify the user and move to the next phase only after approval.

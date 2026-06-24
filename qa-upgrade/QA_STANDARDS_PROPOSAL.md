# QA Standards Proposal For Three-Game Lockstep Suite

## Executive Summary

This project already has the right operating model for small browser games: isolated builders, isolated black-box testers, explicit evidence folders, and phase approval only after `PASS` plus playable recording evidence. The main QA gap is consistency. Current reports include the right ingredients, but each tester formats and scopes them slightly differently. Some reports also bury or omit explicit readability/state-clarity gates, which are already defined as hard approval criteria in `AGENTS.md`.

The recommended upgrade is to formalize a lightweight release QA process around six gates:

1. Build acceptance: the game and README/manual load from the hosted URL.
2. Smoke acceptance: the start flow, primary inputs, reset/restart, and one happy path work.
3. Phase functional acceptance: all phase-specific mechanics work as documented.
4. Human clarity acceptance: spatial route readability or UI/card state clarity explicitly passes.
5. Regression acceptance: prior phase behavior and known fixed findings remain fixed.
6. Evidence acceptance: report, expected-flow, and smooth continuous MP4 prove the pass.

This proposal adapts common game QA and software testing practices to the project's actual constraints: single-file HTML games, browser-harness black-box testing, per-game lockstep lanes, and three compact genres. It avoids heavyweight release bureaucracy, but adds enough rigor to make each `PASS` auditable and repeatable.

## Research Basis

The proposal is based on these sources and adapted to this project rather than copied wholesale:

- ISTQB Certified Tester Game Testing overview: game testing includes risk, goals, mechanics, graphics, sound, level testing, controllers, localization, tools, and test execution. Source: https://istqb.org/certifications/certified-tester-game-testing-ct-game/
- ISTQB Foundation Level syllabus: defect fixes require confirmation testing and regression testing; impact analysis determines the regression scope. Source: https://istqb.org/wp-content/uploads/2024/11/ISTQB_CTFL_Syllabus_v4.0.1.pdf
- ISTQB Certified Tester Game Testing syllabus: game-specific defect areas include mechanics, graphics, animation, sound, levels, controllers, performance, compatibility, and localization. Source: https://istqb.org/wp-content/uploads/2024/11/ISTQB_CT_GaMe_Syllabus_v1.0.1_LtrKuyi.pdf
- Unity QA best practices: QA should run throughout development, include manual and automated methods, catch bugs, visual artifacts, UX issues, crashes, and test across target devices and screen sizes. Source: https://unity.com/how-to/testing-and-quality-assurance-tips-unity-projects
- Microsoft Xbox Accessibility Guideline 103: key gameplay information should not depend on only one sensory channel, and color-only cues can block players with low vision or color vision deficiency. Source: https://learn.microsoft.com/en-us/xbox/accessibility/xbox-accessibility-guidelines/103
- Game Accessibility Guidelines: recommend simple controls, avoid mandatory complex simultaneous input, avoid flicker, provide clear language, readable text, reminders of controls/objectives, and clearly indicated interactive elements. Source: https://gameaccessibilityguidelines.com/full-list/
- WCAG 2.2: useful browser UI criteria include focus order, focus visible, labels/instructions, consistent identification, and error identification. Source: https://www.w3.org/TR/WCAG22/
- web.dev Web Vitals: web UX performance should consider loading, interactivity, and visual stability, with LCP, INP, and CLS as standard web-facing metrics. Source: https://web.dev/articles/vitals
- MDN Gamepad API: browser games may support controllers, but support varies and the focused page receives gamepad events. Source: https://developer.mozilla.org/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API
- OWASP Web Security Testing Guide input validation: even simple browser apps should treat externally supplied or user-controlled input as a risk surface. Source: https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/README
- W3C Internationalization Quick Tips: declare UTF-8, declare language, separate presentation from content, write concise text, avoid fragile string composition, and consider RTL/local formats. Source: https://www.w3.org/International/quicktips/

## QA Principles For This Project

### 1. Black-Box Means Player-Facing

Testers must validate only what a player could observe from:

- hosted game URL
- README/manual URL or path
- visible game UI
- browser console/runtime errors
- browser behavior at tested viewports

Testers must not inspect game source, diffs, builder notes, implementation logs, or builder summaries. If the tester can only pass a route by knowing implementation details, the pass is invalid.

### 2. Phase Acceptance Is More Than Mechanical Completion

For these games, a phase can be mechanically completable and still fail QA. A tester must fail a phase if normal player-facing cues do not make the required action, route, objective, hazard, card state, or end state understandable.

Examples:

- Kart reaches finish only through scripted coordinate probing, while the minimap appears inverted: fail readability.
- Platformer exit is reachable, but the safe route is visually indistinguishable from a hazard path: fail route clarity.
- Deckbuilder victory is possible, but enemy intent or card consequences are unclear before action: fail state/action clarity.

### 3. Every Fix Requires Confirmation And Targeted Regression

After a builder fix, the tester must:

- confirm the named finding is resolved
- repeat the minimum route needed to prove the phase end state
- run a targeted regression checklist covering behavior likely affected by the fix
- note whether the evidence is new or reused

This follows the standard distinction between confirmation testing and regression testing.

### 4. Automation Supports Testing, But Does Not Replace Human Clarity Review

Browser-harness automation is appropriate for repeatable input, recordings, screenshots, console capture, and viewport sweeps. It must not become the only acceptance signal. Each spatial game requires a human-readable route assessment, and the deckbuilder requires a state/action clarity assessment.

### 5. Reports Must Be Audit-Ready

A future orchestrator should be able to approve or reject a phase by reading only:

- `TEST_REPORT.md`
- `expected-flow.md`
- `gameplay-recording.mp4`
- optional supporting logs/screenshots in the same evidence folder

The report must not require cross-thread chat history.

## Recommended QA Lifecycle

### Before Builder Handoff

The orchestrator should give the builder a phase goal that includes:

- exact phase scope
- player-facing README/manual update requirement
- known previous findings and regressions that must remain fixed
- explicit genre clarity expectations
- any performance or compatibility expectations for this phase

The builder should report only:

- files changed
- hosted URL
- manual URL/path
- player-facing behavior implemented
- known limitations or intentional omissions
- whether the local URL was smoke checked

### Before Tester Handoff

The orchestrator should send one handoff packet with:

- game and phase
- build iteration label, such as `initial`, `retest-1`, `fix-2`
- hosted game URL
- README/manual URL and path
- evidence folder path
- exact report, expected-flow, and recording paths
- previous findings to confirm or regress, summarized without implementation details
- mandatory clarity gate reminder
- allowed browser-harness expectations
- explicit instruction that source, diffs, builder notes, and builder summaries are out of scope

### Tester Execution Sequence

Each test pass should follow this order:

1. Environment setup: open fresh browser-harness target, set viewport, clear stale state if the game uses storage.
2. Load smoke: game URL returns playable surface, README/manual is reachable, no auth wall.
3. Manual alignment: visible title/objective/controls/rules match README/manual.
4. Start flow: from fresh page, player can begin without hidden steps.
5. Core happy path: prove the phase's required success end state.
6. Negative path: try invalid, wrong, or risky action relevant to the phase.
7. Regression path: confirm previous phase mechanics and fixed findings.
8. Clarity gate: evaluate route/state readability from the actual player view.
9. Compatibility sweep: repeat minimal smoke at required viewport sizes.
10. Evidence packaging: write report, expected-flow, recording, and optional logs/screenshots.

### Orchestrator Signoff Sequence

The orchestrator should approve only after checking:

- report verdict is `PASS`
- evidence files exist at exact paths
- MP4 is playable and continuous enough to show actual play
- expected-flow describes visible route/state transitions
- clarity gate is explicit `PASS`
- no critical/high unresolved findings
- README/manual alignment is confirmed
- fix confirmation and regression sections are present when relevant

If any item is missing, return the phase to tester for report/evidence correction, not to builder, unless the missing item reflects a game defect.

## Defect Severity Taxonomy

Use severity for player impact. Use priority only if the orchestrator needs to sequence fixes. Testers assign severity; the orchestrator assigns fix priority.

### Critical

Blocks all meaningful testing or makes the game unusable.

Examples:

- game does not load
- canvas or primary UI is blank
- start flow cannot begin
- primary input is nonfunctional
- crash, unhandled exception, or infinite loop blocks play
- phase success state is impossible to reach
- data/state corruption prevents restart or retest

Gate: any unresolved critical finding requires `FAIL`.

### High

Blocks phase acceptance, required end state, required mechanic, or hard readability/state clarity gate.

Examples:

- finish/exit/victory cannot be reached through documented play
- checkpoint/lap/damage/card math is wrong for required phase mechanics
- player can softlock
- controls are misleading or undocumented
- route/objective/state clarity fails
- completion requires hidden knowledge or repeated brute-force probing
- recording cannot demonstrate required end state

Gate: any unresolved high finding requires `FAIL`.

### Medium

Materially degrades play, reliability, compatibility, documentation, or polish, but does not block the phase end state.

Examples:

- intermittent collision inconsistency
- HUD count briefly desyncs but corrects
- one tested viewport has layout crowding while primary viewport remains playable
- unclear but nonessential manual wording
- minor performance hitch that does not affect core play

Gate: medium findings may pass only if they are documented, non-regressing, and not part of the current phase acceptance criteria.

### Low

Cosmetic, minor clarity, or polish issue with no meaningful gameplay risk.

Examples:

- overlay background shows dimmed old HUD
- harmless console warning
- visual alignment imperfection
- small wording inconsistency that does not mislead play

Gate: low findings may pass if documented.

### Severity Modifiers

Add modifiers when useful:

- `Intermittent`: not always reproducible but observed in evidence.
- `Viewport-specific`: only happens at a named viewport.
- `Documentation mismatch`: implementation may be valid, but README/manual misleads the tester.
- `Accessibility blocker`: color-only, focus, text, input, or flicker issue materially blocks use.
- `Regression`: behavior passed before and now fails.

## Defect Report Requirements

Each finding should include:

- ID: stable within game and phase, such as `KART-P2-003`
- Title
- Severity: `Critical`, `High`, `Medium`, or `Low`
- Status: `Open`, `Resolved`, `Retest Passed`, `Retest Failed`, `Deferred`, or `Superseded`
- Category: one of the taxonomy categories below
- Repro rate: `Always`, `Often`, `Intermittent`, `Once`, or `Unknown`
- Tested environment: browser, viewport, URL, pass label
- Repro steps
- Expected behavior
- Actual behavior
- Player impact
- Evidence reference: timestamp, screenshot, console log, or report section
- Blocker classification if the phase cannot complete
- Retest notes if relevant

### Defect Categories

Use these categories to make reports searchable:

- `Load/Launch`
- `Input/Controls`
- `Core Mechanics`
- `Physics/Collision`
- `Camera/Readability`
- `UI/HUD/State`
- `Progression/Completion`
- `Restart/State Reset`
- `Performance`
- `Compatibility/Viewport`
- `Accessibility`
- `Documentation`
- `Localization Readiness`
- `Console/Runtime`
- `Security/Robustness`
- `Evidence/Report`

## Pass/Fail Gates

### Universal Hard Fail Gates

Any of these means `FAIL`:

- game or manual URL unavailable
- game cannot start from a fresh load
- phase-required end state cannot be demonstrated
- mandatory mechanics do not work as described
- critical or high unresolved finding exists
- clarity gate is missing or fails
- evidence files missing or point to wrong paths
- MP4 is not playable, not continuous enough, or does not show the required end state
- README/manual materially contradicts observed behavior
- console/runtime error blocks or corrupts gameplay
- browser-harness could not test and no valid blocker explanation is provided

### Conditional Pass With Findings

`PASS` is allowed with low or medium findings only when:

- the finding does not block the phase objective
- the finding is not part of the phase's explicit acceptance criteria
- the issue is documented with evidence
- the approval statement names the residual risk
- the orchestrator agrees it can be deferred

### Retest Pass Gate

A retest cannot pass unless:

- the original blocker is explicitly listed as resolved
- the tester reproduced the previous failure condition or closest available equivalent
- a fresh evidence recording demonstrates the corrected end state
- targeted regression checks pass
- no new critical/high finding was introduced

## Test Matrix

### Required Browser And Viewport Matrix

Because the games are local browser-based HTML, keep the matrix focused:

| Tier | Browser | Viewport | Required Every Pass | Purpose |
| --- | --- | --- | --- | --- |
| Primary | Chrome via browser-harness | 960x540 or game-native canvas capture | Yes | Main recording and full phase acceptance |
| Desktop Wide | Chrome via browser-harness | about 1280x720 or 1728x996 | Yes | Layout, readability, keyboard flow |
| Compact | Chrome via browser-harness | 800x600 or 768x432 | Smoke only | Text fit, canvas scaling, HUD crowding |
| Tall/Narrow | Chrome via browser-harness | 390x844 or similar | Smoke when UI is responsive | Detect unusable mobile/narrow layouts |
| Secondary browser | Firefox or Safari | one smoke viewport | Optional for phase 1, recommended before final suite signoff | Browser compatibility risk |

Minimum for every phase: Chrome primary full pass plus one compact smoke pass.

Minimum before suite release: Chrome full pass, Chrome compact pass, and one secondary-browser smoke pass per game.

### Input Matrix

| Input Area | Kart Racer | Platformer | Deckbuilder |
| --- | --- | --- | --- |
| Start | keyboard and visible start command | keyboard and visible start command | mouse/click or keyboard-start if supported |
| Primary movement/action | W/A/S/D or arrows, acceleration, brake | left/right, jump, restart | card selection, end turn, restart |
| Invalid input | wrong-way driving, off-track steering, brake/reverse | jump into hazard, miss platform, movement during fail/end | play unaffordable card, end turn with hand, click disabled card |
| Focus | canvas receives input after start | canvas receives input after start | buttons/cards are visibly focusable or clickable |
| Restart/state reset | reload/restart after finish | restart after complete/fail | restart after victory/defeat |
| Simultaneous input | steer while accelerating | hold direction while jumping | not required |

Gamepad is not required unless a phase or manual claims support. If added later, testers should use MDN-compatible expectations: focused page, connect/disconnect recognition, and equivalent action mapping.

### Functional Matrix By Game

#### Arcade Kart Racer

| Area | Phase 1 | Phase 2 | Phase 3 |
| --- | --- | --- | --- |
| Launch/start | title/start begins race | preserved | preserved with restart |
| Driving | accelerate, brake, steer | preserved | speed feedback/polish preserved |
| Camera/readability | readable forward view | checkpoint route clarity | boost/obstacle clarity |
| Track boundaries | stay constrained | preserved through laps | preserved with obstacles |
| Completion | finish reachable | laps/checkpoints/timer completion | restart and polished race completion |
| Negative tests | off-track, brake/reverse | wrong checkpoint/wrong way | obstacle hit, boost approach, restart mid/end |
| Clarity gate | start pose, route, finish | CP order, minimap/HUD alignment | boost/obstacle affordance and performance |

#### Side-Scrolling Platformer

| Area | Phase 1 | Phase 2 | Phase 3 |
| --- | --- | --- | --- |
| Launch/start | title/start begins level | preserved | preserved |
| Movement | run, jump, gravity | preserved | preserved with moving elements |
| Collision | platforms, ground, exit | hazards plus collectibles | moving platforms/patrols/checkpoints |
| Camera | follows player, no blind jumps | hazard/collectible visibility | checkpoint and route readability |
| Completion | exit reachable | completion summary | polished completion/restart |
| Negative tests | fall/miss jump/restart | damage, respawn, health-zero fail | moving platform timing, checkpoint reset, softlock probes |
| Clarity gate | safe route and exit | safe vs risky route, hazards, collectibles | checkpoint/patrol/moving platform readability |

#### Turn-Based Deckbuilder

| Area | Phase 1 | Phase 2 | Phase 3 |
| --- | --- | --- | --- |
| Launch/start | combat start | preserved | preserved through encounters |
| Resources | HP, enemy HP, energy | preserved with statuses | preserved across reward/next encounter |
| Cards | attacks/block/end turn | added types/statuses/buffs | deck reward and persistence |
| Piles | draw, hand, discard | preserved | preserved across encounter transition |
| Enemy | attack turn | visible intent and multi-turn pattern | second encounter/final victory |
| Negative tests | insufficient energy, defeat | status math, disabled cards | bad reward clicks, transition/restart |
| Clarity gate | card effect and available actions | intent/status/action consequences | rewards, deck update, encounter/final state |

### Nonfunctional Matrix

| Area | Minimum Test | Pass Standard |
| --- | --- | --- |
| Performance | observe FPS/capture smoothness during recording; note visible hitches | no sustained stutter that impairs play; final suite should target about 30 FPS capture and responsive input |
| Load | fresh load from local server | game and manual return HTTP 200 and become usable without manual console commands |
| Visual stability | start, resize/smoke viewport, restart | no overlapping critical UI, unreadable text, or layout shifts that hide controls |
| Console/runtime | attach listeners for `error` and `unhandledrejection` or inspect console | no blocking runtime errors; warnings documented |
| Accessibility | keyboard operation, readable text, non-color-only critical cues, no flicker | no accessibility blocker for required mechanics |
| Localization readiness | scan visible text behavior at compact viewport and manual wording | text not baked into unreadable images; concise strings; no obvious concatenation/text overflow risk |
| Robustness | invalid/repeated inputs, rapid restart/end actions where applicable | no crash, softlock, permanent bad state, or impossible restart |

## Evidence Requirements

### Required Files

Every phase evidence folder must contain:

- `TEST_REPORT.md`
- `expected-flow.md`
- `gameplay-recording.mp4`

Optional but recommended:

- `console-log.json` or `observations.json`
- screenshots named with ordered prefixes, such as `00-title.png`
- `viewport-smoke.md`
- `performance-notes.md`

### Recording Standard

The MP4 should:

- be a fresh recording for the test pass or retest
- show start/reset state
- show normal interaction, not sparse teleport/checkpoint jumps
- show the required phase end state
- be continuous enough that the route or state transition is understandable
- include evidence of any negative-path check if practical
- be encoded as MP4/H.264 or otherwise reliably playable by the orchestrator
- document capture method and approximate FPS in `TEST_REPORT.md`

Acceptable capture methods:

- canvas `captureStream(30)` plus `MediaRecorder`, converted to MP4
- browser-harness screenshot frames at a declared FPS, encoded to MP4
- equivalent method if the report states cadence and toolchain

### Expected Flow Standard

`expected-flow.md` should not be a duplicate of the report. It should be the player-facing acceptance script with visible checkpoints.

Required sections:

- Game and phase
- Tested URL and manual reference
- Fresh start condition
- Step-by-step expected player flow
- End state that proves the phase
- Negative path or failure path expected behavior
- Readability/state clarity observations
- Timestamp or screenshot list corresponding to the recording
- Notes on any route/state ambiguity

For spatial games, include:

- start/reset view
- intended first direction/action
- route/objective labels as encountered
- camera/minimap/HUD alignment observations
- blocker classification if progress fails

For deckbuilder, include:

- visible initial combat state
- card/resource state transitions
- enemy intent/status changes
- victory and defeat or restart proof when required
- reward/encounter transition proof in phase 3

### Console And Runtime Evidence

Testers should capture or state:

- whether `window.onerror` and `unhandledrejection` were monitored
- whether console errors occurred
- whether any console issue affected play
- screenshot or log path for blocking errors

Do not fail for harmless warnings unless they create user-facing risk, but always document them.

## Standard `TEST_REPORT.md` Template

```md
# TEST_REPORT: <Game> <Phase> <Pass Label>

## Game And Phase

- Game:
- Phase:
- Pass label: initial | retest-1 | retest-2 | release-smoke
- Verdict: PENDING | PASS | FAIL
- Date:
- Tester role: black-box tester

## Test Inputs

- Game URL:
- README/manual URL:
- README/manual path:
- Evidence folder:
- Browser and version:
- Browser-harness reference/session:
- Viewports tested:
- Local state reset method:

## Scope

- Included:
- Out of scope:
- Previous findings under confirmation:

## Evidence

- `TEST_REPORT.md`:
- `expected-flow.md`:
- `gameplay-recording.mp4`:
- Recording method and FPS/cadence:
- Supporting screenshots/logs:

## Summary

<Short result summary, including whether phase end state was reached.>

## Acceptance Gate Checklist

| Gate | Result | Notes |
| --- | --- | --- |
| Hosted game loads | PASS/FAIL | |
| README/manual reachable | PASS/FAIL | |
| README/manual matches observed behavior | PASS/FAIL | |
| Start flow works from fresh load | PASS/FAIL | |
| Phase-required mechanics pass | PASS/FAIL | |
| Phase-required end state demonstrated | PASS/FAIL | |
| Negative/edge path tested | PASS/FAIL | |
| Restart/reset/state behavior tested | PASS/FAIL | |
| Console/runtime check passes | PASS/FAIL | |
| Required evidence exists | PASS/FAIL | |
| Recording is smooth/continuous enough | PASS/FAIL | |
| Regression checklist passes | PASS/FAIL | |
| Clarity gate passes | PASS/FAIL | |

## Functional Results

| Requirement | Result | Evidence |
| --- | --- | --- |
| <requirement> | PASS/FAIL | <timestamp/path> |

## Readability / State-Action Clarity Gate

- Gate verdict: PASS | FAIL
- First-action clarity:
- Route/state alignment:
- Sequential discoverability:
- Approach readability:
- Natural orientation sanity check, spatial games only:
- State/action consequence clarity, UI/card games only:
- If completion failed, blocker classification:
- Evidence references:

## Compatibility And Viewport Results

| Browser | Viewport | Result | Notes |
| --- | --- | --- | --- |

## Performance And Stability

- Approximate FPS/capture smoothness:
- Visible hitches:
- Input latency observed:
- Console/runtime errors:
- Memory/long-run notes if tested:

## Accessibility And Usability

- Keyboard or primary input operability:
- Focus/canvas activation clarity:
- Text readability:
- Color-only cue risks:
- Flicker/motion risks:
- Control/objective reminders:

## Localization Readiness

- Concise text:
- Text overflow at tested viewports:
- Text embedded in images/canvas where relevant:
- Locale-sensitive values:
- RTL/text expansion risk:

## Findings

### <ID>: <Title>

- Severity:
- Status:
- Category:
- Repro rate:
- Environment:
- Repro steps:
- Expected:
- Actual:
- Player impact:
- Evidence:
- Blocker classification:
- Retest notes:

## Regression Checklist

| Item | Result | Notes |
| --- | --- | --- |

## Approval Statement

<Explicit PASS/FAIL statement. If PASS with residual findings, list residual risk and why it does not block the phase.>
```

## Standard `expected-flow.md` Template

```md
# Expected Flow: <Game> <Phase> <Pass Label>

## Inputs

- Game URL:
- Manual:
- Evidence folder:
- Recording:
- Viewport:

## Fresh Start

- Expected initial screen:
- Required first action:
- Visible cues that communicate the first action:

## Happy Path Flow

| Step | Player Action | Expected Visible Result | Evidence Timestamp/Screenshot |
| --- | --- | --- | --- |
| 1 | | | |

## Required End State

- End state:
- Visible proof:
- Timestamp/screenshot:

## Negative Or Edge Flow

| Step | Player Action | Expected Visible Result | Evidence |
| --- | --- | --- | --- |

## Readability / State Clarity Notes

- First action:
- Route or state alignment:
- Sequential discoverability:
- Approach readability:
- Any ambiguity:

## Manual Alignment

- README/manual statements confirmed:
- README/manual mismatches:
```

## Practical Per-Phase Approval Standards

### Kart Racer Phase 1: Basic Drivable Track

Must pass:

- game loads to a start/title state
- race starts from documented input
- kart accelerates, brakes/reverses, and steers
- track boundaries constrain off-track movement
- camera allows normal forward driving
- finish line/gate is visible, reachable, and triggers completion
- start pose, camera, track, HUD, and finish direction agree
- compact viewport does not hide critical HUD or controls

Required negative tests:

- deliberate off-track steering
- brake/reverse or slow-speed control
- restart/reload after completion

Hard fail examples:

- finish only triggers at an invisible point
- route appears inverted or unreadable from the start pose
- kart clips through boundaries into a softlock

### Kart Racer Phase 2: Race Rules

Must pass:

- checkpoints are visible and ordered
- checkpoint validation prevents or clearly handles wrong order
- lap count increments only after valid checkpoint sequence
- wrong-way or missed-checkpoint feedback is visible
- timer starts, updates, and final completion is shown
- completion requires documented number of laps
- minimap/HUD/order labels align with the drivable route

Required negative tests:

- skip checkpoint
- drive through checkpoint out of order
- cross finish before completing requirements
- restart after completion

### Kart Racer Phase 3: Game Feel

Must pass:

- boost pads visibly indicate affordance and increase speed
- obstacle cones/barriers collide or penalize as documented
- speed feedback is understandable
- restart flow works after win/fail/reload
- performance remains stable during boost/obstacle interactions
- polish does not reduce checkpoint or route readability

Required negative tests:

- hit obstacle at speed
- trigger boost while steering
- restart mid-race or immediately after completion

### Platformer Phase 1: Core Movement

Must pass:

- title/start flow works
- player moves left/right
- jump and gravity feel responsive enough to complete required route
- platform collision is stable from above, below, and side approaches where encountered
- camera follows without hiding next required platform
- level exit is visible/reachable and triggers completion
- safe route is discoverable without hidden knowledge

Required negative tests:

- miss a jump or fall to lower area if present
- collide with platform sides/undersides
- restart/reload after completion

### Platformer Phase 2: Hazards And Collectibles

Must pass:

- hazards are visually distinct from safe surfaces
- hazard contact damages player and respawns or handles failure as documented
- collectibles are visible, collectible, and counted accurately
- health/lives/fail state is visible and correct
- exit remains reachable through a normal route
- completion summary reflects collectibles and health/lives
- safe route and optional risk route are distinguishable

Required negative tests:

- take damage
- collect at least one item and verify count
- reach health-zero/fail state if feasible
- complete with less than all collectibles if allowed

### Platformer Phase 3: Level Polish

Must pass:

- moving platforms or patrols behave predictably
- checkpoints save and restore progress as documented
- route remains readable after added complexity
- restart flow works from fail and completion states
- no softlocks around moving platforms, hazards, or checkpoints

Required negative tests:

- fail after checkpoint and verify respawn
- mistime a moving platform/patrol
- restart from checkpointed or completed state

### Deckbuilder Phase 1: Basic Card Combat

Must pass:

- combat start works
- player HP, enemy HP, hand, draw/discard counts, energy, block/guard, and turn state are visible
- attack cards spend energy and damage enemy correctly
- block/guard cards spend energy and mitigate enemy damage correctly
- unaffordable cards cannot be played or clearly fail
- end turn triggers enemy action and new player turn
- draw/discard flow is visible and correct enough for phase scope
- victory and defeat are reachable or convincingly demonstrated by separate routes
- next available action is clear at all times

Required negative tests:

- attempt to play over energy
- end turn with cards in hand
- restart after victory/defeat

### Deckbuilder Phase 2: Tactical Variety

Must pass:

- enemy intent is visible before player commits to end turn
- intent matches the actual enemy action
- multiple card types work as documented
- status effects/buffs are visible and their math is correct
- deterministic or documented enemy cycle can be observed over at least two enemy turns
- Phase 1 resource, pile, victory, defeat, and restart behavior remains intact

Required negative tests:

- status card interaction with attack/mixed attack
- insufficient energy after draw/buff
- defeat route or high-damage enemy action if feasible

### Deckbuilder Phase 3: Run Structure

Must pass:

- reward choice appears after combat
- selected reward visibly changes deck or next encounter state
- second encounter starts with persisted deck changes
- final victory screen appears after the final encounter
- restart/new run resets appropriate state
- reward consequences and encounter number are clear

Required negative tests:

- click only one reward and verify no duplicate reward application
- try restart during reward or between encounters
- verify final state cannot be confused with intermediate victory

## Accessibility And Usability Criteria

Apply these as practical minimums, not full certification:

- Primary controls must be simple and documented.
- Required actions must not demand complex simultaneous input unless the genre requires it and it is documented.
- Critical information must not rely only on color. Shape, label, position, animation, or text should reinforce it.
- Text should be readable at primary and compact viewports.
- Start, restart, end turn, reward, and other UI actions should have clear labels or affordances.
- Canvas focus or page focus should be obvious enough that documented inputs work after the start action.
- Avoid flicker or repetitive flashing that could affect comfort.
- Objective reminders should remain visible or easy to rediscover during play.
- For card/UI games, focus order and visible focus indicators should be checked for controls if keyboard navigation is supported.

## Localization-Readiness Criteria

Full localization is out of scope for the current suite, but testers should flag obvious blockers:

- text overflows buttons, cards, HUD, or overlays at compact viewport
- text is too tightly baked into graphics to change later
- strings are fragmented in ways that would produce awkward translated text
- non-English characters visibly break if manually probed in a title/name field, if such fields are introduced
- numbers, timers, dates, or scores use ambiguous formatting when locale might matter
- direction-dependent UI assumes left-to-right layout where it would be hard to adapt later

Do not fail a phase solely because the game is English-only. Fail only if localization-readiness issues also create current readability, usability, or layout blockers.

## Performance Criteria

For these small browser games, use practical player-facing thresholds:

- Load: playable surface appears within a few seconds on local server in Chrome.
- Interaction: input should feel immediate; no visible pauses after keypress/click during normal play.
- Recording: MP4 should show smooth play at about 30 FPS capture, or report actual capture cadence.
- Stability: no sustained slideshow behavior, runaway CPU behavior, browser tab crash, or unresponsive page.
- Visual stability: resize/smoke viewport should not cause controls or HUD to overlap required content.
- Long-run smoke: for final suite signoff, run each game for 2 to 3 minutes or through full completion without progressive slowdown.

web.dev Core Web Vitals are not a perfect game metric, but they are useful for page-level checks: loading, interactivity, and visual stability should all be considered.

## Compatibility Criteria

Minimum during active phase testing:

- Chrome via browser-harness at primary viewport.
- Chrome compact viewport smoke.
- Manual reachable as plain browser content.

Minimum before final suite signoff:

- Chrome primary full pass for all games.
- Chrome compact smoke for all games.
- One secondary browser smoke per game, preferably Firefox or Safari if available.
- No browser-specific instruction in README/manual unless it is intentional and documented.

## Robustness And Negative Testing Criteria

Each phase should include at least one negative or edge-path probe:

- rapid restart or repeated start clicks
- invalid or out-of-order objective
- movement into boundary/hazard
- insufficient energy/card misuse
- wrong checkpoint/lap order
- failure state followed by restart
- completion followed by restart
- viewport resize or reload during nonfinal state, where applicable

The goal is not exhaustive fuzzing. The goal is to catch crashes, softlocks, state leaks, and misleading feedback around common player mistakes.

## Release Signoff Standard

The suite is release-ready only when:

- all nine phase reports are `PASS`
- every required evidence folder has report, expected-flow, and MP4
- every game has a final README/manual matching observed behavior
- all critical/high findings are resolved or superseded by later accepted behavior
- medium findings are explicitly accepted by the orchestrator
- each game has one final full-play recording from start to final phase completion
- compact viewport smoke passes for each game
- final dashboard, if used, links reports and evidence correctly

## Changes Needed To `AGENTS.md`

Do not replace the existing protocol. Add or revise these sections.

### 1. Add QA Standards Reference

Add a new canonical reference near the top:

```md
QA standards proposal: `qa-upgrade/QA_STANDARDS_PROPOSAL.md`

When tester handoffs or approval decisions conflict with older informal report patterns, use the QA standards proposal as the preferred template unless the user has not approved adopting it yet.
```

If the proposal is formally adopted, rename this to "QA standards protocol" and make it normative.

### 2. Expand Phase Handoff Packet

Add these required handoff fields:

- build iteration label: `initial`, `retest-1`, etc.
- previous findings under confirmation, summarized without implementation details
- required viewport matrix for the pass
- required negative/edge-path probes
- required report template version
- explicit console/runtime monitoring requirement

### 3. Replace Report Format With The Standard Template

Update `Tester Report Format` to require the sections in the `Standard TEST_REPORT.md Template` above, especially:

- acceptance gate checklist
- functional results table
- compatibility/viewport results
- performance/stability
- accessibility/usability
- localization readiness
- finding category/repro rate/player impact
- explicit clarity gate with `PASS` or `FAIL`

### 4. Add Defect Severity Taxonomy

Add the critical/high/medium/low taxonomy and gate rules from this proposal. Clarify that:

- testers assign severity based on player impact
- orchestrator assigns fix priority
- critical/high unresolved findings block approval
- medium/low can pass only with explicit residual-risk note

### 5. Add Confirmation And Regression Rule

Add:

```md
Every builder fix requires tester confirmation of the named finding and targeted regression testing of nearby or previously accepted behavior. A retest report must list the original finding, its retest result, fresh evidence, and any new regressions.
```

### 6. Add Minimum Test Matrix

Add:

- Chrome primary full pass every phase
- Chrome compact viewport smoke every phase
- secondary-browser smoke before final suite signoff
- input matrix by game
- negative/edge-path minimum per phase

### 7. Strengthen Evidence Standard

Current evidence requirements are good. Add:

- recording must show start/reset and required end state
- recording method must include capture cadence or FPS
- expected-flow must include timestamps or screenshot references
- console/runtime check must be stated
- retests require fresh recording unless the orchestrator explicitly accepts evidence reuse

### 8. Add Suite Release Signoff

Add the release signoff standard from this proposal so the orchestrator can distinguish "phase approved" from "suite release ready."

## Adoption Plan

1. Orchestrator reviews and approves or edits this proposal.
2. Dashboard thread optionally adds fields for severity, category, retest status, and residual risk.
3. Orchestrator updates `AGENTS.md` with the accepted deltas.
4. Future tester handoffs instruct testers to use the new templates.
5. Existing historical reports do not need to be rewritten unless their phase is retested.
6. For any active phase currently in testing, use the new template on the next report or retest.

## Immediate Practical Recommendations

- Make the clarity gate table mandatory and impossible to omit from every report.
- Require one compact viewport smoke in every phase report.
- Require a named negative path in every phase report.
- Require defect category, repro rate, and player impact fields.
- Require retest reports to name the original blocker and the targeted regression scope.
- Treat missing or non-playable MP4 evidence as a tester-process failure, not a game failure.
- Keep the workflow lightweight: do not require full browser matrix testing until final suite signoff.


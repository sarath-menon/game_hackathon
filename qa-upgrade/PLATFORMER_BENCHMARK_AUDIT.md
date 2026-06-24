# Platformer Benchmark Audit

Audit thread: Platformer benchmark/audit  
Workspace: `/Users/sarathmenon/Documents/game_hackathon`  
Game under review: `games/platformer/index.html` (`Skyline Stepper`)  
Local URL used: `http://127.0.0.1:8765/games/platformer/index.html`  
Browser capture method: `browser-harness` against the local server

## Scope And IP Boundary

This audit uses genre-leading platformers only as references for control feel, readability, camera behavior, feedback, and production-quality expectations. Do not copy protected names, characters, art, music, logos, maps, level layouts, enemy designs, UI branding, or other protected assets.

## Reference Links

- Celeste official site: https://www.celestegame.com/  
  Useful signal: positions the game as a "super-tight, hand-crafted platformer" and provides public screenshots for composition and readability comparison.
- Celeste Steam page: https://store.steampowered.com/app/504230/Celeste/  
  Useful signal: simple controls with expressive depth, quick respawn, many hand-authored screens, and deaths as learning feedback.
- Celeste and Forgiveness by Maddy Makes Games: https://www.maddymakesgames.com/articles/celeste_and_forgiveness/index.html  
  Useful signal: coyote time, jump buffering, halved gravity near jump apex, corner correction, and other small player-favoring windows.
- Platformer Toolkit by Game Maker's Toolkit: https://gmtk.itch.io/platformer-toolkit  
  Useful signal: exposes jump height, max speed, acceleration, squash/stretch, coyote time, and other tunable movement variables as first-class platformer feel controls.
- How to Make a Good 2D Camera by Game Maker's Toolkit: https://gmtk.substack.com/p/how-to-make-a-good-2d-camera  
  Useful signal: lookahead, jump-stable camera behavior, damping, dead zones, framing important objects, and camera juice.
- Scroll Back: The Definitive Camera Design Guide for 2D Games and Side-Scrollers: https://gamedesignskills.com/game-design/camera-design-2d-side-scroller-games/  
  Useful signal: camera windows, platform snapping, static/dual forward focus, region anchors, and target focus.
- Hollow Knight official site: https://www.hollowknight.com/  
  Useful signal: readable hazards, traps, enemies, and a strongly layered foreground/background language in a challenging 2D action-adventure.
- Ori and the Will of the Wisps official site: https://www.orithegame.com/  
  Useful signal: high visual polish and strong foreground readability within rich, painterly environments.

## Current Local Screenshots

Screenshots were captured from the hosted local platformer through `browser-harness`:

- `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/platformer-screenshots/01-title-screen.png`
- `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/platformer-screenshots/02-run-start.png`
- `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/platformer-screenshots/03-early-route-core-hazard.png`
- `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/platformer-screenshots/04-mid-route-platforms.png`
- `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/platformer-screenshots/05-late-route-checkpoint-or-exit-approach.png`
- `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/platformer-screenshots/06-run-outcome-or-late-route.png`

Current evidence note: `evidence/platformer/phase-2/TEST_REPORT.md` now says `PASS` for the second Phase 2 retest. The older `log.md` entry that says Phase 2 failed is stale relative to the current evidence artifact.

## Current Strengths

- The title screen is clear and immediately exposes controls.
- HUD state is readable: objective, health, checkpoint, cores, and distance.
- The player, hazards, collectibles, checkpoint, route markings, and exit use distinct colors.
- The game has a lower safe-deck route and optional upper core route, which is the right structural pattern for Phase 2.
- Damage, respawn, checkpoint activation, failure summary, and completion summary are present.
- Browser-captured screenshots show the camera keeps the player and next obstacles mostly visible during normal rightward movement.

## Benchmark Comparison Findings

### Movement Feel

Current implementation has acceleration, braking, air control, high gravity, and a readable jump arc. However, the jump only triggers while `player.grounded` is true, so it lacks the player-forgiveness patterns that high-quality precision platformers rely on: coyote time, jump buffering, variable jump height, jump-cut on release, apex hang/low-gravity near the top, and corner correction.

Benchmark implication: the current game is playable, but missed jumps and ledge timing can feel more brittle than the genre quality bar. A small forgiveness layer would raise perceived quality without adding new IP risk.

### Camera

Current camera uses a smoothed horizontal follow target biased ahead of the player. This is a good baseline. It does not yet include a committed-direction lookahead, camera window/dead zone, region framing for important challenges, or special framing for the exit/checkpoint/hazard clusters.

Benchmark implication: the camera should do more than follow the player. It should frame the next decision. For this game, that means showing the safe lower deck and optional upper route before the jump decision, showing hazards early enough to react, and biasing the exit beacon before the final approach.

### Level Readability

Current route labels help: `SAFE DECK`, `CORE ROUTE`, and `DANGER`. The color language is useful but not yet robust enough under motion:

- The safe lower route and optional core route are visible, but their relationship can be partially obscured by camera position and foreground buildings.
- Some labels slide off-screen or appear truncated during normal movement.
- Hazards are visible, but the safe jump timing and optional-risk framing could be clearer.
- The exit is green and labeled, but the final approach should be staged earlier with a stronger beacon/arrow treatment.

Benchmark implication: genre-leading platformers teach through composition. The next route, hazard, reward, and checkpoint should be visible before the player commits to a jump or drop.

### Hazards And Enemies

Current red vents and orange patrol runners are visually distinct and mechanically functional. They are still simple shapes with limited telegraphing.

Benchmark implication: hazards should communicate collision bounds, active danger timing, and safe approach paths. Patrols should show movement lanes and turning points clearly enough that a player can plan without trial-and-error.

### Collectibles

Glow cores read well because of color and pulsing. The HUD count is clear. The game does not yet differentiate mandatory progress from optional collection strongly enough.

Benchmark implication: optional collectibles should sit in visible risk/reward pockets. The player should understand, from the layout alone, when a core is optional and what risk it asks for.

### Checkpointing And Recovery

Current checkpointing exists and the latest evidence says the lower safe route can complete Phase 2. Damage respawn provides feedback. The remaining quality gap is recovery polish: respawn position, invulnerability, screen feedback, and camera reset should all make the next attempt immediately understandable.

Benchmark implication: a failed attempt should teach. Strong platformers combine fast recovery, clear checkpoint state, short invulnerability, and visible cause-of-death feedback.

### UI And Feedback

The HUD is functional and clear. There is limited sensory feedback: no particles, landing squash, pickup burst, hit pause, screen shake, sound, animation states, or completion flourish.

Benchmark implication: small juice matters. Pickup, damage, landing, checkpoint, and completion feedback should be unmistakable even in a minimal canvas game.

## Prioritized Gaps

1. Movement forgiveness is missing. Add coyote time, jump buffering, variable jump height, apex hang, and jump-cut before adding harder platform sequences.
2. Route readability needs stronger visual hierarchy. Make the safe deck, optional core route, hazards, checkpoint, and exit readable before commitment points.
3. Camera should frame decisions, not only track position. Add directional lookahead, dead zone/window behavior, and local framing for checkpoint/exit/challenge clusters.
4. Hazard and patrol telegraphs are basic. Add warning silhouettes, active bounds, movement rails, turn markers, and consistent color/shape language.
5. Reward and failure feedback is thin. Add pickup burst, damage flash/hit stop, landing dust, checkpoint pulse, completion flourish, and restart feedback.
6. Phase structure should now move toward polished Phase 3 features without regressing Phase 2 completion evidence.

## Proposed Builder Goal Plan

### Upgrade Phase A: Movement Feel Pass

Builder goal:

- Add coyote time around 100-150 ms.
- Add jump input buffering around 100-150 ms.
- Add variable jump height by cutting upward velocity on early jump release.
- Add slight apex hang or reduced gravity near the top of a held jump.
- Preserve existing max speed, acceleration, braking, air control, damage, collectibles, checkpoint, and completion behavior.
- Add a tiny landing effect and a player pose/state change for idle, run, jump, fall, damage, and invulnerable blink.
- Update `games/platformer/README.md` only if player-facing controls or rules change.

Tester goal:

- Black-box test that late ledge jumps and early pre-landing jump presses are accepted.
- Verify short tap versus held jump visibly changes jump height.
- Verify Phase 2 completion, damage, checkpoint, and failure still work.
- Record smooth evidence and explicitly judge whether movement feels forgiving rather than brittle.

### Upgrade Phase B: Camera And Route Readability Pass

Builder goal:

- Add committed-direction lookahead so rightward movement shows more of the upcoming path.
- Add a small horizontal camera dead zone/window to avoid jitter during fine positioning.
- Keep vertical camera stable during ordinary jumps, but frame higher platforms once landed or when a route decision requires it.
- Strengthen safe-versus-optional route language: persistent color-coded rails, arrow/chevron markers, and non-truncated labels.
- Add stronger exit beacon visibility before final approach, without making it look like a copied asset from any reference game.
- Ensure the lower safe route is continuously readable from start to exit.

Tester goal:

- Black-box test first-action clarity, route/state alignment, sequential discoverability, and approach readability.
- Verify the camera shows hazards and platform choices before the player must commit.
- Verify the exit is visually discoverable through normal play, not through scripted search.
- Verify no labels are clipped or misleading at desktop and smaller viewport sizes.

### Upgrade Phase C: Hazards, Collectibles, And Checkpoint Feedback Pass

Builder goal:

- Improve vent readability with clear active collision bounds and steam/warning animation.
- Improve patrol readability with rails, turn markers, and clearer danger silhouettes.
- Add glow-core pickup burst and short HUD count pulse.
- Add damage feedback: player flash, short hit stop, local camera shake, and cause text that disappears cleanly.
- Add checkpoint feedback: visible pulse, flag color shift, and respawn marker.
- Preserve the optional nature of collectibles; do not make all cores mandatory unless the phase goal explicitly changes.

Tester goal:

- Verify hazard damage is visually anticipated and mechanically consistent.
- Verify optional core risk/reward is understandable from visible layout.
- Verify checkpoint activation and respawn state are clear.
- Verify damage/restart never hides the next intended action.

### Upgrade Phase D: Phase 3 Polish And No-Softlock Pass

Builder goal:

- Add one polished moving platform or one simple patrol timing challenge, scoped to Phase 3.
- Add restart flow polish after `Level Complete` and `Run Ended`.
- Add a compact completion summary: time, cores, health, checkpoint used, and restart prompt.
- Add no-softlock safeguards: fall recovery, out-of-bounds reset, and clear respawn after unusual collisions.
- Keep all art original, geometric, and consistent with the current rooftop visual language.

Tester goal:

- Verify moving/timing interaction is readable and fair.
- Verify checkpoint behavior, restart behavior, and no-softlock safeguards.
- Verify Phase 1 and Phase 2 requirements still pass.
- Verify final evidence includes a normal-play completion route and a failure/restart demonstration.

## Recommended Acceptance Gates For Future Platformer Work

- Movement gate: coyote time, buffered jump, variable jump, and stable collision must be observable through black-box play.
- Readability gate: the safe route, optional route, hazards, collectibles, checkpoint, and exit must be visually distinguishable without source knowledge.
- Camera gate: the camera must show upcoming hazards and route choices early enough for human reaction.
- Feedback gate: pickup, damage, checkpoint, completion, failure, and restart states must be visibly distinct.
- Regression gate: every upgrade must preserve local hosted play, README/manual consistency, and continuous evidence recording.

## Summary

`Skyline Stepper` has a solid functional base and the latest Phase 2 evidence now reports `PASS`. Against genre-leading platformers, the biggest gap is not raw feature count. It is feel and communication: forgiving inputs, decision-framing camera behavior, route readability before commitment, clear hazard telegraphs, and stronger feedback. The safest path is to raise quality in small builder/tester passes: movement feel first, camera/readability second, hazard/reward feedback third, and Phase 3 timing/polish last.

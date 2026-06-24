# Arcade Kart Racer Benchmark Audit

Scope: benchmark the current `games/kart-racer/index.html` against genre-leading kart racers for mechanics, game feel, camera, UI/readability, track readability, feedback, collision/recovery, and polish. This is an audit and upgrade plan, not an acceptance test.

Copyright/IP guardrail: use references only to understand genre expectations. Do not copy protected names, characters, art, music, logos, track layouts, item designs, UI branding, or distinctive course themes.

## Reference Links

- [Mario Kart 8 Deluxe official site](https://mariokart8.nintendo.com/) - official screenshots and course/item presentation.
- [Nintendo beginner basics for Mario Kart 8 Deluxe](https://www.nintendo.com/jp/ichikara/aabpa/index_en.html) - drifting, staged mini-turbo sparks, dash panels, jump boosts, and course-feature boosts.
- [Crash Team Racing Nitro-Fueled official site](https://www.crashbandicoot.com/crashteamracing) - remastered track/vehicle presentation and mode breadth.
- [Crash Team Racing Nitro-Fueled PlayStation page](https://www.playstation.com/en-us/games/crash-team-racing-nitro-fueled/) - screenshots/videos, rebuilt visual polish, tracks, power-ups, leaderboards, and time trials.
- [Activision CTR gameplay tips](https://support.activision.com/crash-team-racing/articles/crash-team-racing-nitro-fueled-gameplay-tips) - power-slide, turbo gauge, chained boosts, brake slide, jump boost, start boost, hazards, and item-defense expectations.
- [Disney Speedstorm drift mechanics dev diary](https://disneyspeedstorm.com/news/disney-speedstorm-dev-diary-drift-mechanics) - accessible drift, precise drift-arc control, charge feedback, wheel glow/sparks, and drift boost cancellation on wall/obstacle hits.
- [Sonic Racing: CrossWorlds official site](https://asia.sega.com/SonicRacingCrossWorlds/en/) - modern high-speed presentation, multi-surface spectacle, local/online player counts, and promotional screenshots/videos.
- [Xbox Wire KartRider: Drift preview](https://news.xbox.com/en-us/2019/12/05/preview-kartrider-drift-on-xbox-one/) - drift-forward arcade racing, cross-platform positioning, customization, and boost-to-finish marketing emphasis.
- Supplemental community signal, not primary source: [r/Games KartRider: Drift launch discussion](https://www.reddit.com/r/Games/comments/109ny79/kartrider_drift_is_out_nowf2p_racing_game_for/) - players repeatedly identify high-skill drifting, technical handling, speed mode, and more complex tracks as the differentiator.

## Current Screenshots

Captured through the local server URL `http://127.0.0.1:8765/games/kart-racer/index.html` with browser-harness:

- `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/current-screenshots/kart-00-title.png`
- `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/current-screenshots/kart-01-title.png`
- `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/current-screenshots/kart-02-race-start.png`
- `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/current-screenshots/kart-03-accelerating.png`
- `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/current-screenshots/kart-04-turning.png`

Existing black-box Phase 3 evidence also remains useful for behavior reference:

- `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/phase-3/TEST_REPORT.md`
- `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/phase-3/expected-flow.md`
- `/Users/sarathmenon/Documents/game_hackathon/evidence/kart-racer/phase-3/gameplay-recording.mp4`

## Current State Summary

The current kart game is a strong single-file prototype relative to the suite's Phase 3 requirements. It has a playable 3D-like loop track, route arrows, ordered checkpoints, lap completion, timer, visible HUD, minimap, cyan boost pads, red obstacles, recoverable collisions, speed bar, restart flow, and a readable title screen. The latest Phase 3 report says `PASS`, including readability/orientation.

The benchmark gap is not basic functionality. The gap is depth and sensory quality. Leading kart racers make the act of cornering and boosting feel expressive, layered, and rewarding every few seconds. Our build currently reads clearly, but the drive model is still mostly accelerate/steer/brake on a flat loop with simple boost-pad and obstacle events.

## Benchmark Quality Bar

High-quality kart racers tend to do these things well:

1. Cornering is the primary skill loop.
   - Drift or power-slide controls are easy to start but reward timing, line choice, and exit angle.
   - Staged boost feedback communicates partial charge, ready state, release timing, and failure/cancel states.
   - Good players can chain micro-decisions through every bend, not just aim down the centerline.

2. Speed is visible before it is numerical.
   - Camera FOV, chase distance, camera roll/lean, road streaking, exhaust/tire particles, boost trails, and audio pitch communicate speed changes immediately.
   - HUD speed bars support the feel but are not the main sensation.

3. Track readability is environmental, not only instructional.
   - Curbs, rail colors, signs, lighting, skyline landmarks, road banking, and track-side objects teach the next turn.
   - The minimap confirms route structure but does not carry the whole readability burden.
   - Checkpoints/laps are reinforced through gate scale, color, road markings, and approach framing.

4. UI stays dense but glanceable.
   - Lap, position, timer, speed/boost, item/ability state, next objective, and minimap are spatially stable.
   - Critical state changes get short, readable callouts that do not obscure driving.

5. Collision and recovery protect flow.
   - Walls and obstacles punish mistakes without frequent dead stops.
   - Off-track recovery is clear and fast.
   - Hazard feedback explains what happened with visual/audio effects, not only text.

6. Polish is cumulative.
   - Countdown/start boost, lap/split timing, completion grading, restart/menu flow, animated gates, particles, sound, and lively scenery all compound into quality.
   - Top examples also layer competitors, items, shortcuts, and progression, but those are later-scope additions.

## Comparison Findings

### Mechanics And Handling

Current:

- Functional acceleration, brake/reverse, and steering.
- Track boundaries keep the kart recoverable.
- Boost pads provide a short speed surge.
- Obstacles slow/bump the kart and show a message.

Gap:

- No drift/power-slide, drift charge, staged boost, charge cancellation, or controlled exit boost.
- Steering has limited personality; it is readable but not expressive.
- No start countdown/start boost, jump/ramp boost, shortcut decision, or time-trial line optimization.

Priority: highest. A kart racer starts to feel like the genre when cornering itself becomes the repeatable reward loop.

### Camera And Speed Feel

Current:

- Chase/top-down hybrid view is readable and keeps CP1 visible.
- Minimap and route arrows help orientation.
- Speed bar and slight visual streaks communicate some velocity.

Gap:

- Camera is mostly static and does not sell acceleration, drift angle, boost impact, collision, or recovery.
- The kart stays icon-like rather than weighty; limited squash, tire angle, skid, exhaust, or road-contact feedback.
- The road lacks depth cues such as banking, shadows, parallax scenery, or near-field motion.

Priority: high. Camera response and visual effects can improve perceived quality without changing core rules.

### Track Presentation And Readability

Current:

- Loop track is readable.
- CP gates, finish gate, route arrows, minimap, and HUD objective agree.
- Boost pads and obstacles are color-coded and labeled.

Gap:

- The course is visually sparse and abstract.
- Track edges, gates, pads, and obstacles are readable but not memorable.
- There are no themed zones, landmark silhouettes, sign boards, road markings, elevation cues, shortcuts, or alternate risk/reward paths.

Priority: high after driving feel. Keep the current route clarity, then add environmental readability.

### UI And Feedback

Current:

- HUD exposes speed, lap, time, next gate, objective, and minimap.
- Bottom message communicates checkpoint/boost/collision state.
- Completion overlay reports final time.

Gap:

- No boost meter, drift charge meter, start countdown, split/lap delta, grade, or best-time memory.
- Feedback relies too much on text callouts.
- HUD lacks hierarchy for race-critical feedback during fast play.

Priority: medium-high. Add state only when the mechanic exists; avoid clutter.

### Collision And Recovery

Current:

- Guard rails push the kart back onto the road.
- Obstacles are recoverable and do not softlock.

Gap:

- Wall contact is mechanically useful but not yet polished with scrape/spark feedback, speed-dependent bounce, or clear invulnerability/recovery windows.
- No explicit stuck recovery if the kart spins, reverses, or rests against scenery in later richer tracks.

Priority: medium. Improve alongside track complexity.

### Visual Polish

Current:

- Clean single-file canvas style.
- Good contrast between road, HUD, CP gates, boost pads, and obstacles.

Gap:

- Visual language is prototype-simple: flat road, simple geometric kart, simple markers, minimal animation.
- No original theme identity beyond generic arcade karting.
- No audio layer.

Priority: medium. Useful after handling and readability are locked.

## Prioritized Gaps

1. Add drift/power-slide with staged boost and visual charge feedback.
2. Make camera and effects react to acceleration, drift, boost, and collision.
3. Upgrade track readability through road markings, curbs, signs, landmark scenery, and approach-framed gates.
4. Add race-start and result polish: countdown, optional start boost, split/lap timing, grade, best-time memory.
5. Make collisions richer while preserving recoverability.
6. Add original, non-infringing track theme and sound effects.
7. Later: rivals, items/abilities, shortcuts, and multiple tracks, only after the solo driving loop is strong.

## Phased Builder Goal Plan

Each phase should be built by the kart builder only and followed by a black-box tester handoff. Preserve the current Phase 3 PASS behaviors unless a phase explicitly replaces them.

### Upgrade Phase A: Drift And Boost Feel

Builder goal:

- Add a drift/power-slide input that works with keyboard controls.
- Let players initiate drift while turning at speed.
- Add a visible staged charge: early/ready/strong, using original colors and effects.
- On drift release, apply a short boost proportional to charge stage.
- Cancel or weaken drift charge on wall/obstacle impact.
- Add skid trails, tire/exhaust particles, and a small boost meter or charge indicator.
- Update README with drift controls and rules.

Tester goal:

- Verify normal steering still works.
- Verify drift starts only under documented conditions.
- Verify charge stages are visible from normal play.
- Verify releasing drift boosts speed and feels recoverable.
- Verify wall/obstacle contact cancels or weakens charge as documented.
- Verify route clarity still passes.

### Upgrade Phase B: Camera And Speed Feedback

Builder goal:

- Add speed-sensitive camera distance/FOV simulation, subtle camera lean during steering/drift, and stronger but bounded boost/collision shake.
- Add speed streaks, boost trails, skid marks, and impact sparks.
- Keep HUD and minimap stable while the world view reacts.
- Ensure motion effects do not obscure CP gates, finish gate, road edges, boost pads, or obstacles.

Tester goal:

- Verify acceleration, drift, boost, obstacle hit, and restart remain mechanically correct.
- Verify effects improve speed readability without causing motion confusion.
- Test at desktop and narrower viewport sizes.
- Treat any obscured gate/objective or disorienting camera swing as a blocking readability issue.

### Upgrade Phase C: Track Readability And Presentation

Builder goal:

- Add original, generic track-side scenery and landmarks without copying known franchises.
- Add curbs/edge strips, turn-warning arrows, road-surface markings, bridge/overpass or elevation cues if feasible in the single-file renderer.
- Make checkpoint gates larger and approach-framed from the driving line.
- Add at least one optional safe/risky branch or shortcut only if it is visibly signposted and rejoins cleanly.
- Improve minimap contrast and optionally show current heading.

Tester goal:

- Verify first-action clarity, route alignment, sequential objective discoverability, and natural orientation.
- Verify new scenery does not hide drivable boundaries.
- Verify optional route is visibly optional and not required for completion.
- Verify CP1, CP2, CP3, finish, boost pads, and obstacles remain readable at speed.

### Upgrade Phase D: Race UX And Timing Polish

Builder goal:

- Add a countdown start sequence.
- Add an optional start boost timing mechanic with clear success/fail feedback.
- Add lap/split timing, best-time persistence in localStorage, result grade, and immediate restart.
- Keep one-lap mode if desired, but make the race result feel complete.
- Update README with start boost and results behavior.

Tester goal:

- Verify countdown blocks early movement until race start.
- Verify start boost has readable timing and failure state.
- Verify timer, splits/best time, completion overlay, and restart are correct.
- Verify localStorage best time does not break clean first-run behavior.

### Upgrade Phase E: Collision And Recovery Polish

Builder goal:

- Add differentiated wall scrape, cone hit, barrier hit, and boost-pad feedback.
- Add speed-dependent bounce/slowdown that avoids dead stops.
- Add explicit stuck recovery if the kart is stationary or off-line too long.
- Preserve race rules and checkpoint order.

Tester goal:

- Verify every obstacle remains recoverable.
- Verify boundary contact never creates a softlock or hidden reverse-only recovery.
- Verify collision feedback is visible without covering the next objective.
- Verify completion remains possible after intentional mistakes.

### Upgrade Phase F: Original Identity Layer

Builder goal:

- Create an original non-infringing track identity: color palette, signs, scenery silhouettes, ambient animation, simple sound effects, and menu/result styling.
- Do not use protected characters, logos, music, course layouts, item silhouettes, or recognizable franchise assets.
- Keep all assets embedded or generated locally inside the single-file constraint unless the orchestrator changes that constraint.

Tester goal:

- Verify no obvious protected names/characters/logos/music/maps appear.
- Verify visual polish improves readability rather than adding clutter.
- Verify performance remains stable and the game still completes from start to finish.

## Acceptance Risks To Watch

- Drift mechanics can make the current tight route harder. Require tester proof that a non-expert can still complete the lap without drift.
- Camera effects can undermine the existing readability pass. Gate visibility is a hard blocker.
- Extra scenery can hide obstacles, road edges, or minimap markers.
- Start boost and result screens can create state bugs around restart, timer start/stop, and localStorage.
- More effects can reduce performance in browser-harness recordings. Require a smoke check on the same local server flow.

## Recommended Next Builder Prompt

Start with Upgrade Phase A only:

> Upgrade Arcade Kart Racer with a keyboard-friendly drift/power-slide and staged boost loop. Preserve all current Phase 3 pass behavior: start screen, acceleration/brake/steering, ordered CP1/CP2/CP3, lap 1/1 completion, boost pads, obstacle recovery, minimap, HUD, route clarity, and restart. Add drift initiation while turning at speed, visible charge stages, boost on release, charge cancellation/weakening on obstacle or wall contact, skid/particle feedback, and README updates. Do not copy any protected kart-racer names, characters, art, music, logos, maps, item designs, or branding.

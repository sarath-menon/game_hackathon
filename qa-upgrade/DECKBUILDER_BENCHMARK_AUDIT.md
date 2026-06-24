# Turn-Based Deckbuilder Benchmark Audit

Date: 2026-06-25  
Thread role: Deckbuilder benchmark/audit lane  
Workspace: `/Users/sarathmenon/Documents/game_hackathon`  
Game under audit: `/Users/sarathmenon/Documents/game_hackathon/games/deckbuilder/index.html`  
Local URL used: `http://127.0.0.1:8765/games/deckbuilder/index.html`

## Scope And IP Guardrail

This audit uses public reference material from genre-leading deckbuilder/card battlers to identify expectations around combat readability, card UX, feedback, reward flow, and run structure. It does not recommend copying protected names, characters, art, music, card names, exact card effects, enemy designs, UI skins, maps, or branding. Recommendations below translate genre patterns into original, testable goals for Ash Circuit.

## Public Reference Links

- [Slay the Spire on Steam](https://store.steampowered.com/app/646570/Slay_the_Spire/) - public store media, deckbuilding/run-structure feature baseline, large card/content scale.
- [Slay the Spire UI catalog on Interface In Game](https://interfaceingame.com/games/slay-the-spire/) - public screenshot categories for battle start, player turn, use card, enemy stats, rewards, map, tips, and game-over states.
- [Monster Train on Steam](https://store.steampowered.com/app/1102190/Monster_Train/) - public store media and reference for tactical decision-making across multiple combat lanes.
- [Wildfrost on Steam](https://store.steampowered.com/app/1811990/Wildfrost/) - public store media and reference for tactical card readability, board state clarity, and compact iconography.
- [Wildfrost official site and press kit link](https://www.wildfrostgame.com/) - public screenshots/videos and press kit access.
- [Griftlands on Steam](https://store.steampowered.com/app/601840/Griftlands/) - public store media and reference for card combat embedded in a broader decision/RPG run.
- [Balatro on Steam](https://store.steampowered.com/app/2379780/Balatro/) - public store media and reference for high-contrast card scoring feedback, combo pacing, and reward/shop clarity.

## Current Screenshots Captured

Captured through the local server with `browser-harness` at a desktop viewport reported as 1728 x 996 CSS pixels.

- Start overlay: `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/screenshots/deckbuilder-00-start.png`
- Combat start: `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/screenshots/deckbuilder-01-combat-start.png`
- After card plays: `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/screenshots/deckbuilder-02-after-card-plays.png`
- After enemy turn: `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/screenshots/deckbuilder-03-after-enemy-turn.png`
- Reward choice: `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/screenshots/deckbuilder-04-reward-choice.png`
- Encounter 2 start: `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/screenshots/deckbuilder-05-encounter-2-start.png`
- Final victory: `/Users/sarathmenon/Documents/game_hackathon/qa-upgrade/screenshots/deckbuilder-06-final-state.png`

## Current State Summary

Ash Circuit is already past the basic prototype stage. The current manual describes a two-encounter deterministic deck run with energy, draw/hand/discard, enemy intent, Focus, Fractured, reward choice, deck update, final victory, defeat, and restart. Existing tester evidence for Phase 3 reports `PASS` with one open low-severity issue: the start overlay leaves the combat HUD visible behind it.

The live game is functional and readable enough for a black-box test pass. The main gap versus genre leaders is production-grade communication: leading games make every state change feel physical and legible through target lines, impact animation, number deltas, card previews, hover details, tooltips, pile/deck inspection, and run-level decision framing. Ash Circuit currently communicates mostly through static panels and a text log.

## Benchmark Quality Bar

High-quality deckbuilder/card battlers tend to do these things well:

- Combat state is glanceable: player HP/block/resources, enemy HP/intent, active statuses, draw/discard state, and playable cards are readable without scanning a paragraph.
- Cards preview consequences before commitment: cost, target, adjusted damage/block, disabled reason, status interactions, and any draw/discard/exhaust behavior are clear at hand level or on hover.
- Enemy intent is explicit and trusted: icon, label, numeric value, target, extra effect, and next-turn consequence are visible before the player commits.
- Feedback is immediate: card lift/targeting, hit flash, damage number, block gain number, HP bar change, status chip update, and short log line all agree.
- Piles and deck contents are inspectable: draw pile, discard, exhaust/void, deck size, card upgrades, and reward impact can be checked without leaving the flow.
- Rewards are contextual: the player can compare reward cards against the current deck, see what changed after selection, and understand why the next encounter starts.
- Run structure creates decisions between combats: map/path, encounter/reward/upgrade/rest/economy-style choices, escalating enemies, final goal, and summary.
- Polish supports pacing: turn transitions are short but readable; victory/defeat screens summarize the run; sound/visual effects reinforce action without hiding information.

## Comparison Findings

| Area | Current Ash Circuit | Benchmark Expectation | Gap |
| --- | --- | --- | --- |
| Card legibility | Cards have cost, description, and footer; type color helps. | Cards should also preview modified values and disabled reasons. | Medium |
| Hand layout | Five-card row is clean on desktop. | Cards should be easier to inspect, select, target, and compare during dense turns. | Medium |
| Energy clarity | Energy panel is prominent and disabled cards dim. | Energy spend should animate or pulse and cards should state why unavailable. | Medium |
| Attack/block feedback | Log records actions; HP/guard values update. | Damage/block numbers, HP bar animation, card travel, target line, and hit/block reactions should be visible. | High |
| Enemy intent | Intent is visible in center and enemy panel with value/effect. | Intent should use a compact icon taxonomy, preview target/effect, and animate when resolving. | Medium |
| Status effects | Focus and Fractured are visible. | Statuses need hover/click details and card-level math previews showing their impact. | High |
| Draw/discard clarity | Counts are shown and manual explains refill. | Piles should be clickable/inspectable, with reshuffle feedback and deck contents visible. | Medium |
| Reward flow | Reward modal appears; selected card starts encounter 2. | Reward should show current deck context, selection consequence, and post-choice confirmation. | Medium |
| Encounter transition | Encounter 2 starts immediately after reward. | Transition should frame the new opponent, retained HP, deck change, and objective. | Medium |
| Run structure | Two fixed encounters, one reward choice, final victory. | Genre leaders offer more route/deck decisions, escalating variety, and run summary. | High |
| Visual polish | Clean original abstract style, high contrast, stable layout. | Needs stronger scene identity, character/enemy differentiation, animation, juice, and audio affordances. | High |
| Accessibility/readability | Large desktop view is readable; focus outlines exist. | Needs stronger keyboard flow, reduced-motion option, tooltip access, mobile/narrow validation. | Medium |

## Prioritized Gaps

1. **High: Action feedback is too static.** The player can infer damage and block from changed numbers/log entries, but there is no strong visual chain from card -> target -> effect -> resulting state.
2. **High: Card consequences do not preview active modifiers.** Focus and Fractured are visible as statuses, but a normal player should see adjusted damage/block/draw outcomes before playing a card.
3. **High: Run structure is too shallow for benchmark comparison.** The two fixed fights prove the core loop, but leading deckbuilders build interest through repeated deck-shaping decisions.
4. **Medium: Piles/deck are not inspectable.** Counts are clear, but players cannot easily audit what remains, what was discarded, or how the reward changed the deck.
5. **Medium: Reward flow lacks deck context.** Reward cards are legible, but the player cannot compare them against the current deck from the modal.
6. **Medium: Enemy intent needs stronger iconography and resolution feedback.** The text is correct, but intent should be readable at a glance and visibly resolve.
7. **Medium: Start/results overlays are functional but not polished.** The dimmed HUD behind the start overlay is a known low issue; final victory is clear but sparse.

## Phased Builder Goal Plan

Each phase should be built by the deckbuilder builder and black-box tested by the deckbuilder tester with fresh `TEST_REPORT.md`, `expected-flow.md`, and `gameplay-recording.mp4`. The tester handoff should preserve the existing state/action clarity gate from `AGENTS.md`.

### Upgrade Phase 1: Combat Feedback And Math Preview

Builder goal:

- Add visible HP bars for player and enemy with animated deltas.
- Add floating damage, guard, draw, and status-change numbers for every played card and enemy attack.
- Add card play motion or a selected-card state that visually connects the card to the enemy/player target.
- Show modified card outcomes before play, including Focus and Fractured adjustments.
- Add disabled-card reason text on hover/focus or in a small inline hint.
- Keep all current deterministic combat rules unchanged.

Tester goal:

- Verify each card type produces visible feedback matching the final HP/guard/status/log values.
- Verify Focus and Fractured previews match resolved damage.
- Verify unaffordable cards explain why they cannot be played.
- Verify victory, defeat, End Turn, and restart still work.

### Upgrade Phase 2: Enemy Intent And Status Explainability

Builder goal:

- Replace text-only intent with original icon+label+number chips for attack, debuff, heavy attack, and mixed effects.
- Add a brief intent resolution animation that shows the enemy action, player guard absorption, HP loss, and status application.
- Add hover/focus tooltips or expandable chips for Focus and Fractured.
- Add an optional next-intent preview after the active intent, without exposing hidden implementation details beyond the documented deterministic cycle.

Tester goal:

- Verify every enemy intent displays before End Turn and resolves exactly as shown.
- Verify guard absorption, Fractured application, and Focus persistence are clear from normal play.
- Verify status help text is accessible by mouse and keyboard focus.

### Upgrade Phase 3: Deck, Draw, And Discard Inspection

Builder goal:

- Make draw pile, discard pile, and full deck counts clickable to open an inspectable list.
- Show card type, cost, and current upgraded/reward status in pile/deck views.
- Add reshuffle feedback when discard refills draw.
- Add a persistent deck-size/reward line that updates immediately after reward selection.
- Do not add copyrighted card names or effects from reference games.

Tester goal:

- Verify pile counts match visible card movement through draw, hand, discard, and reshuffle.
- Verify reward card appears in the deck and later in encounter 2.
- Verify pile/deck modals are readable and closable without breaking combat.

### Upgrade Phase 4: Reward Flow And Encounter Transition

Builder goal:

- Improve the reward modal with a current-deck summary and a "what this adds" confirmation after selection.
- Add an original short transition panel between encounters showing retained HP, selected reward, new enemy name, and next objective.
- Add a post-combat summary after each encounter: turns taken, damage dealt, damage blocked, cards played, and selected reward.
- Preserve the existing three reward choices unless the orchestrator explicitly approves scope expansion.

Tester goal:

- Verify encounter 1 reward choice is clear and only one card is added.
- Verify the selected reward is announced, persisted, and visible in encounter 2.
- Verify encounter transition does not hide or contradict HP/deck state.

### Upgrade Phase 5: Run Structure Expansion

Builder goal:

- Expand from two fixed encounters to an original short run with 4-6 nodes.
- Add simple route choices with original node types such as combat, repair, upgrade, remove, event, and final encounter.
- Add a small set of original enemy patterns that create different defensive/offensive decisions.
- Add card upgrade/remove decisions and a final run summary.
- Keep the game single-file and avoid copying any reference game's map shape, relic names, enemy identities, card effects, or UI skin.

Tester goal:

- Verify route choices are visible, selectable, and persist into subsequent combat.
- Verify deck changes from rewards/upgrades/removals survive across nodes.
- Verify the final encounter and run summary are reachable.
- Verify state/action clarity remains `PASS`: HP, energy, intent, statuses, deck changes, node choice, and final objective must be understandable from normal play.

## Near-Term Recommendation

Start with Upgrade Phase 1. It has the best payoff-to-risk ratio because it improves the player's moment-to-moment trust without changing the deterministic combat model that already passed. The builder should not expand run structure until the combat feedback layer is strong enough for testers to verify consequences visually.


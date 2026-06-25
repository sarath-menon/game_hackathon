# External Browser Game QA Report: Dungeons & Degenerate Gamblers Demo

## Verdict

PASS with nonblocking findings.

The demo was playable from the provided itch.io URL through run start, deck selection, tavern entry, and a first blackjack table interaction. No critical or high-severity blocker was found in the verified desktop browser path.

## Test Inputs

- Game: Dungeons & Degenerate Gamblers Demo
- URL: https://purplemosscollectors.itch.io/dndg
- Manual: /Users/sarathmenon/Documents/game_hackathon/external-qa/dungeons-degenerate-gamblers/README.md
- Browser: Chrome via browser-harness CDP, isolated profile on `BU_CDP_URL=http://127.0.0.1:9333`
- Primary viewport: 1728 x 996 CSS px, device pixel ratio 2
- Test date: 2026-06-25

## Evidence

- Evidence folder: /Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers/
- Continuous recording: /Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers/gameplay-recording.mp4
- Expected flow: /Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers/expected-flow.md
- Recording method: browser-harness CDP screenshots captured at 2 FPS, encoded with ffmpeg to H.264 MP4, 1280 x 738, 55.5 seconds, 111 frames.
- Supporting screenshots include `9333-menu-2.png`, `9333-after-newrun-multiclick.png`, `9333-after-deckchoose.png`, `9333-combat-1.png`, and `9333-table-clicks.png`.

## Summary

The itch.io player loaded without an auth wall. The first successful load took roughly 30-60 seconds depending on browser profile. The main menu, deck-selection screen, tavern story node, and first table encounter all rendered and accepted mouse input.

The core card-game state is understandable once at the table: player and bartender state, visible card totals, stand threshold, and `HIT` / `STAND` controls are readable. The manual is sparse, but the in-game UI provides enough immediate context to make legal actions discoverable during the first encounter.

## Findings

### F1: Main menu and map hit targets are less clear than their labels

- Severity: Medium
- Status: Open
- Repro steps:
  1. Launch the game from itch.io.
  2. At the main menu, click directly on the `New Run` text.
  3. If no transition occurs, click around the central logo/card art area.
  4. Later, at the tavern node, click the `ENTER` text baseline, then the tavern/door art.
- Expected: The visible label and its nearby art should have an obvious, forgiving click target.
- Actual: During exploratory testing, single clicks on the text label did not consistently advance; clicking nearby art/center regions did.
- Evidence: `9333-after-newrun.png`, `9333-after-newrun-multiclick.png`, `9333-table-1.png`, `9333-table-clicks.png`, `gameplay-recording.mp4`.
- Evidence clip: gameplay-recording.mp4 @ 00:10-00:28
- Evidence status: Main recording segment
- Why this evidence proves the finding: The segment shows the menu/tavern navigation path where visible labels and surrounding card/art regions had to be used before the run reached the table.

### F2: Embedded load time is long and progress feedback becomes sparse

- Severity: Medium
- Status: Open
- Repro steps:
  1. Open the itch.io page.
  2. Press `Run game`.
  3. Observe the developer splash/loading sequence before the main menu.
- Expected: The player should receive continuous progress feedback or a prompt if load is expected to take tens of seconds.
- Actual: The game eventually loaded, but the wait was long enough to appear stalled during one isolated-profile run before reaching the menu.
- Evidence: `after-run-verified.png`, `load-0.png` through `load-5.png`, `9333-menu.png`, `gameplay-recording.mp4`.
- Evidence clip: gameplay-recording.mp4 @ 00:00-00:12
- Evidence status: Main recording segment
- Why this evidence proves the finding: The recording begins with the itch launch and multiple splash/loading frames before the playable menu appears, demonstrating the long load and sparse progress feedback.

### F3: No visible in-game settings or volume controls found in first-run path

- Severity: Low
- Status: Open
- Repro steps:
  1. Launch the demo.
  2. Inspect main menu and first encounter visible controls.
  3. Look for settings, volume, accessibility, or restart/give-up controls in the visible UI.
- Expected: If audio or accessibility options are present, they should be discoverable from the menu or play surface.
- Actual: No clear settings/volume panel was found in the verified path. It may exist deeper in the demo or behind icons that were not safely verified.
- Evidence: `9333-menu-2.png`, `9333-table-clicks.png`.
- Evidence clip: gameplay-recording.mp4 @ 00:12-00:54
- Evidence status: Main recording segment
- Why this evidence proves the finding: The recording covers the main menu, run start, deck/map flow, and first table controls without a visible settings, volume, or accessibility panel in the exercised first-run path.

### F4: Itch embed competes with page chrome and below-page content

- Severity: Low
- Status: Open
- Repro steps:
  1. Run the game in the embedded itch player at desktop viewport.
  2. Observe the lower game area and surrounding itch page content.
- Expected: The active game surface should be visually isolated enough that bottom controls and cards are easy to parse.
- Actual: The game is playable, but the itch page content begins immediately below the embed, and the fullscreen icon sits close to the bottom edge. This slightly reduces readability in normal embedded mode.
- Evidence: `9333-table-clicks.png`, `final-recording-frame.png`.
- Evidence clip: gameplay-recording.mp4 @ 00:28-00:54
- Evidence status: Main recording segment
- Why this evidence proves the finding: The table sequence shows the game running inside the itch embed with surrounding page chrome/content visible near the lower edge of the active play surface.

## Readability / State-Action Clarity Assessment

PASS.

The blackjack table itself presents important state clearly enough for normal black-box play: player HP and score are on the left, bartender HP/chips and stand behavior are on the right, the rule text states that damage equals score difference and bust equals zero, and the central `HIT` / `STAND` actions are prominent. Deck selection also communicates locked versus unlocked decks with visible lock icons and explanatory text.

The main caveat is pre-table navigation: menu and tavern-node hit targets were less obvious than the labels suggested. This did not block completion of the first-run path, but it is a real usability issue for players using only visible cues.

## Regression / Coverage Checklist

- Page loads without auth wall: PASS
- Itch embedded `Run game` button works: PASS
- Game reaches main menu: PASS
- New run can be started: PASS with F1
- Deck selection shows locked/unlocked state: PASS
- Hearts deck can be selected and confirmed: PASS
- Tavern/story node can be entered: PASS with F1
- First table state is understandable: PASS
- `HIT` action changes visible state: PASS
- `STAND` action attempted: PASS, no blocker observed
- Illegal action clarity: NOT FULLY COVERED; no explicit illegal-action path was safely isolated before report cutoff
- Settings/options/volume: NOT FOUND in verified path
- Responsive/mobile layout: NOT VERIFIED; later harness tab attachment became unstable and the attempted probe attached to another open 9333 tab
- Fullscreen behavior: NOT VERIFIED for the same harness-target limitation
- Performance: PASS with F2 load-time concern

## Limitations

Testing was black-box and used only the supplied URL and manual. Source, implementation, and unrelated research notes were not inspected. Audio was not verified. True fullscreen and mobile responsive checks were not accepted as valid evidence because the final harness probe attached to a different open browser tab; those screenshots are intentionally excluded from the verdict.

## Approval Statement

PASS for the desktop embedded first-run path. The demo is accessible and playable through the first table interaction, with no verified critical or high-severity blocker. The open findings should be treated as usability and polish issues for hosted-game QA reporting.

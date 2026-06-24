# Expected And Observed Flow

## Expected Flow
1. Load the direct official browser build URL.
2. Reach the game menu and enter a normal playable run through visible controls.
3. At the table, verify readable HP, card names/values, score, chips, legal action controls, and turn feedback.
4. Use HIT and STAND to confirm visible state transitions and consequences.
5. Attempt at least one unavailable or out-of-state action if safely reachable.
6. Open menu/pause controls and inspect restart/give-up boundaries without confirming destructive progress loss.
7. Capture evidence and recording from the tested path.

## Observed Flow
1. `01-direct-build-menu.png`: Direct URL loaded into an initial branded splash/loading state.
2. `02-main-menu.png`: Main menu became visible. Continue and New Run were visible; the test used Continue as the normal visible route into play.
3. `03-after-continue-click.png`: First table state loaded with readable HP, opponent HP, cards/decks, chips, score area, and HIT/STAND buttons.
4. `04-after-hit-1.png` to `07-after-hit-4.png`: Repeated HIT actions updated visible player/opponent cards and score. The table remained readable, with HIT/STAND still available.
5. `08-after-stand-resolution.png`: STAND was selected to resolve the current state.
6. `09-post-resolution-hit-attempt.png` and `10-post-resolution-stand-attempt.png`: Post-resolution action attempts remained meaningful and advanced/updated the table state. Player HP and chip values changed visibly, so the test did not capture a clearly illegal or disabled action.
7. `11-pause-menu-open.png`: Escape opened the pause menu. Resume, Restart Run, Collection, Settings, Save and Quit, and Buy Full Game were visible.
8. `12-after-restart-run-click.png`: One safe click on Restart Run highlighted/selected the option without immediately destroying the run. No confirmation/cancel copy appeared before stopping to avoid destructive loss.

## Coverage Notes
- Playable state, HIT/STAND transitions, visible consequences, pause menu, and restart boundary were covered.
- Illegal/unavailable action feedback remains unproven because the attempted post-resolution actions appeared to be valid continued play rather than rejected actions.
- Restart confirmation/cancel wording remains partially unverified because no safe confirmation dialog appeared after one boundary click.
- No provider or environment blocker was observed.

## Artifacts
- Evidence folder: /Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-legality-restart-pass-1
- Recording: /Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-legality-restart-pass-1/gameplay-recording.mp4
- Report: /Users/sarathmenon/Documents/game_hackathon/evidence/external/dungeons-degenerate-gamblers-legality-restart-pass-1/TEST_REPORT.md

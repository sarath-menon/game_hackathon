# OvO Classic - Poki Retry 1 Expected/Observed Flow

Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo-poki-shared-window-retry-1`

## Expected Flow From Manual

1. Open `https://poki.com/en/g/ovo-classic`.
2. Reach an interactive Poki-hosted OvO Classic menu or playable level.
3. Focus the game frame if keyboard input is not active.
4. Start play from the visible menu.
5. Use left/right arrows to move.
6. Use `Space` to jump.
7. Use `Down` to slide.
8. Read level prompts, route, player position, platforms, hazards, and finish flag from normal play.
9. Reach the finish flag to complete or advance the level.
10. Verify reset/restart and pause/menu recovery if reachable.
11. Check visible settings/options/fullscreen/skin/mode controls if present.

## Observed Flow

1. `01-provider-loaded.png`: The assigned URL loaded and redirected to `https://poki.com/id/g/ovo-classic`. The Poki provider shell was visible and included the OvO Classic game area.
2. `02-iframe-visible-after-wait.png`: The OvO Classic iframe reached the main menu. Visible menu actions included `PLAY`, `RESTART`, `LEVELS`, `CREDITS`, language selection, skins/trophy/settings-style icon controls, and a provider fullscreen button.
3. `03-focused-game-surface.png`: The game frame accepted focus/click targeting.
4. `04-after-enter.png` and `05-after-space-start-jump.png`: The level started from the menu, showing the player avatar, timer, black platform geometry, tutorial text, and the prompt to use arrow keys.
5. `07-after-right-move.png`: Right movement changed the player position and camera framing.
6. `08-after-right-space-jump.png`: Jump input worked during right movement.
7. `09-after-right-down-slide.png`: Slide/low movement sequence advanced the player near the level end. The finish flag and "This is the end of the level" text were visible.
8. `10-after-left-move.png`: Left movement still responded after reaching the finish area.
9. `11-after-r-reset.png`: Reset returned the level to the beginning with a fresh early timer.
10. `12-after-escape-menu.png`: Escape opened the pause overlay with `BACK` and `QUIT`, confirming recovery/menu access during play.

## Recording

- `gameplay-recording.mp4` was encoded from 64 captured browser-harness frames at 10 FPS.
- The recording covers provider load, menu visibility, game focus, level start, movement, jump, slide/progression to finish area, reset, and pause overlay.

## Coverage Notes

- The finish area and flag were reached and readable, but a next-level transition after crossing the finish was not fully verified in this pass.
- Visible options/settings entry points were identified, but audio/fullscreen/settings persistence behavior was not deeply exercised because the pass prioritized reaching playable platforming and verifying core controls.

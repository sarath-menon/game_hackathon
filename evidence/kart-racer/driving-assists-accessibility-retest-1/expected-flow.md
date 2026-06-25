# Expected / Observed Flow - Arcade Kart Racer Driving Assists Retest 1

## Expected flow

1. Load `http://127.0.0.1:8765/games/kart-racer/index.html`.
2. Open Settings from the title screen.
3. Confirm handling, assist, visual/readability, camera/HUD, route marker, effects, and audio controls are visible and readable.
4. Toggle assist/readability controls and observe clear selected states.
5. Use Reset Defaults and confirm audio/UI sounds remain off with Volume `0%`.
6. Close Settings and start the race from a visible title control.
7. Confirm HUD, minimap, objective, route chevrons, CP1 marker, and checkpoint labels are readable and oriented correctly.
8. Drive forward, steer, drift/boost, brake/reverse, open Settings during race, close Settings, and restart.
9. Enable Auto-accelerate, start a race, and confirm the kart gains speed without holding accelerate while brake/reverse still responds.
10. Capture a narrow viewport to confirm the game remains usable without severe overlap.

## Observed flow

1. The hosted Kart page loaded and remained the active URL for all captured segments.
2. Settings opened from title with readable controls and visible selected states.
3. Assist toggles and visual/readability controls showed clear checked/unchecked states.
4. Reset Defaults displayed a reset confirmation and kept UI sounds off with Volume `0%`.
5. Closing Settings returned focus to the Settings opener; pressing Enter re-opened Settings, while clicking Start Race correctly began gameplay.
6. Race start showed objective text, speed/time/lap HUD, next checkpoint CP1, route chevrons, minimap, and normal upright chase-camera framing.
7. W acceleration, A/D steering, drift build/release feedback, and R restart were captured.
8. In-race Settings opened with pause copy and Escape closed it back to active race state.
9. Corrected Auto-accelerate evidence showed the control enabled, then speed increased without W input after race start.
10. Narrow viewport capture remained playable/readable, with dense HUD stacking but no game-blocking overlap.

## Coverage limits

- The evidence does not show a complete CP1 -> CP2 -> CP3 -> finish lap.
- Driving-assist variant mechanical differences were not fully compared in an A/B route-alignment test.
- Brake/reverse under Auto-accelerate was only smoke-checked.

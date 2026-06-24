# Expected / Observed Flow

Game: PolyTrack  
Provider: Poki  
Attempt: shared-window retry 1  
URL tested: https://poki.com/en/g/polytrack

## Evidence Hygiene

Earlier partial capture attempts in this assigned folder were discarded after stale-tab and duplicate-instance contamination were detected. The final evidence files in this folder were overwritten with a clean controlled Poki tab run. The verdict below is based only on that clean run.

## Expected Flow

1. Open the Poki PolyTrack provider page.
2. Wait for the embedded `games.poki.com` game iframe to finish the provider load/ad-break state.
3. Reach a playable PolyTrack menu or track.
4. Focus the game surface.
5. If a track is reachable, verify throttle, steering, route/camera readability, timer feedback, and reset/restart keys.
6. If options are visible, inspect settings/options for controls, audio, graphics/quality, camera/readability, reset/default behavior, and usability.
7. Record any provider, environment, or game blocker separately.

## Observed Flow

1. The provider opened successfully and redirected to the localized Poki route:
   - Observed URL: `https://poki.com/id/g/polytrack`
   - Screenshot: `01-provider-loaded.png`

2. The provider exposed a large visible game iframe:
   - Iframe source: `https://games.poki.com/...`
   - Screenshot: `02-iframe-visible-after-wait.png`

3. PolyTrack reached its in-game main menu:
   - Visible options: `Garage`, `Editor`, `Settings`, `Multiplayer`, `Play`
   - Screenshot: `02-iframe-visible-after-wait.png`

4. The clean run opened the in-game Settings screen:
   - Visible settings included language, units, reset hint, ghost car, default camera, cockpit camera mode, checkpoint display, cancel, reset, and apply.
   - Screenshots: `05-after-w-accelerate.png`, `16-settings-open-before-menu-recovery.png`

5. Track entry was not completed in the clean evidence:
   - The initial game-surface click landed on Settings instead of Play.
   - A later visible recovery attempt did not dismiss Settings or enter a track before the orchestrator follow-up requested completion from current evidence.
   - Screenshots: `18-after-play-click.png`, `21-after-track-w-accelerate.png`, `26-after-track-space-pause.png`

6. Because no drivable track was reached, keyboard driving, timer/run feedback, route/camera readability from a race start, and restart/reset behavior could not be verified.

## Result

The Poki provider is not fully blocked: it loads PolyTrack and reaches the game menu/settings. The test remains blocked at the browser-harness interaction layer because the clean shared-window automation did not reliably activate the Play flow or enter a drivable track. Final classification: `BLOCKED_ENVIRONMENT`.

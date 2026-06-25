# Arcade Kart Racer - Driving Assists And Control Accessibility Upgrade

## Expected Flow

1. Open the hosted game URL: `http://127.0.0.1:8765/games/kart-racer/index.html`.
2. Verify the title screen loads and the player-facing manual documents the controls/settings under test.
3. Open Settings from the title screen.
4. Verify visible assist/control settings, selected states, descriptions, persistence/reset behavior, and audio defaults.
5. Start a race and verify:
   - auto-accelerate behavior;
   - brake/reverse behavior;
   - stability/driving assist behavior;
   - brake/recovery and edge recovery behavior;
   - camera height and route cue changes;
   - reduced motion/effect changes;
   - in-race Settings open/close pause behavior;
   - CP1 -> CP2 -> CP3 -> finish completion;
   - restart, drift/boost, HUD/minimap/readability, and orientation.
6. Capture normal desktop and narrow-viewport evidence where stable.
7. Write `TEST_REPORT.md`, `expected-flow.md`, and `gameplay-recording.mp4`.

## Observed Flow Before Blocker

1. The hosted game URL loaded correctly in the shared Chrome/browser-harness surface:
   - `01-title-load.png`
   - `04-fresh-title-before-settings.png`
2. The Settings panel opened from the title state and displayed the expected top sections:
   - `02-title-settings-top.png`
   - `03-title-settings-mid.png`
   - `05-settings-top-visible.png`
3. Clean Settings evidence shows visible/readable controls for:
   - Steering sensitivity
   - Driving assist
   - Auto-accelerate
   - Stability assist
   - Brake / recovery assist
   - Edge recovery help
   - Effect intensity
   - Marker intensity
   - Reduced motion
   - High contrast readability
   - Camera distance
   - HUD scale
   - Minimap size
   - Show heading-up minimap
   - Show route chevrons
   - Route cue intensity
   - Camera height
   - Show checkpoint labels
   - Show input help
4. Visible toggles/checkmarks and slider/dropdown states were readable in the clean evidence:
   - `06-settings-after-top-toggles-dropdown.png`
   - `07-settings-after-assist-change.png`
   - `08-settings-after-page-down.png`
5. The browser-harness target then drifted to `http://127.0.0.1:8765/dashboard.html` during the controlled run. Dashboard-contaminated frames were removed and are not used for a game verdict.

## Blocked Areas

The environment blocked reliable testing of:

- Reset Defaults and audio off/volume 0 verification.
- Settings persistence/reload.
- Auto-accelerate movement.
- Brake/reverse movement.
- Driving/stability assist mechanical differences.
- Brake/recovery and edge recovery behavior.
- Camera height behavior in race.
- Route cue intensity behavior in race.
- Reduced effects/reduced motion behavior in race.
- In-race Settings open/close and focus recovery.
- CP1 -> CP2 -> CP3 -> finish completion.
- Restart, drift/boost, and full orientation/readability regression.
- Narrow viewport.

## Recording

- `gameplay-recording.mp4` was encoded only from clean Kart screenshots.
- Contaminated dashboard frames were removed before encoding.


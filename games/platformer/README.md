# Skyline Stepper

Skyline Stepper is a single-file browser game that scrolls across a rooftop route. Reach the green exit beacon at the far end of the level to complete the run.

## Objective

Start the run, move right through the side-scrolling level, collect glow cores, avoid red vent hazards, and touch the visible green `EXIT` beacon.

## Controls

- Start: `Enter` on the title screen or click `Start Run`
- Restart: `Enter` or click `Run Again` after completion or failure
- Move: `A` / `D` or `Left Arrow` / `Right Arrow`
- Jump: `W`, `Up Arrow`, or `Space`
- Settings: click `Settings` or press `Escape`

## Jump Feel

Jump input has a small forgiveness window: pressing jump just after leaving a ledge can still jump, and pressing jump just before landing can trigger on landing. Tap jump for a shorter hop or hold jump for a higher, floatier jump.

## Settings

Open settings from the title screen, during play, or after a run. Opening settings during play pauses the run until the panel closes. Settings save on this device and persist across reloads.

Available settings:

- Jump Assist: changes the coyote-time and jump-buffer forgiveness profile. Default: `Standard`.
- Air Control: changes how strongly left/right movement responds while airborne. Default: `Steady`.
- Damage Profile: `Standard` keeps normal health loss, `Gentle` adds longer recovery after damage, and `Practice` respawns after hazards without losing health. Default: `Standard`.
- Checkpoint Assist: when enabled, respawns start from the mid-level marker even before it is touched. Default: `Off`.
- Camera Smoothing: changes how quickly the camera follows the player. Default: `12`.
- Camera Lookahead: changes where the player sits in the camera frame. Default: `42%`.
- Route Marker Intensity: changes safe-deck and optional-route marker visibility. Default: `100%`.
- Route Cue Style: chooses full lines plus labels, lines only, or labels only. Default: `Full`.
- High-Contrast Hazards: adds bright outlines and stripe cues to red vents and orange patrol runners. Default: `Off`.
- Objective Labels: changes EXIT, checkpoint, and route-label size. Default: `Normal`.
- Effect Intensity: changes glow, landing, and feedback effect strength. Default: `100%`.
- Reduced Motion: minimizes decorative pulsing and blink effects. Default: `Off`.
- HUD/Text Size: changes HUD label size. Default: `Normal`.
- Background Detail: chooses full parallax, reduced parallax, or static background drawing. Default: `Full Parallax`.
- Generated UI Sounds and Volume: sounds are off with volume `0%` by default. Enable this setting to opt in to simple generated tones for actions and results.
- Reset Defaults: restores the original settings, saves them, and returns generated sounds to off with volume `0%`.

## Win Behavior

The level is complete when the player touches the green exit beacon. A `Level Complete` message appears and shows how many glow cores were collected plus how much health remained.

## Hazards And Damage

Red vent hazards and orange patrol runners damage the player on contact. Vents can be jumped over on the upper route, patrol runners move back and forth on optional upper platforms, and the lower deck provides a safe path to the exit. Taking damage removes 1 health and respawns the player at the current checkpoint with a brief invulnerability blink. The run starts with 3 health.

The small red vent left of the start is optional and provides a clear way to trigger repeated damage. Repeated contact with hazards or patrol runners can end the run.

If health reaches 0, the run ends and a summary shows how many glow cores were collected before failure.

## Checkpoint And Restart

Touch the mid-level checkpoint marker to make it the new respawn point. After Level Complete or Run Ended, press `Enter` or click `Run Again` to restart from the title run state with health and collectibles reset.

## Collectibles

Blue glow cores are optional collectibles placed through the route. The HUD shows the current count and the total number available.

## Browser Requirements

Use a current desktop browser with JavaScript and HTML canvas enabled. The game is self-contained in `index.html` and does not require network assets.

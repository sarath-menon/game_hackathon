# Skyline Stepper Settings Polish 2 Retest 1 Expected/Observed Flow

## Test Inputs

- Game URL: http://127.0.0.1:8765/games/platformer/index.html
- Manual URL: http://127.0.0.1:8765/games/platformer/README.md
- Manual path: /Users/sarathmenon/Documents/game_hackathon/games/platformer/README.md
- Evidence folder: /Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-1
- Browser surface: shared Chrome window through browser-harness
- Desktop viewport: approximately 1519 x 981 page size

## Expected Flow From Manual

1. Load the game and verify the active URL is the Platformer game URL.
2. Open Settings from the title screen.
3. Reset defaults before judging defaults if stale saved settings are present.
4. Verify documented defaults and variants for Air Control, Damage Profile, Checkpoint Assist, Route Cue Style, High-Contrast Hazards, Objective Labels, Background Detail, and audio off/Volume 0.
5. Verify Reset Defaults, persistence/reload, and audio remains off after reset.
6. Verify Settings from in-run, failure, and completion contexts where reachable.
7. Smoke-check gameplay: route readability, checkpoint/respawn, Standard damage/failure, lower-deck completion, collectibles/hazards/exit/restart, and narrow viewport usability.

## Observed Flow

1. `01-url-verified-title.png` shows the Platformer game loaded at the assigned URL.
2. `02-title-settings-open.png` shows Settings opened from the title state. The panel opened scrolled lower in the list, exposing audio and reset controls first.
3. `03-after-reset-defaults-top.png` shows Reset Defaults restored the documented defaults: Air Control `Steady`, Damage Profile `Standard`, Checkpoint Assist off, Route Cue Style `Full`, High-Contrast Hazards off, Objective Labels `Normal`, Background Detail `Full Parallax`, and audio off/Volume `0%`.
4. `04-air-control-snappy.png` through `16-high-contrast-on.png` are clean Platformer screenshots from variant-control attempts while the active URL had been verified earlier in the segment. The visible select values did not change in the final DOM/value readout before the blocker.
5. Before the next selector-dispatch segment could continue, the required URL check returned `http://127.0.0.1:8765/dashboard.html` instead of the Platformer URL. Per anti-contamination rule, browser actions stopped immediately.

## Blocker

The shared browser-harness target drifted from the Platformer game tab to the project dashboard before gameplay regression, persistence/reload, reset follow-up, completion/failure context checks, and narrow viewport checks could be completed.

## Recording

- Recording path: /Users/sarathmenon/Documents/game_hackathon/evidence/platformer/settings-polish-2-retest-1/gameplay-recording.mp4
- Recording method: screenshots `01` through `16` encoded at 2 fps with `ffmpeg`.
- No contaminated screenshots were captured after the URL drift; the run stopped at the failed URL check.

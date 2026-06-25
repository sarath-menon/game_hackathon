# OvO Classic - Finish Transition And Settings/Options Follow-Up 1 Expected/Observed Flow

## Test Surface

- Provider URL: `https://poki.com/en/g/ovo-classic`
- Observed URL after load: `https://poki.com/id/g/ovo-classic`
- Manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/ovo-poki/README.md`
- Browser surface: shared Chrome via browser-harness, 782 x 859 CSS viewport
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo-poki-finish-settings-followup-1/`

## Expected Flow

1. Provider page loads and the embedded OvO Classic game becomes interactive.
2. The main menu exposes Play and supporting menu controls such as restart, levels, settings/options, achievements/trophy, language, credits, skin, and provider fullscreen where available.
3. Selecting Play starts a playable level with a visible timer, player character, route geometry, and control prompts.
4. Keyboard focus remains in the game after clicking inside the frame.
5. Movement, jump, slide, pause, and restart/reset affordances are discoverable from the manual or visible UI.
6. Crossing the finish flag or finish area should clearly signal completion, advance, restart, or otherwise show the next state.
7. Pause should clearly stop play and expose a readable resume/back or quit path.
8. Options/settings should expose audio/mute or volume controls if available, plus any visible mode, input, device, data, language, skin, level, trophy, or help surfaces.
9. Provider or environment issues should be classified separately from game-quality findings.

## Observed Flow

1. `01-provider-load.png` shows the Poki provider page loading the game frame. The `/en/` URL redirected to the Indonesian `/id/` shell.
2. `02-after-wait.png` shows the OvO Classic main menu loaded inside the provider frame with Play, Restart, Levels, Credits, settings/wrench, trophy, language, random skin, and provider fullscreen affordances visible.
3. `03-after-play-click.png` shows Level 1 started, with timer and route visible.
4. `04-after-basic-key-inputs.png` confirms keyboard focus and movement/slide response. The player moved right from the start prompt.
5. `05-route-right-1.png` through `11-route-right-4.png` show a continuous rightward route attempt, including the visible finish flag and end-of-level prompt.
6. `12-finish-hop-attempt.png`, `13-after-finish-crossing.png`, and `14-level-end-transition.png` show crossing the finish area and advancing to Level 2.
7. `15-after-pause-click.png`, `16-after-escape.png`, and `17-after-escape-second.png` show pause/back behavior and Escape toggling pause state.
8. `18-after-pause-quit.png` shows a final-time modal after choosing Quit from pause, with a readable result and Quit button.
9. `23-after-final-time-quit-to-menu.png` shows return to the main menu after final-time Quit.
10. `24-after-main-menu-wrench.png` shows the settings/options screen with Music and Sounds sliders, Hard Mode and Advanced Mode toggles, Data, Device, Inputs, and Back controls.
11. `26-after-main-menu-levels.png` and `31-after-inputs-close.png` show the Inputs modal with visible Up/Down/Left/Right bindings.
12. `33-after-levels-panel.png` through `37-after-random-skin-final.png` remained on the Inputs/settings overlay, so deeper level/trophy/skin interaction was not conclusively completed in this pass.
13. `gameplay-recording.mp4` is encoded from the ordered screenshot sequence at 2 fps.

## Coverage Limits

- Reset/restart was visible but not conclusively exercised after gameplay began.
- Provider fullscreen was visible but not clicked to avoid destabilizing the shared Chrome window.
- Music/Sounds sliders were visible but not changed aggressively because audio playback was not required and loud audio was intentionally avoided.
- Narrow/mobile viewport was not attempted in this pass to avoid destabilizing the playable provider state.

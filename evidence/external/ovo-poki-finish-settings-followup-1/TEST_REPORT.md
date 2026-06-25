# OvO Classic - Finish Transition And Settings/Options Follow-Up 1

## Verdict

`PASS_WITH_FINDINGS`

OvO Classic on Poki reached playable state in the shared Chrome/browser-harness surface. Core movement, route readability, level start, pause, finish transition, and main-menu options discovery were verified. The pass has nonblocking findings around provider locale mismatch, control/manual consistency, and incomplete deeper menu coverage after the Inputs modal remained active.

## Test Inputs

- Provider URL: `https://poki.com/en/g/ovo-classic`
- Observed provider URL: `https://poki.com/id/g/ovo-classic`
- Manual: `/Users/sarathmenon/Documents/game_hackathon/external-qa/ovo-poki/README.md`
- Browser: shared Chrome controlled by browser-harness only
- Viewport: 782 x 859 CSS pixels; screenshots saved at 1564 x 1718 device pixels
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo-poki-finish-settings-followup-1/`
- Recording: `/Users/sarathmenon/Documents/game_hackathon/evidence/external/ovo-poki-finish-settings-followup-1/gameplay-recording.mp4`
- Recording method: browser-harness screenshot sequence encoded to MP4 at 2 fps, 37 frames, 18.5 seconds, 1564 x 1718

## Summary

- Provider loaded and the embedded OvO Classic game reached the main menu after a short preparing/loading state.
- Play started Level 1 with visible timer, player, prompts, and route geometry.
- Keyboard input worked after focusing the game frame. Right movement and slide were verified; Up jump was required by the visible prompt to complete the finish hop.
- Crossing the Level 1 finish flag advanced to Level 2, clearly signaling level completion/progression.
- Pause worked through the visible pause button and Escape toggled pause back on/off.
- Quit from pause produced a readable final-time modal and returned to the main menu through its Quit button.
- Settings/wrench opened a readable options screen with Music and Sounds sliders, Hard Mode, Advanced Mode, Data, Device, Inputs, and Back controls.
- Inputs opened a readable bindings panel for Up, Down, Left, and Right.
- No crash, softlock, severe frame stall, or provider startup blocker occurred.

## Findings

### Low - Provider `/en/` URL Redirects To Indonesian Shell

- Status: Open
- Evidence clip: gameplay-recording.mp4 @ 00:00-00:11
- Evidence status: Video shows the localized Poki provider shell around the playable embed; screenshots and the observed URL line provide the exact redirected `/id/` URL.
- Why this evidence proves the finding: The clip starts on the Poki wrapper with Indonesian shell text visible while the OvO Classic embed loads into an English game menu, matching the reported shell/game language mismatch.
- Evidence: `01-provider-load.png`, `02-after-wait.png`
- Repro steps: Open `https://poki.com/en/g/ovo-classic` in the shared Chrome/browser-harness surface.
- Expected: Provider shell remains English, or locale behavior is predictable from the requested URL.
- Actual: Page redirected to `https://poki.com/id/g/ovo-classic`; provider chrome and page text were Indonesian while the game UI remained English.
- Impact: Nonblocking. Gameplay was still reachable, but provider-shell labels such as fullscreen/report/support are less clear for an English manual path.

### Low - Jump Control Is Ambiguous Between Manual And Visible Game Prompt

- Status: Open
- Evidence clip: gameplay-recording.mp4 @ 00:01-00:06
- Evidence status: Video proves the in-game prompt and successful finish path; manual mismatch is documented in the report inputs/manual reference.
- Why this evidence proves the finding: The clip shows Level 1 displaying the Up-key jump prompt during route traversal, then the player reaches the finish transition and Level 2, demonstrating that the visible Up prompt was the actionable jump control for completion.
- Evidence: `04-after-basic-key-inputs.png`, `11-route-right-4.png`, `12-finish-hop-attempt.png`, `14-level-end-transition.png`, `26-after-main-menu-levels.png`
- Repro steps: Start Level 1 and follow the visible route to the end-of-level hop.
- Expected: Manual and visible controls should align, or the game should make the active jump key unmistakable.
- Actual: Manual lists Space for jump, but the game prompt and Inputs screen show Up. Using the visible Up prompt completed the finish transition.
- Impact: Nonblocking because the manual allows using visible controls if they differ, but first-time keyboard users may hesitate when Space does not match the in-game prompt.

### Low - Deeper Menu Coverage Was Limited After Inputs Overlay Stayed Active

- Status: Coverage limitation
- Evidence clip: gameplay-recording.mp4 @ 00:11-00:18
- Evidence status: Video clip supports the limitation.
- Why this evidence proves the finding: The clip shows the main menu/settings route reaching the options screen and then the Inputs panel, after which the recording remains on that Inputs overlay through the final frames instead of returning to cleanly exercise Levels, Trophy, or Skin panels.
- Evidence: `24-after-main-menu-wrench.png`, `26-after-main-menu-levels.png`, `31-after-inputs-close.png`, `33-after-levels-panel.png`, `37-after-random-skin-final.png`
- Repro steps: From main menu, open the wrench/settings screen and then open Inputs.
- Expected: Inputs should be easy to close with visible close/back controls or keyboard Escape, allowing quick return to Levels/Trophy/Skin checks.
- Actual: The Inputs overlay remained active through the tested close/Escape/back-route captures, so Levels, Trophy, and Random Skin were visible on the menu but not conclusively exercised afterward.
- Impact: Nonblocking for core playability. It leaves deeper cosmetics/level-select/achievement coverage partial in this follow-up.

## Coverage Table

| Area | Result | Evidence |
| --- | --- | --- |
| Provider reaches game | Pass | `01-provider-load.png`, `02-after-wait.png` |
| Menu starts level | Pass | `02-after-wait.png`, `03-after-play-click.png` |
| Keyboard focus | Pass | `04-after-basic-key-inputs.png` |
| Movement | Pass | `04-after-basic-key-inputs.png`, `05-route-right-1.png` |
| Jump | Pass with note | `11-route-right-4.png`, `12-finish-hop-attempt.png`, `14-level-end-transition.png` |
| Slide | Pass | `04-after-basic-key-inputs.png`, `08-route-right-slide-1.png` |
| Finish transition | Pass | `11-route-right-4.png`, `12-finish-hop-attempt.png`, `13-after-finish-crossing.png`, `14-level-end-transition.png` |
| Pause | Pass | `15-after-pause-click.png`, `16-after-escape.png`, `17-after-escape-second.png` |
| Quit/final-time result | Pass | `18-after-pause-quit.png`, `23-after-final-time-quit-to-menu.png` |
| Settings/options | Pass with findings | `24-after-main-menu-wrench.png`, `26-after-main-menu-levels.png` |
| Audio controls | Visible, not adjusted | `24-after-main-menu-wrench.png` |
| Inputs/help | Pass | `26-after-main-menu-levels.png`, `31-after-inputs-close.png` |
| Levels/trophy/skin | Partial | `02-after-wait.png`, `23-after-final-time-quit-to-menu.png`, `33-after-levels-panel.png` |
| Provider fullscreen | Visible, not clicked | `02-after-wait.png`, `23-after-final-time-quit-to-menu.png` |
| Reset/restart | Visible, not conclusively exercised | `02-after-wait.png`, `03-after-play-click.png` |
| Narrow/mobile viewport | Not attempted | Coverage limited to desktop shared-window viewport |

## Usability And Accessibility Assessment

State readability is strong in the core path: the player, route, finish flag, timer, pause overlay, final-time modal, and Level 2 transition are readable at the tested viewport. Keyboard-only play is viable once the game frame is focused, but the player must trust the visible Up prompt rather than the manual's Space control. Provider-shell localization may reduce clarity for non-Indonesian players, but it does not hide the game.

The settings screen is readable and exposes useful controls. However, icon-only menu targets and the sticky Inputs overlay make deeper options traversal less clear than the core gameplay path.

## Performance And Load

Initial provider load showed a short preparing state before the in-game menu appeared. Gameplay, route traversal, pause, finish transition, and settings screens responded without obvious frame stalls, crashes, or input lag in the tested path.

## Provider/Environment Classification

No provider or environment blocker occurred. The provider did redirect to an Indonesian shell, but the embedded game loaded and remained playable. The local shared Chrome/browser-harness environment was reliable for this pass.

## QA Methodology Carry-Forward

- For platformers, always compare manual controls with the game's own in-level prompts and settings/input bindings before judging movement failures.
- Capture the actual finish transition separately from any later quit/final-time flow; they can represent different state changes.
- When provider shells localize unexpectedly, record the final URL and distinguish shell-language friction from gameplay failure.
- For menu-heavy external games, test one modal at a time and capture a clean return-to-menu state before opening the next panel.

## Final Statement

Approved as `PASS_WITH_FINDINGS` for this follow-up. The game is playable and the finish transition is verified. Remaining items are nonblocking and should guide future deeper options/cosmetics/reset coverage rather than block this provider path.

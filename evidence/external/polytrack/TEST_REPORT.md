# PolyTrack External QA Report

Game: PolyTrack

Verdict: `BLOCKED_PROVIDER`

Status: `PROVIDER/STARTUP BLOCKED - NEEDS RETRY`

Date: 2026-06-25

## Test Inputs

- Game URL: https://www.kodub.com/apps/polytrack
- Manual: /Users/sarathmenon/Documents/game_hackathon/external-qa/polytrack/README.md
- Browser: Browser-harness remote Chromium, Chrome/140 user agent
- Viewport tested: 1512 x 770 CSS pixels
- Local harness note: local Chrome harness became blocked by a Chrome remote-debugging permission prompt after daemon restart, so the completed evidence pass used the required browser-harness remote browser.

## Evidence

- Evidence folder: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack/
- Continuous recording: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack/gameplay-recording.mp4
- Expected flow: /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack/expected-flow.md
- Key screenshots:
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack/remote-menu.png
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack/after-reset-reload.png
  - /Users/sarathmenon/Documents/game_hackathon/evidence/external/polytrack/after-ok.png
- Recording method: browser-harness screenshots assembled into MP4 at 30 FPS. The recording documents the continuous blocked-load and recovery-attempt sequence rather than gameplay, because gameplay was not reachable.

## Summary

PolyTrack did not reach a playable menu or track through the tested provider path. The page loaded, then displayed an unexpected error screen: `Uncaught TypeError: Cannot read properties of undefined (reading 'autoReset')` from `https://app-polytrack.kodub.com/0.6.2/main.bundle.js`, line 20, column 316202. A hardware acceleration warning was also shown. The visible `Reset Settings`, `Reload`, and `OK` recovery path did not clear the startup error.

Because the game never became playable, gameplay controls, route readability, restart/reset in a run, performance during play, fullscreen behavior during play, and settings/options behavior beyond the visible error-screen controls could not be validated. This is not a final game-quality `FAIL`; it is a provider/startup blocker that requires alternate URL/provider retries under the external QA protocol.

## Findings

### P0 - Startup Runtime Error Blocks All Gameplay

- Severity: Critical
- Status: Open
- Repro steps:
  1. Open https://www.kodub.com/apps/polytrack in browser-harness remote Chromium.
  2. Wait for the game to load.
  3. Observe the startup screen.
- Expected behavior: The game should load to a start/menu screen or playable track, or provide a clear unsupported-browser message before throwing an internal exception.
- Actual behavior: The game displays an unexpected error screen before gameplay: `Cannot read properties of undefined (reading 'autoReset')`.
- Evidence: `gameplay-recording.mp4`, `remote-menu.png`, `after-reset-reload.png`
- Evidence clip: `gameplay-recording.mp4 @ 00:00-00:05`
- Evidence status: Clip available.
- Why this evidence proves the finding: The recording shows the tested provider path sitting on the PolyTrack startup exception and hardware-acceleration warning instead of reaching a menu, track, or other playable state.
- Impact: Blocks all black-box gameplay QA and prevents normal player access in this browser environment.

### P1 - Visible Recovery Controls Do Not Recover From Startup Error

- Severity: High
- Status: Open
- Repro steps:
  1. From the startup error screen, click `Reset Settings`.
  2. Click `Reload`.
  3. Dismiss the hardware acceleration warning with `OK`.
- Expected behavior: Recovery controls should either restore default settings and reload successfully, or clearly state that the environment is unsupported and play cannot continue.
- Actual behavior: The same startup exception remains after reset/reload, and dismissing the warning does not reveal a playable menu.
- Evidence: `gameplay-recording.mp4`, `after-reset-click.png`, `after-reset-reload.png`, `after-ok.png`
- Evidence clip: `gameplay-recording.mp4 @ 00:05-00:08`
- Evidence status: Clip available.
- Why this evidence proves the finding: The recording continues through the recovery-attempt portion and ends with the same startup exception state still visible, proving the in-page controls did not recover gameplay in the captured run.
- Impact: Players who encounter this state have no effective in-page recovery path.

### P2 - Duplicate Instance Handling Was Observed But Not Fully Tested

- Severity: Medium
- Status: Informational / Limited
- Repro steps:
  1. Open a second PolyTrack tab in the same local Chrome profile.
  2. Observe the second tab.
- Expected behavior: If duplicate instances are unsupported, the game should clearly tell the user which tab can continue.
- Actual behavior: A clear message appeared: another PolyTrack instance is open and the player should switch to that tab/window.
- Evidence: `polytrack-menu.png`
- Evidence clip: Needs Evidence Clip
- Evidence status: Screenshot-only evidence available in same folder as `polytrack-menu.png`; the assigned `gameplay-recording.mp4` documents the later startup-error sequence and does not capture the duplicate-instance setup.
- Why this evidence proves the finding: The same-folder screenshot documents the duplicate-instance message, but the existing MP4 cannot independently prove this informational item without fabricating a timestamp.
- Impact: The message is understandable, but duplicate-tab behavior could not be expanded into full gameplay testing due the later harness attachment and startup limitations.

## Readability / Route Clarity Assessment

Result: `BLOCKED_PROVIDER`

The route/readability gate cannot pass because the playable track is never reached. The startup error is clear enough to identify that the game is blocked, but there is no start pose, car position, route, timing UI, or driving surface to evaluate. Blocker classification: runtime startup error/environment compatibility, with a secondary hardware acceleration warning.

## Regression / Coverage Checklist

- Load/accessibility: `BLOCKED_PROVIDER` - page loads but the provider path fails at startup.
- Keyboard focus and controls: `BLOCKED` - no playable state reached.
- Driving controls: `BLOCKED`
- Route/readability: `BLOCKED`, approval gate `FAIL`
- Timer/run feedback: `BLOCKED`
- Restart/reset during run: `BLOCKED`
- Error recovery/reset settings: `BLOCKED_PROVIDER`
- Settings/options: `LIMITED` - visible music/fullscreen controls were seen on an earlier loading screen, but full options QA was blocked by startup failure.
- Fullscreen/responsive gameplay: `BLOCKED`
- Performance during play: `BLOCKED`
- Browser checks: `LIMITED` - remote browser failed with hardware acceleration disabled; local harness became blocked by Chrome remote-debugging permission after restart.

## Limitations

This report uses only the provided URL and manual as gameplay inputs. No source, implementation, unrelated research notes, or other tester work was inspected. The hosted game could not be fixed. Because gameplay was inaccessible, this is a blocked startup/provider report rather than a full playthrough report. The orchestrator must retry with at least two alternate reputable/direct playable URLs or provider paths before assigning any final untestable status.

## Approval Statement

Not approved for gameplay QA yet. Current status is `BLOCKED_PROVIDER`, not final `FAIL`, because this provider path never reached a playable menu or track. A retry with alternate reputable/direct URLs is required before the game can be judged or marked untestable in the current environment.

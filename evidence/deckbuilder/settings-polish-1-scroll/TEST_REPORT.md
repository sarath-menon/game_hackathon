# Turn-Based Deckbuilder / Ash Circuit - Settings Panel Polish 1

Verdict: PASS

## Test Inputs

- Game URL: `http://127.0.0.1:8765/games/deckbuilder/index.html`
- README/manual: `http://127.0.0.1:8765/games/deckbuilder/README.md`
- Browser: Chrome 149.0.7827.115 through browser-harness CDP, isolated `deckbuilder-polish` profile
- Viewports: desktop `1200x900` requested, observed `1200x953`; narrow `430x820`
- Evidence folder: `/Users/sarathmenon/Documents/game_hackathon/evidence/deckbuilder/settings-polish-1-scroll`
- Recording method: browser-harness screenshots encoded with ffmpeg to H.264 MP4 at 10 FPS
- Recording file: `gameplay-recording.mp4`, 79 frames, 7.9s, `1200x954`

## Summary

The prior usability issue is fixed. Settings now opens at the top with the Settings title and Animation speed control clearly visible from both the title/start state and the combat header. After scrolling the settings panel down, closing it, and reopening it, the panel returns to the top instead of preserving the scrolled-down position. Narrow viewport behavior also passes: Settings opens at the top, and Reset Defaults plus Close remain reachable through internal scrolling.

Smoke regression passed for open/close, defaults, persistence, reset defaults, combat input after closing Settings, card play, End Turn, and runtime stability.

## Findings

No open findings.

## Settings Polish Checklist

- Settings opens from title/start with title visible: PASS.
- Settings opens from title/start with first setting/control visible: PASS. Animation speed select was fully visible at `y=207` to `bottom=246` inside a `953px` viewport.
- Title/start scroll-close-reopen resets to top: PASS.
- Settings opens from combat header with title visible: PASS.
- Settings opens from combat header with first setting/control visible: PASS. Animation speed select was fully visible at `y=207` to `bottom=246` inside a `953px` viewport.
- Combat-header scroll-close-reopen resets to top: PASS.
- Narrow viewport opens at top: PASS.
- Narrow viewport first setting/control visible: PASS. Animation speed select was fully visible at `y=278` to `bottom=317` inside an `820px` viewport.
- Narrow viewport bottom controls reachable by scrolling: PASS. Reset Defaults and Close were visible at the bottom.
- Open/close smoke: PASS.
- Defaults smoke: PASS. Active summary showed standard animations, motion on, detailed previews, normal text, standard feedback, saved.
- Persistence smoke: PASS. Large text persisted across reload while persistence was enabled.
- Reset Defaults smoke: PASS. Reset restored documented defaults.
- Combat input after closing settings: PASS. Strike played successfully after closing Settings.
- End Turn after closing settings: PASS.
- Runtime errors: PASS. Captured runtime error list was empty.

## State/Action Clarity Assessment

PASS. Settings no longer hide the first documented control on open or reopen. Important settings state, available actions, defaults, persistence/reset behavior, combat actions, and turn progression remained clear during normal play.

## Regression Checklist

- Hosted game loads: PASS.
- README/manual matches tested settings behavior: PASS.
- Settings from title/start: PASS.
- Settings from combat header: PASS.
- Settings close/reopen: PASS.
- Settings internal scrolling: PASS.
- Persistence and reset defaults: PASS.
- Start run: PASS.
- Card play: PASS.
- Energy/action feedback after Strike: PASS.
- End Turn: PASS.
- No blocking console/runtime errors: PASS.

## Evidence References

- Continuous recording: `gameplay-recording.mp4`
- Expected/observed flow: `expected-flow.md`
- Observation log: `run-observations.json`
- Title open at top: `02-title-settings-open-top.png`
- Title reopen after scroll: `05-title-settings-reopen-after-scroll.png`
- Combat open at top: `11-combat-settings-open-top.png`
- Combat reopen after scroll: `14-combat-settings-reopen-after-scroll.png`
- Narrow open at top: `18-narrow-settings-open-top.png`
- Narrow bottom controls: `19-narrow-settings-scrolled-bottom.png`
- Combat input smoke: `15-card-play-after-settings.png`, `16-end-turn-after-settings.png`

## Approval Statement

Approved for Settings Panel Polish 1. Verdict is PASS because the initial scroll and first-control visibility issue is resolved, required evidence files are complete, state/action clarity passes, and no unresolved findings remain.

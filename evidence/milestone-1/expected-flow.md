# Milestone 1 Expected Flow

## Inputs

- Game URL: http://127.0.0.1:8765/index.html
- Manual: http://127.0.0.1:8765/README.md
- Controls used: **Start Run**, `W`, `A`, `S`, `D`

## Expected Recording Behavior

The recording should show the Signal Runner title/start screen loading from the hosted URL. Selecting **Start Run** should begin gameplay and change the status to **In transit**.

The courier drone should respond to keyboard movement. The flow intentionally pushes the courier against the lower-left boundary first; the courier should remain inside the play area and not pass through the boundary barrier.

The courier should then navigate around the city wall layout toward the yellow **Dock 01** target. The route includes visible wall contact/avoidance near the central and right-side barriers before moving around the vertical wall into the dock area.

When the courier reaches **Dock 01**, the game should trigger the win state: the top status should read **Delivered**, and the screen should show the **Delivered** overlay with the message that the signal reached Dock 01.

## Evidence Files

- `gameplay-recording.mp4`: screen recording of the Milestone 1 tested flow
- `expected-flow.md`: this expected-behavior description

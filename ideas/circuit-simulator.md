# Idea: Circuit Simulator (audio first)

Status: idea only, no code yet.
Recorded: 2026-10-21

## Summary

An app for building and simulating a circuit interactively. You feed it a
signal, add components, and see and hear how each one changes that signal.
Once the circuit does what you want, the app turns it into a schematic.

## Starting use case: audio circuits

Examples: tone controls, filters, fuzz and overdrive pedals, preamps.

## Core features

1. **Input source**: choose what goes into the circuit:
   - an audio interface
   - a sound card input
   - a generated sine wave (and possibly other test signals later)
2. **Build the circuit**: select components (resistors, capacitors, diodes,
   op-amps, transistors, pots, ...) and add them to the circuit.
3. **See the effect**: view how the circuit changes the input signal, for
   example with a waveform or scope view, a frequency response, and listening
   to the output.
4. **Generate a schematic**: once the circuit is right, export it as a
   proper schematic.

## Nice to have

- **Circuit board (PCB) design** generated from the schematic.

## Open questions for later

- Platform: web app (Web Audio API for input and output) or desktop app?
- Simulation engine: write our own, or use an existing one (for example
  ngspice compiled to WebAssembly)?
- Real-time processing versus offline rendering for heavier circuits.
- Schematic and PCB export formats (for example KiCad, SVG, PDF, Gerber).

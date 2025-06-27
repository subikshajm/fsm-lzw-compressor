# fsm-lzw-compressor
An FSM-based Verilog implementation of a simplified LZW compressor.
# FSM-Based LZW Compressor (Verilog)

This is a simplified **Finite State Machine (FSM)**-based implementation of an LZW-style compressor written in Verilog.

**Note**: This project demonstrates the *structural flow* of LZW compression using FSMs, but does not implement full dictionary-based LZW logic. Instead, it uses placeholder logic to represent compression steps.

## Files

- `lzw_compressor.v` — FSM-based Verilog module
- `tb_lzw_compressor.v` — Testbench to simulate the FSM

## How it works

1. Input data bytes are passed with a `valid` flag.
2. FSM transitions through: IDLE → LOAD → PROCESS → FINISH.
3. A basic XOR-based transformation is used to simulate compression logic.

## Simulation

You can simulate using **ModelSim** or any Verilog simulator.

## Educational Use

This project is designed for learning purposes, and can be used as a base to build full LZW logic.

---

### Author

Subiksha Jagadeesan Murugan

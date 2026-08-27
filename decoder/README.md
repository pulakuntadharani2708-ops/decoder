# 2-to-4 Decoder Using Verilog

## Project Overview

A decoder is a combinational logic circuit that converts binary input information into a corresponding output line.

In this project, a **2-to-4 Decoder** is designed using Verilog HDL.

The decoder has:

* 2 input lines
* 4 output lines
* 1 enable input

For every valid input combination, exactly one output becomes HIGH when the decoder is enabled.

## Objective

The objectives of this project are:

* To understand the working principle of a decoder.
* To implement a 2-to-4 Decoder using Verilog HDL.
* To create a Verilog testbench.
* To simulate the design.
* To verify all input combinations.
* To observe the corresponding output signals.

## Block Diagram

```text
                 ┌──────────────────┐
        A ──────►│                  │
        B ──────►│    2-to-4        │───► Y0
       Enable ──►│    Decoder       │───► Y1
                 │                  │───► Y2
                 │                  │───► Y3
                 └──────────────────┘
```

## Inputs and Outputs

### Inputs

* `A` - Input bit 1
* `B` - Input bit 0
* `Enable` - Enables the decoder

### Outputs

* `Y[3:0]` - Four decoded output lines

## Truth Table

When `Enable = 1`:

| Enable | A | B | Y3 | Y2 | Y1 | Y0 |
| ------ | - | - | -- | -- | -- | -- |
| 0      | X | X | 0  | 0  | 0  | 0  |
| 1      | 0 | 0 | 0  | 0  | 0  | 1  |
| 1      | 0 | 1 | 0  | 0  | 1  | 0  |
| 1      | 1 | 0 | 0  | 1  | 0  | 0  |
| 1      | 1 | 1 | 1  | 0  | 0  | 0  |

Only one output is HIGH for each valid input combination.

## Logic Equations

The outputs are:

```text
Y0 = Enable · ~A · ~B

Y1 = Enable · ~A · B

Y2 = Enable · A · ~B

Y3 = Enable · A · B
```

## Working Principle

When the Enable input is LOW, all outputs are LOW.

When Enable is HIGH:

* `AB = 00` activates `Y0`
* `AB = 01` activates `Y1`
* `AB = 10` activates `Y2`
* `AB = 11` activates `Y3`

Therefore, the binary input selects exactly one output line.

## Files

| File                      | Description           |
| ------------------------- | --------------------- |
| `README.md`               | Project documentation |
| `decoder_2to4.v`          | Verilog design code   |
| `tb_decoder_2to4.v`       | Verilog testbench     |
| `simulation/waveform.png` | Simulation waveform   |

## Simulation

The testbench verifies:

1. Decoder disabled.
2. Input `00`.
3. Input `01`.
4. Input `10`.
5. Input `11`.

Expected output:

```text
Enable  A  B   Y3 Y2 Y1 Y0
   0    X  X    0  0  0  0
   1    0  0    0  0  0  1
   1    0  1    0  0  1  0
   1    1  0    0  1  0  0
   1    1  1    1  0  0  0
```

## Tools Required

The project can be simulated using:

* Icarus Verilog
* GTKWave
* ModelSim
* QuestaSim
* Vivado Simulator

## Running Using Icarus Verilog

Compile the design and testbench:

```bash
iverilog -o decoder_sim decoder_2to4.v tb_decoder_2to4.v
```

Run the simulation:

```bash
vvp decoder_sim
```

The testbench generates:

```text
decoder_2to4.vcd
```

Open the waveform using GTKWave:

```bash
gtkwave decoder_2to4.vcd
```

Add the following signals:

```text
Enable
A
B
Y
```

## Expected Simulation Output

The console output should be similar to:

```text
Time    Enable  A  B   Y
0          0    0  0   0000
10         1    0  0   0001
20         1    0  1   0010
30         1    1  0   0100
40         1    1  1   1000
```

## Applications

Decoders are commonly used in:

* Memory address decoding
* Data routing
* Microprocessors
* Digital systems
* Instruction decoding
* Display systems
* Control circuits

## Advantages

* Simple combinational circuit.
* Fast operation.
* Easy to implement.
* Used as a basic building block in digital systems.

## Conclusion

A 2-to-4 Decoder was successfully designed using Verilog HDL. The testbench verifies all possible input combinations, and simulation confirms that the correct output line becomes HIGH for each binary input.

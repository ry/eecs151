# Will this synthesize into 2 adders and 2 subtractors or 1 of each?

Check synthesis using YOSYS

```
> read_verilog alu_big.v
> synth_ice40

   Number of wires:                729
   Number of wire bits:           1630
   Number of public wires:          31
   Number of public wire bits:     839
   Number of memories:               0
   Number of memory bits:            0
   Number of processes:              0
   Number of cells:                934
     SB_CARRY                       86
     SB_LUT4                       848

> read_verilog alu_small.v
> synth_ice40

   Number of wires:               1593
   Number of wire bits:           1843
   Number of public wires:           4
   Number of public wire bits:      99
   Number of memories:               0
   Number of memory bits:            0
   Number of processes:              0
   Number of cells:               1760
     SB_CARRY                      144
     SB_LUT4                      1616
```

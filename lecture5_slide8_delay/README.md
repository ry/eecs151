# Will non-blocking and blocking assignments both produce the desired result?

First run the test bench.

```
$ make
iverilog -o testbench_blocking testbench.v blocking.v
iverilog -o testbench_nonblocking testbench.v nonblocking.v
$ ./testbench_blocking
                   0 clk 0 in x out x
                   1 clk 1 in 1 out 1
                   2 clk 0 in 1 out 1
                   3 clk 1 in 1 out 1
                   4 clk 0 in 1 out 1
                   5 clk 1 in 1 out 1
$ ./testbench_nonblocking
                   0 clk 0 in x out x
                   1 clk 1 in 1 out x
                   2 clk 0 in 1 out x
                   3 clk 1 in 1 out x
                   4 clk 0 in 1 out x
                   5 clk 1 in 1 out 1
```

Then examine YOSYS synthesis

```
yosys -QT -S blocking.v

   Number of wires:                  3
   Number of wire bits:              3
   Number of public wires:           3
   Number of public wire bits:       3
   Number of memories:               0
   Number of memory bits:            0
   Number of processes:              0
   Number of cells:                  1
     $_DFF_P_                        1

yosys -S nonblocking.v

   Number of wires:                  5
   Number of wire bits:              5
   Number of public wires:           5
   Number of public wire bits:       5
   Number of memories:               0
   Number of memory bits:            0
   Number of processes:              0
   Number of cells:                  3
     $_DFF_P_                        3
```

The nonblocking module gives the correct design.

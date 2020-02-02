all: testbench_blocking testbench_nonblocking

testbench_blocking: testbench.v blocking.v
	iverilog -o testbench_blocking testbench.v blocking.v

testbench_nonblocking: testbench.v nonblocking.v
	iverilog -o testbench_nonblocking testbench.v nonblocking.v


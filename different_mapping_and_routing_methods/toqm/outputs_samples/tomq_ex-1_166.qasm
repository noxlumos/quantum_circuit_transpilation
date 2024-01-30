//Note: initial mapping (logical qubit at each location): 1, 0, -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
//Note: initial mapping (location of each logical qubit): 1, 0, 5, 
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
creg c[20];
cx q[1],q[0]; //cycle: 0 //cx q[0],q[1]
u3(0.000000, 0.000000, 0.785398) q[5]; //cycle: 0 //u3(0.000000, 0.000000, 0.785398) q[2]
u3(1.570796, 0.000000, 3.141593) q[1]; //cycle: 2 //u3(1.570796, 0.000000, 3.141593) q[0]
u3(0.000000, 0.000000, 0.785398) q[0]; //cycle: 2 //u3(0.000000, 0.000000, 0.785398) q[1]
cx q[5],q[0]; //cycle: 3 //cx q[2],q[1]
u3(0.000000, 0.000000, 0.785398) q[1]; //cycle: 3 //u3(0.000000, 0.000000, 0.785398) q[0]
swp q[5],q[6]; //cycle: 5
cx q[1],q[6]; //cycle: 11 //cx q[0],q[2]
u3(0.000000, 0.000000, -0.785398) q[6]; //cycle: 13 //u3(0.000000, 0.000000, -0.785398) q[2]
cx q[0],q[1]; //cycle: 13 //cx q[1],q[0]
swp q[0],q[5]; //cycle: 15
u3(0.000000, 0.000000, 0.785398) q[1]; //cycle: 15 //u3(0.000000, 0.000000, 0.785398) q[0]
cx q[5],q[6]; //cycle: 21 //cx q[1],q[2]
u3(0.000000, 0.000000, -0.785398) q[5]; //cycle: 23 //u3(0.000000, 0.000000, -0.785398) q[1]
u3(0.000000, 0.000000, -0.785398) q[6]; //cycle: 23 //u3(0.000000, 0.000000, -0.785398) q[2]
cx q[1],q[6]; //cycle: 24 //cx q[0],q[2]
swp q[5],q[6]; //cycle: 26
cx q[6],q[1]; //cycle: 32 //cx q[1],q[0]
u3(1.570796, 0.000000, 3.141593) q[1]; //cycle: 34 //u3(1.570796, 0.000000, 3.141593) q[0]
cx q[5],q[6]; //cycle: 34 //cx q[2],q[1]
cx q[1],q[6]; //cycle: 36 //cx q[0],q[1]
u3(3.141593, 0.000000, 3.141593) q[1]; //cycle: 38 //u3(3.141593, 0.000000, 3.141593) q[0]
//19 original gates
//22 gates in generated circuit
//21 original depth (cycles)
//39 depth of generated circuit
//1344 nodes popped from queue for processing.
//250 nodes remain in queue.

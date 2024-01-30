//Note: initial mapping (logical qubit at each location): 1, 2, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
//Note: initial mapping (location of each logical qubit): 2, 0, 1, 
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
creg c[20];
u3(0.000000, 0.000000, 0.785398) q[1]; //cycle: 0 //u3(0.000000, 0.000000, 0.785398) q[2]
u3(1.570796, 0.000000, 3.141593) q[2]; //cycle: 0 //u3(1.570796, 0.000000, 3.141593) q[0]
u3(0.000000, 0.000000, 0.785398) q[0]; //cycle: 0 //u3(0.000000, 0.000000, 0.785398) q[1]
cx q[1],q[0]; //cycle: 1 //cx q[2],q[1]
u3(0.000000, 0.000000, 0.785398) q[2]; //cycle: 1 //u3(0.000000, 0.000000, 0.785398) q[0]
cx q[2],q[1]; //cycle: 3 //cx q[0],q[2]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 5 //u3(0.000000, 0.000000, -0.785398) q[2]
swp q[0],q[1]; //cycle: 6
cx q[1],q[2]; //cycle: 12 //cx q[1],q[0]
u3(0.000000, 0.000000, 0.785398) q[2]; //cycle: 14 //u3(0.000000, 0.000000, 0.785398) q[0]
cx q[1],q[0]; //cycle: 14 //cx q[1],q[2]
u3(0.000000, 0.000000, -0.785398) q[0]; //cycle: 16 //u3(0.000000, 0.000000, -0.785398) q[2]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 16 //u3(0.000000, 0.000000, -0.785398) q[1]
swp q[1],q[2]; //cycle: 17
cx q[1],q[0]; //cycle: 23 //cx q[0],q[2]
cx q[2],q[1]; //cycle: 25 //cx q[1],q[0]
u3(1.570796, 0.000000, 3.141593) q[1]; //cycle: 27 //u3(1.570796, 0.000000, 3.141593) q[0]
swp q[0],q[1]; //cycle: 28
cx q[1],q[2]; //cycle: 34 //cx q[2],q[1]
cx q[1],q[2]; //cycle: 36 //cx q[2],q[1]
cx q[2],q[1]; //cycle: 38 //cx q[1],q[2]
cx q[0],q[1]; //cycle: 40 //cx q[0],q[2]
cx q[1],q[2]; //cycle: 42 //cx q[2],q[1]
//20 original gates
//23 gates in generated circuit
//24 original depth (cycles)
//44 depth of generated circuit
//319 nodes popped from queue for processing.
//28 nodes remain in queue.

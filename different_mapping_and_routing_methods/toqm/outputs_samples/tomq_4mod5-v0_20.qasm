//Note: initial mapping (logical qubit at each location): 1, 3, 2, 0, -1, -1, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
//Note: initial mapping (location of each logical qubit): 3, 0, 2, 1, 6, 
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
creg c[20];
u3(1.570796, 0.000000, 3.141593) q[6]; //cycle: 0 //u3(1.570796, 0.000000, 3.141593) q[4]
cx q[1],q[0]; //cycle: 0 //cx q[3],q[1]
u3(3.141593, 0.000000, 3.141593) q[3]; //cycle: 0 //u3(3.141593, 0.000000, 3.141593) q[0]
u3(0.000000, 0.000000, 0.785398) q[6]; //cycle: 1 //u3(0.000000, 0.000000, 0.785398) q[4]
cx q[3],q[2]; //cycle: 1 //cx q[0],q[2]
swp q[0],q[1]; //cycle: 2
cx q[2],q[1]; //cycle: 8 //cx q[2],q[1]
u3(0.000000, 0.000000, 0.785398) q[2]; //cycle: 10 //u3(0.000000, 0.000000, 0.785398) q[2]
u3(0.000000, 0.000000, 0.785398) q[1]; //cycle: 10 //u3(0.000000, 0.000000, 0.785398) q[1]
cx q[1],q[2]; //cycle: 11 //cx q[1],q[2]
cx q[6],q[1]; //cycle: 13 //cx q[4],q[1]
cx q[2],q[6]; //cycle: 15 //cx q[2],q[4]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 15 //u3(0.000000, 0.000000, -0.785398) q[1]
cx q[2],q[1]; //cycle: 17 //cx q[2],q[1]
u3(0.000000, 0.000000, 0.785398) q[6]; //cycle: 17 //u3(0.000000, 0.000000, 0.785398) q[4]
u3(0.000000, 0.000000, -0.785398) q[2]; //cycle: 19 //u3(0.000000, 0.000000, -0.785398) q[2]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 19 //u3(0.000000, 0.000000, -0.785398) q[1]
cx q[6],q[1]; //cycle: 20 //cx q[4],q[1]
cx q[2],q[6]; //cycle: 22 //cx q[2],q[4]
u3(1.570796, 0.000000, 3.141593) q[6]; //cycle: 24 //u3(1.570796, 0.000000, 3.141593) q[4]
cx q[1],q[2]; //cycle: 24 //cx q[1],q[2]
//20 original gates
//21 gates in generated circuit
//21 original depth (cycles)
//26 depth of generated circuit
//25 nodes popped from queue for processing.
//1 nodes remain in queue.

//Note: initial mapping (logical qubit at each location): 3, 1, 2, 0, -1, -1, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
//Note: initial mapping (location of each logical qubit): 3, 1, 2, 0, 6, 
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
creg c[20];
cx q[1],q[0]; //cycle: 0 //cx q[1],q[3]
u3(3.141593, 0.000000, 3.141593) q[6]; //cycle: 0 //u3(3.141593, 0.000000, 3.141593) q[4]
cx q[3],q[2]; //cycle: 0 //cx q[0],q[2]
u3(1.570796, 0.000000, 3.141593) q[6]; //cycle: 1 //u3(1.570796, 0.000000, 3.141593) q[4]
u3(0.000000, 0.000000, 0.785398) q[6]; //cycle: 2 //u3(0.000000, 0.000000, 0.785398) q[4]
u3(0.000000, 0.000000, 0.785398) q[0]; //cycle: 2 //u3(0.000000, 0.000000, 0.785398) q[3]
u3(0.000000, 0.000000, 0.785398) q[2]; //cycle: 2 //u3(0.000000, 0.000000, 0.785398) q[2]
swp q[0],q[1]; //cycle: 3
cx q[1],q[2]; //cycle: 9 //cx q[3],q[2]
cx q[6],q[1]; //cycle: 11 //cx q[4],q[3]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 13 //u3(0.000000, 0.000000, -0.785398) q[3]
cx q[2],q[6]; //cycle: 13 //cx q[2],q[4]
cx q[2],q[1]; //cycle: 15 //cx q[2],q[3]
u3(0.000000, 0.000000, 0.785398) q[6]; //cycle: 15 //u3(0.000000, 0.000000, 0.785398) q[4]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 17 //u3(0.000000, 0.000000, -0.785398) q[3]
u3(0.000000, 0.000000, -0.785398) q[2]; //cycle: 17 //u3(0.000000, 0.000000, -0.785398) q[2]
cx q[6],q[1]; //cycle: 18 //cx q[4],q[3]
cx q[2],q[6]; //cycle: 20 //cx q[2],q[4]
cx q[1],q[2]; //cycle: 22 //cx q[3],q[2]
u3(1.570796, 0.000000, 3.141593) q[6]; //cycle: 22 //u3(1.570796, 0.000000, 3.141593) q[4]
cx q[2],q[1]; //cycle: 24 //cx q[2],q[3]
cx q[1],q[6]; //cycle: 26 //cx q[3],q[4]
//21 original gates
//22 gates in generated circuit
//22 original depth (cycles)
//28 depth of generated circuit
//35 nodes popped from queue for processing.
//2 nodes remain in queue.

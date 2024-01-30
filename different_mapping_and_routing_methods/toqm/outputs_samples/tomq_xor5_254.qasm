//Note: initial mapping (logical qubit at each location): 0, 3, 5, -1, -1, 1, 2, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
//Note: initial mapping (location of each logical qubit): 0, 5, 6, 1, 7, 2, 
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
creg c[20];
u3(3.141593, 0.000000, 3.141593) q[7]; //cycle: 0 //u3(3.141593, 0.000000, 3.141593) q[4]
cx q[1],q[0]; //cycle: 0 //cx q[3],q[0]
u3(3.141593, 0.000000, 3.141593) q[6]; //cycle: 0 //u3(3.141593, 0.000000, 3.141593) q[2]
cx q[5],q[0]; //cycle: 2 //cx q[1],q[0]
swp q[0],q[1]; //cycle: 4
cx q[2],q[1]; //cycle: 10 //cx q[5],q[0]
cx q[6],q[1]; //cycle: 12 //cx q[2],q[0]
cx q[7],q[1]; //cycle: 14 //cx q[4],q[0]
//7 original gates
//8 gates in generated circuit
//10 original depth (cycles)
//16 depth of generated circuit
//27 nodes popped from queue for processing.
//3 nodes remain in queue.

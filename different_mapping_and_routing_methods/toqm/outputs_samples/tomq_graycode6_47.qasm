//Note: initial mapping (logical qubit at each location): 0, 1, 2, 3, 4, -1, -1, -1, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
//Note: initial mapping (location of each logical qubit): 0, 1, 2, 3, 4, 8, 
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
creg c[20];
cx q[1],q[0]; //cycle: 0 //cx q[1],q[0]
cx q[2],q[1]; //cycle: 2 //cx q[2],q[1]
cx q[3],q[2]; //cycle: 4 //cx q[3],q[2]
cx q[4],q[3]; //cycle: 6 //cx q[4],q[3]
cx q[8],q[4]; //cycle: 8 //cx q[5],q[4]
//5 original gates
//5 gates in generated circuit
//10 original depth (cycles)
//10 depth of generated circuit
//9 nodes popped from queue for processing.
//0 nodes remain in queue.

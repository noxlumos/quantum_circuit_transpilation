//Note: initial mapping (logical qubit at each location): 1, 2, 3, 4, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
//Note: initial mapping (location of each logical qubit): 6, 0, 1, 2, 3, 
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
creg c[20];
cx q[1],q[0]; //cycle: 0 //cx q[2],q[1]
u3(1.570796, 0.000000, 3.141593) q[6]; //cycle: 0 //u3(1.570796, 0.000000, 3.141593) q[0]
u3(0.000000, 0.000000, 0.785398) q[6]; //cycle: 1 //u3(0.000000, 0.000000, 0.785398) q[0]
cx q[0],q[1]; //cycle: 2 //cx q[1],q[2]
u3(0.000000, 0.000000, 0.785398) q[0]; //cycle: 4 //u3(0.000000, 0.000000, 0.785398) q[1]
cx q[2],q[1]; //cycle: 4 //cx q[3],q[2]
cx q[1],q[2]; //cycle: 6 //cx q[2],q[3]
cx q[3],q[2]; //cycle: 8 //cx q[4],q[3]
cx q[2],q[3]; //cycle: 10 //cx q[3],q[4]
swp q[0],q[1]; //cycle: 11
u3(0.000000, 0.000000, 0.785398) q[3]; //cycle: 12 //u3(0.000000, 0.000000, 0.785398) q[4]
swp q[2],q[3]; //cycle: 13
cx q[2],q[1]; //cycle: 19 //cx q[4],q[1]
cx q[6],q[2]; //cycle: 21 //cx q[0],q[4]
cx q[1],q[6]; //cycle: 23 //cx q[1],q[0]
u3(0.000000, 0.000000, -0.785398) q[2]; //cycle: 23 //u3(0.000000, 0.000000, -0.785398) q[4]
cx q[1],q[2]; //cycle: 25 //cx q[1],q[4]
u3(0.000000, 0.000000, 0.785398) q[6]; //cycle: 25 //u3(0.000000, 0.000000, 0.785398) q[0]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 27 //u3(0.000000, 0.000000, -0.785398) q[1]
u3(0.000000, 0.000000, -0.785398) q[2]; //cycle: 27 //u3(0.000000, 0.000000, -0.785398) q[4]
cx q[6],q[2]; //cycle: 28 //cx q[0],q[4]
cx q[1],q[6]; //cycle: 30 //cx q[1],q[0]
cx q[2],q[1]; //cycle: 32 //cx q[4],q[1]
u3(1.570796, 0.000000, 3.141593) q[6]; //cycle: 32 //u3(1.570796, 0.000000, 3.141593) q[0]
cx q[2],q[3]; //cycle: 34 //cx q[4],q[3]
swp q[1],q[2]; //cycle: 36
cx q[1],q[0]; //cycle: 42 //cx q[4],q[2]
cx q[1],q[2]; //cycle: 44 //cx q[4],q[1]
cx q[6],q[1]; //cycle: 46 //cx q[0],q[4]
cx q[1],q[6]; //cycle: 48 //cx q[4],q[0]
//27 original gates
//30 gates in generated circuit
//38 original depth (cycles)
//50 depth of generated circuit
//776 nodes popped from queue for processing.
//44 nodes remain in queue.

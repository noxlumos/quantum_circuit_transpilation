//Note: initial mapping (logical qubit at each location): 2, 1, 0, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
//Note: initial mapping (location of each logical qubit): 2, 1, 0, 3, 
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
creg c[20];
u3(0.000000, 0.000000, 0.785398) q[1]; //cycle: 0 //u3(0.000000, 0.000000, 0.785398) q[1]
u3(1.570796, 0.000000, 3.141593) q[2]; //cycle: 0 //u3(1.570796, 0.000000, 3.141593) q[0]
u3(0.000000, 0.000000, 0.785398) q[0]; //cycle: 0 //u3(0.000000, 0.000000, 0.785398) q[2]
cx q[1],q[0]; //cycle: 1 //cx q[1],q[2]
u3(0.000000, 0.000000, 0.785398) q[2]; //cycle: 1 //u3(0.000000, 0.000000, 0.785398) q[0]
cx q[2],q[1]; //cycle: 3 //cx q[0],q[1]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 5 //u3(0.000000, 0.000000, -0.785398) q[1]
swp q[0],q[1]; //cycle: 6
cx q[1],q[2]; //cycle: 12 //cx q[2],q[0]
u3(0.000000, 0.000000, 0.785398) q[2]; //cycle: 14 //u3(0.000000, 0.000000, 0.785398) q[0]
cx q[1],q[0]; //cycle: 14 //cx q[2],q[1]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 16 //u3(0.000000, 0.000000, -0.785398) q[2]
u3(0.000000, 0.000000, -0.785398) q[0]; //cycle: 16 //u3(0.000000, 0.000000, -0.785398) q[1]
swp q[0],q[1]; //cycle: 17
cx q[2],q[1]; //cycle: 23 //cx q[0],q[1]
swp q[0],q[1]; //cycle: 25
cx q[1],q[2]; //cycle: 31 //cx q[2],q[0]
cx q[0],q[1]; //cycle: 33 //cx q[1],q[2]
u3(1.570796, 0.000000, 3.141593) q[2]; //cycle: 33 //u3(1.570796, 0.000000, 3.141593) q[0]
cx q[3],q[2]; //cycle: 34 //cx q[3],q[0]
cx q[2],q[3]; //cycle: 36 //cx q[0],q[3]
//18 original gates
//21 gates in generated circuit
//19 original depth (cycles)
//38 depth of generated circuit
//200 nodes popped from queue for processing.
//17 nodes remain in queue.

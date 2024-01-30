//Note: initial mapping (logical qubit at each location): 1, 2, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
//Note: initial mapping (location of each logical qubit): 5, 0, 1, 
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
creg c[20];
cx q[1],q[0]; //cycle: 0 //cx q[2],q[1]
u3(0.000000, 0.000000, 0.785398) q[5]; //cycle: 0 //u3(0.000000, 0.000000, 0.785398) q[0]
u3(1.570796, 0.000000, 3.141593) q[1]; //cycle: 2 //u3(1.570796, 0.000000, 3.141593) q[2]
u3(0.000000, 0.000000, 0.785398) q[0]; //cycle: 2 //u3(0.000000, 0.000000, 0.785398) q[1]
cx q[5],q[0]; //cycle: 3 //cx q[0],q[1]
u3(0.000000, 0.000000, 0.785398) q[1]; //cycle: 3 //u3(0.000000, 0.000000, 0.785398) q[2]
swp q[0],q[1]; //cycle: 5
cx q[0],q[5]; //cycle: 11 //cx q[2],q[0]
u3(0.000000, 0.000000, -0.785398) q[5]; //cycle: 13 //u3(0.000000, 0.000000, -0.785398) q[0]
cx q[1],q[0]; //cycle: 13 //cx q[1],q[2]
swp q[1],q[6]; //cycle: 15
u3(0.000000, 0.000000, 0.785398) q[0]; //cycle: 15 //u3(0.000000, 0.000000, 0.785398) q[2]
cx q[6],q[5]; //cycle: 21 //cx q[1],q[0]
u3(0.000000, 0.000000, -0.785398) q[6]; //cycle: 23 //u3(0.000000, 0.000000, -0.785398) q[1]
u3(0.000000, 0.000000, -0.785398) q[5]; //cycle: 23 //u3(0.000000, 0.000000, -0.785398) q[0]
cx q[0],q[5]; //cycle: 24 //cx q[2],q[0]
swp q[0],q[1]; //cycle: 26
cx q[6],q[1]; //cycle: 32 //cx q[1],q[2]
u3(1.570796, 0.000000, 3.141593) q[1]; //cycle: 34 //u3(1.570796, 0.000000, 3.141593) q[2]
cx q[5],q[6]; //cycle: 34 //cx q[0],q[1]
u3(0.000000, 0.000000, 0.785398) q[1]; //cycle: 35 //u3(0.000000, 0.000000, 0.785398) q[2]
u3(0.000000, 0.000000, 0.785398) q[6]; //cycle: 36 //u3(0.000000, 0.000000, 0.785398) q[1]
u3(1.570796, 0.000000, 3.141593) q[5]; //cycle: 36 //u3(1.570796, 0.000000, 3.141593) q[0]
u3(0.000000, 0.000000, 0.785398) q[5]; //cycle: 37 //u3(0.000000, 0.000000, 0.785398) q[0]
cx q[6],q[1]; //cycle: 37 //cx q[1],q[2]
cx q[5],q[6]; //cycle: 39 //cx q[0],q[1]
swp q[0],q[5]; //cycle: 41
u3(0.000000, 0.000000, -0.785398) q[6]; //cycle: 41 //u3(0.000000, 0.000000, -0.785398) q[1]
cx q[1],q[0]; //cycle: 47 //cx q[2],q[0]
cx q[1],q[6]; //cycle: 49 //cx q[2],q[1]
u3(0.000000, 0.000000, 0.785398) q[0]; //cycle: 49 //u3(0.000000, 0.000000, 0.785398) q[0]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 51 //u3(0.000000, 0.000000, -0.785398) q[2]
u3(0.000000, 0.000000, -0.785398) q[6]; //cycle: 51 //u3(0.000000, 0.000000, -0.785398) q[1]
swp q[5],q[6]; //cycle: 52
cx q[0],q[5]; //cycle: 58 //cx q[0],q[1]
cx q[1],q[0]; //cycle: 60 //cx q[2],q[0]
swp q[1],q[6]; //cycle: 62
u3(1.570796, 0.000000, 3.141593) q[0]; //cycle: 62 //u3(1.570796, 0.000000, 3.141593) q[0]
u3(0.000000, 0.000000, 0.785398) q[0]; //cycle: 63 //u3(0.000000, 0.000000, 0.785398) q[0]
cx q[5],q[6]; //cycle: 68 //cx q[1],q[2]
u3(1.570796, 0.000000, 3.141593) q[6]; //cycle: 70 //u3(1.570796, 0.000000, 3.141593) q[2]
u3(0.000000, 0.000000, 0.785398) q[5]; //cycle: 70 //u3(0.000000, 0.000000, 0.785398) q[1]
u3(0.000000, 0.000000, 0.785398) q[6]; //cycle: 71 //u3(0.000000, 0.000000, 0.785398) q[2]
cx q[0],q[5]; //cycle: 71 //cx q[0],q[1]
swp q[5],q[6]; //cycle: 73
cx q[5],q[0]; //cycle: 79 //cx q[2],q[0]
cx q[6],q[5]; //cycle: 81 //cx q[1],q[2]
u3(0.000000, 0.000000, -0.785398) q[0]; //cycle: 81 //u3(0.000000, 0.000000, -0.785398) q[0]
swp q[1],q[6]; //cycle: 83
u3(0.000000, 0.000000, 0.785398) q[5]; //cycle: 83 //u3(0.000000, 0.000000, 0.785398) q[2]
cx q[1],q[0]; //cycle: 89 //cx q[1],q[0]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 91 //u3(0.000000, 0.000000, -0.785398) q[1]
u3(0.000000, 0.000000, -0.785398) q[0]; //cycle: 91 //u3(0.000000, 0.000000, -0.785398) q[0]
cx q[5],q[0]; //cycle: 92 //cx q[2],q[0]
swp q[5],q[6]; //cycle: 94
cx q[1],q[6]; //cycle: 100 //cx q[1],q[2]
cx q[0],q[1]; //cycle: 102 //cx q[0],q[1]
u3(1.570796, 0.000000, 3.141593) q[6]; //cycle: 102 //u3(1.570796, 0.000000, 3.141593) q[2]
cx q[6],q[1]; //cycle: 104 //cx q[2],q[1]
//50 original gates
//59 gates in generated circuit
//52 original depth (cycles)
//106 depth of generated circuit
//96720 nodes popped from queue for processing.
//1026 nodes remain in queue.

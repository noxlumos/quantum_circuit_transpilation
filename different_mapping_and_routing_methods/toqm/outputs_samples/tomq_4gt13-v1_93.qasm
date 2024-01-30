//Note: initial mapping (logical qubit at each location): 3, 2, 0, 4, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
//Note: initial mapping (location of each logical qubit): 2, 6, 1, 0, 3, 
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
creg c[20];
u3(0.000000, 0.000000, 0.785398) q[0]; //cycle: 0 //u3(0.000000, 0.000000, 0.785398) q[3]
u3(3.141593, 0.000000, 3.141593) q[2]; //cycle: 0 //u3(3.141593, 0.000000, 3.141593) q[0]
u3(0.000000, 0.000000, 0.785398) q[6]; //cycle: 0 //u3(0.000000, 0.000000, 0.785398) q[1]
u3(0.000000, 0.000000, 0.785398) q[1]; //cycle: 0 //u3(0.000000, 0.000000, 0.785398) q[2]
cx q[1],q[0]; //cycle: 1 //cx q[2],q[3]
cx q[3],q[2]; //cycle: 1 //cx q[4],q[0]
cx q[2],q[3]; //cycle: 3 //cx q[0],q[4]
u3(0.000000, 0.000000, 0.785398) q[2]; //cycle: 5 //u3(0.000000, 0.000000, 0.785398) q[0]
u3(1.570796, 0.000000, 3.141593) q[3]; //cycle: 5 //u3(1.570796, 0.000000, 3.141593) q[4]
cx q[2],q[6]; //cycle: 6 //cx q[0],q[1]
u3(0.000000, 0.000000, 0.785398) q[3]; //cycle: 6 //u3(0.000000, 0.000000, 0.785398) q[4]
cx q[3],q[2]; //cycle: 8 //cx q[4],q[0]
u3(0.000000, 0.000000, -0.785398) q[2]; //cycle: 10 //u3(0.000000, 0.000000, -0.785398) q[0]
swp q[2],q[6]; //cycle: 11
cx q[2],q[3]; //cycle: 17 //cx q[1],q[4]
cx q[2],q[6]; //cycle: 19 //cx q[1],q[0]
u3(0.000000, 0.000000, 0.785398) q[3]; //cycle: 19 //u3(0.000000, 0.000000, 0.785398) q[4]
u3(0.000000, 0.000000, -0.785398) q[6]; //cycle: 21 //u3(0.000000, 0.000000, -0.785398) q[0]
u3(0.000000, 0.000000, -0.785398) q[2]; //cycle: 21 //u3(0.000000, 0.000000, -0.785398) q[1]
swp q[2],q[6]; //cycle: 22
cx q[3],q[2]; //cycle: 28 //cx q[4],q[0]
swp q[2],q[6]; //cycle: 30
cx q[2],q[3]; //cycle: 36 //cx q[1],q[4]
cx q[6],q[2]; //cycle: 38 //cx q[0],q[1]
u3(1.570796, 0.000000, 3.141593) q[3]; //cycle: 38 //u3(1.570796, 0.000000, 3.141593) q[4]
u3(1.570796, 0.000000, 3.141593) q[3]; //cycle: 39 //u3(1.570796, 0.000000, 3.141593) q[4]
u3(1.570796, 0.000000, 3.141593) q[6]; //cycle: 40 //u3(1.570796, 0.000000, 3.141593) q[0]
u3(0.000000, 0.000000, 0.785398) q[2]; //cycle: 40 //u3(0.000000, 0.000000, 0.785398) q[1]
u3(0.000000, 0.000000, 0.785398) q[3]; //cycle: 40 //u3(0.000000, 0.000000, 0.785398) q[4]
u3(0.000000, 0.000000, 0.785398) q[6]; //cycle: 41 //u3(0.000000, 0.000000, 0.785398) q[0]
cx q[6],q[1]; //cycle: 42 //cx q[0],q[2]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 44 //u3(0.000000, 0.000000, -0.785398) q[2]
swp q[0],q[1]; //cycle: 45
cx q[1],q[6]; //cycle: 51 //cx q[3],q[0]
cx q[1],q[0]; //cycle: 53 //cx q[3],q[2]
u3(0.000000, 0.000000, 0.785398) q[6]; //cycle: 53 //u3(0.000000, 0.000000, 0.785398) q[0]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 55 //u3(0.000000, 0.000000, -0.785398) q[3]
u3(0.000000, 0.000000, -0.785398) q[0]; //cycle: 55 //u3(0.000000, 0.000000, -0.785398) q[2]
swp q[0],q[5]; //cycle: 56
cx q[6],q[5]; //cycle: 62 //cx q[0],q[2]
cx q[1],q[6]; //cycle: 64 //cx q[3],q[0]
u3(1.570796, 0.000000, 3.141593) q[6]; //cycle: 66 //u3(1.570796, 0.000000, 3.141593) q[0]
u3(0.000000, 0.000000, 0.785398) q[6]; //cycle: 67 //u3(0.000000, 0.000000, 0.785398) q[0]
swp q[0],q[1]; //cycle: 68
cx q[6],q[2]; //cycle: 68 //cx q[0],q[1]
swp q[2],q[3]; //cycle: 70
cx q[5],q[0]; //cycle: 74 //cx q[2],q[3]
u3(0.000000, 0.000000, 0.785398) q[0]; //cycle: 76 //u3(0.000000, 0.000000, 0.785398) q[3]
u3(0.000000, 0.000000, 0.785398) q[5]; //cycle: 76 //u3(0.000000, 0.000000, 0.785398) q[2]
cx q[2],q[6]; //cycle: 76 //cx q[4],q[0]
cx q[5],q[0]; //cycle: 77 //cx q[2],q[3]
cx q[3],q[2]; //cycle: 78 //cx q[1],q[4]
u3(0.000000, 0.000000, -0.785398) q[6]; //cycle: 78 //u3(0.000000, 0.000000, -0.785398) q[0]
u3(0.000000, 0.000000, 0.785398) q[2]; //cycle: 80 //u3(0.000000, 0.000000, 0.785398) q[4]
swp q[2],q[6]; //cycle: 81
cx q[3],q[2]; //cycle: 87 //cx q[1],q[0]
u3(0.000000, 0.000000, -0.785398) q[3]; //cycle: 89 //u3(0.000000, 0.000000, -0.785398) q[1]
u3(0.000000, 0.000000, -0.785398) q[2]; //cycle: 89 //u3(0.000000, 0.000000, -0.785398) q[0]
cx q[6],q[2]; //cycle: 90 //cx q[4],q[0]
swp q[2],q[3]; //cycle: 92
cx q[2],q[6]; //cycle: 98 //cx q[1],q[4]
cx q[3],q[2]; //cycle: 100 //cx q[0],q[1]
u3(1.570796, 0.000000, 3.141593) q[6]; //cycle: 100 //u3(1.570796, 0.000000, 3.141593) q[4]
u3(3.141593, 0.000000, 3.141593) q[6]; //cycle: 101 //u3(3.141593, 0.000000, 3.141593) q[4]
u3(1.570796, 0.000000, 3.141593) q[3]; //cycle: 102 //u3(1.570796, 0.000000, 3.141593) q[0]
u3(0.000000, 0.000000, 0.785398) q[3]; //cycle: 103 //u3(0.000000, 0.000000, 0.785398) q[0]
swp q[2],q[3]; //cycle: 104
swp q[5],q[6]; //cycle: 104
cx q[2],q[6]; //cycle: 110 //cx q[0],q[2]
swp q[0],q[1]; //cycle: 111
u3(0.000000, 0.000000, -0.785398) q[6]; //cycle: 112 //u3(0.000000, 0.000000, -0.785398) q[2]
cx q[1],q[2]; //cycle: 117 //cx q[3],q[0]
cx q[1],q[6]; //cycle: 119 //cx q[3],q[2]
u3(0.000000, 0.000000, 0.785398) q[2]; //cycle: 119 //u3(0.000000, 0.000000, 0.785398) q[0]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 121 //u3(0.000000, 0.000000, -0.785398) q[3]
u3(0.000000, 0.000000, -0.785398) q[6]; //cycle: 121 //u3(0.000000, 0.000000, -0.785398) q[2]
cx q[2],q[6]; //cycle: 122 //cx q[0],q[2]
cx q[1],q[2]; //cycle: 124 //cx q[3],q[0]
cx q[6],q[1]; //cycle: 126 //cx q[2],q[3]
u3(1.570796, 0.000000, 3.141593) q[2]; //cycle: 126 //u3(1.570796, 0.000000, 3.141593) q[0]
//68 original gates
//80 gates in generated circuit
//66 original depth (cycles)
//128 depth of generated circuit
//54707 nodes popped from queue for processing.
//1000 nodes remain in queue.
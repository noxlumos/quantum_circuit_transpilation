//Note: initial mapping (logical qubit at each location): 4, 3, 1, 2, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
//Note: initial mapping (location of each logical qubit): 6, 2, 3, 1, 0, 
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
creg c[20];
cx q[1],q[0]; //cycle: 0 //cx q[3],q[4]
cx q[3],q[2]; //cycle: 0 //cx q[2],q[1]
u3(3.141593, 0.000000, 3.141593) q[3]; //cycle: 2 //u3(3.141593, 0.000000, 3.141593) q[2]
u3(0.000000, 0.000000, 0.785398) q[0]; //cycle: 2 //u3(0.000000, 0.000000, 0.785398) q[4]
u3(0.000000, 0.000000, 0.785398) q[2]; //cycle: 2 //u3(0.000000, 0.000000, 0.785398) q[1]
u3(0.000000, 0.000000, 0.785398) q[1]; //cycle: 2 //u3(0.000000, 0.000000, 0.785398) q[3]
u3(1.570796, 0.000000, 3.141593) q[3]; //cycle: 3 //u3(1.570796, 0.000000, 3.141593) q[2]
cx q[2],q[1]; //cycle: 3 //cx q[1],q[3]
u3(0.000000, 0.000000, 0.785398) q[3]; //cycle: 4 //u3(0.000000, 0.000000, 0.785398) q[2]
cx q[3],q[2]; //cycle: 5 //cx q[2],q[1]
u3(0.000000, 0.000000, -0.785398) q[2]; //cycle: 7 //u3(0.000000, 0.000000, -0.785398) q[1]
swp q[1],q[2]; //cycle: 8
cx q[2],q[3]; //cycle: 14 //cx q[3],q[2]
cx q[2],q[1]; //cycle: 16 //cx q[3],q[1]
u3(0.000000, 0.000000, 0.785398) q[3]; //cycle: 16 //u3(0.000000, 0.000000, 0.785398) q[2]
u3(0.000000, 0.000000, -0.785398) q[2]; //cycle: 18 //u3(0.000000, 0.000000, -0.785398) q[3]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 18 //u3(0.000000, 0.000000, -0.785398) q[1]
swp q[2],q[3]; //cycle: 19
cx q[2],q[1]; //cycle: 25 //cx q[2],q[1]
cx q[3],q[2]; //cycle: 27 //cx q[3],q[2]
u3(1.570796, 0.000000, 3.141593) q[2]; //cycle: 29 //u3(1.570796, 0.000000, 3.141593) q[2]
cx q[2],q[6]; //cycle: 30 //cx q[2],q[0]
swp q[0],q[1]; //cycle: 31
u3(1.570796, 0.000000, 3.141593) q[2]; //cycle: 32 //u3(1.570796, 0.000000, 3.141593) q[2]
u3(0.000000, 0.000000, 0.785398) q[6]; //cycle: 32 //u3(0.000000, 0.000000, 0.785398) q[0]
u3(0.000000, 0.000000, 0.785398) q[2]; //cycle: 33 //u3(0.000000, 0.000000, 0.785398) q[2]
cx q[6],q[1]; //cycle: 37 //cx q[0],q[4]
cx q[2],q[6]; //cycle: 39 //cx q[2],q[0]
cx q[1],q[2]; //cycle: 41 //cx q[4],q[2]
u3(0.000000, 0.000000, -0.785398) q[6]; //cycle: 41 //u3(0.000000, 0.000000, -0.785398) q[0]
cx q[1],q[6]; //cycle: 43 //cx q[4],q[0]
u3(0.000000, 0.000000, 0.785398) q[2]; //cycle: 43 //u3(0.000000, 0.000000, 0.785398) q[2]
u3(0.000000, 0.000000, -0.785398) q[1]; //cycle: 45 //u3(0.000000, 0.000000, -0.785398) q[4]
u3(0.000000, 0.000000, -0.785398) q[6]; //cycle: 45 //u3(0.000000, 0.000000, -0.785398) q[0]
cx q[2],q[6]; //cycle: 46 //cx q[2],q[0]
cx q[1],q[2]; //cycle: 48 //cx q[4],q[2]
cx q[6],q[1]; //cycle: 50 //cx q[0],q[4]
u3(1.570796, 0.000000, 3.141593) q[2]; //cycle: 50 //u3(1.570796, 0.000000, 3.141593) q[2]
cx q[2],q[1]; //cycle: 52 //cx q[2],q[4]
swp q[0],q[1]; //cycle: 54
swp q[2],q[3]; //cycle: 54
cx q[1],q[2]; //cycle: 60 //cx q[1],q[3]
//37 original gates
//42 gates in generated circuit
//37 original depth (cycles)
//62 depth of generated circuit
//4206 nodes popped from queue for processing.
//1338 nodes remain in queue.
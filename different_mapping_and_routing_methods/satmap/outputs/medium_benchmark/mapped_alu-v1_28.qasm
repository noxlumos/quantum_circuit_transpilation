OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
creg c[20];
cx q[2],q[3];
cx q[7],q[1];
cx q[1],q[2];
h q[7];
t q[2];
t q[1];
t q[7];
swap q[8],q[3];
cx q[1],q[2];
cx q[7],q[1];
cx q[2],q[7];
tdg q[1];
cx q[2],q[1];
tdg q[2];
tdg q[1];
t q[7];
cx q[7],q[1];
cx q[2],q[7];
cx q[1],q[2];
h q[7];
cx q[7],q[12];
h q[7];
t q[12];
t q[8];
t q[7];
cx q[8],q[12];
cx q[7],q[8];
cx q[12],q[7];
tdg q[8];
cx q[12],q[8];
tdg q[12];
tdg q[8];
t q[7];
cx q[7],q[8];
cx q[12],q[7];
cx q[8],q[12];
h q[7];
x q[7];
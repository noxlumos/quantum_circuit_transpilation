OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
creg c[20];
h q[6];
t q[2];
t q[1];
t q[6];
cx q[1],q[2];
cx q[6],q[1];
cx q[2],q[6];
tdg q[1];
cx q[2],q[1];
tdg q[2];
tdg q[1];
t q[6];
cx q[6],q[1];
cx q[2],q[6];
cx q[1],q[2];
h q[6];
cx q[5],q[6];
cx q[6],q[5];
from qiskit.circuit.random import random_circuit
from qiskit import transpile
from qiskit.providers.fake_provider import FakeWashingtonV2

import step_collector

backend = FakeWashingtonV2()

num_qubits = 75
depth = 500
circ = random_circuit(num_qubits, depth, measure=True)

qc_basis = transpile(circ, backend, layout_method='dense', optimization_level=3, callback=step_collector.on_step_callback)
step_collector.write_steps_to_csv("{}_{}.csv".format(num_qubits, depth))
# qc_basis.draw(output='mpl')

# debugger = Debugger()
# debugger.debug(circ, backend, optimization_level=3)

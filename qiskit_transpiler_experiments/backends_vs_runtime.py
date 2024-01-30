import csv
import time
from qiskit.circuit.random import random_circuit
from qiskit import transpile
import matplotlib.pyplot as plt
from qiskit.providers.fake_provider import FakeWashingtonV2, FakeTokyo, FakeKolkata
from swap_gates_count import swap_gate_count

if __name__ == "__main__":
    backend_Washington = FakeWashingtonV2()
    backend_Tokyo = FakeTokyo()
    backend_Kolkata = FakeKolkata()

    backends = [backend_Washington, backend_Tokyo, backend_Kolkata]
    names = ['FakeWashingtonV2', 'FakeTokyo', 'FakeKolkata']
    num_qubits_range = range(4, 21, 4)
    average_runtimes = []
    number_of_trials = 1
    with open('csv_outputs/runtime_vs_backends_500.csv', 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)

        # Write the header row
        writer.writerow(['backend', 'Num_Qubits', 'runtime', 'swap_gates'])
        for num_qubits in num_qubits_range:
            average_runtimes_qubits = []
            circ = random_circuit(num_qubits, 500, measure=True)
            file_name = f'./backends_outputs/{num_qubits}.qasm'
            circ.qasm(formatted=True, filename=file_name)
            for i, backend in enumerate(backends):
                start_time = time.time()
                qc_basis = transpile(circ, backend, optimization_level=3)
                end_time = time.time()
                execution_time = end_time - start_time
                file_name = f'./backends_outputs/{num_qubits}_{names[i]}.qasm'
                qc_basis.qasm(formatted=True, filename=file_name)
                swap = swap_gate_count(qc_basis)
                print(names[i], num_qubits, execution_time, swap)
                average_runtimes_qubits.append(execution_time)
                writer.writerow([names[i], num_qubits, execution_time, swap])
            average_runtimes.append(average_runtimes_qubits)


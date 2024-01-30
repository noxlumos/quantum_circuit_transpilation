import csv
import time

from qiskit.circuit.random import random_circuit

from qiskit import transpile
from qiskit.providers.fake_provider import FakeTokyo
from swap_gates_count import swap_gate_count

backend = FakeTokyo()
optimization_levels = [0, 1, 2, 3]
num_qubits_range = range(4, 21, 4)  # From 5 to 30 with increments of 5
average_runtimes = []
number_of_trials = 3
with open('csv_outputs/runtime_vs_opt_level.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    # Write the header row
    writer.writerow(['opt_level', 'Num_Qubits', 'runtime', 'swap_gates'])
    for opt_level in optimization_levels:
        average_runtimes_opt = []  # Store average runtimes for this optimization level
        for num_qubits in num_qubits_range:
            total_time = 0
            swap = 0
            for _ in range(number_of_trials):
                start_time = time.time()
                circ = random_circuit(num_qubits, 500, measure=True)
                qc_basis = transpile(circ, backend, optimization_level=opt_level)
                swap += swap_gate_count(qc_basis)
                end_time = time.time()
                execution_time = end_time - start_time
                total_time += execution_time
            average_time = total_time / number_of_trials
            avg_swap = swap / number_of_trials
            print(opt_level, num_qubits, average_time, avg_swap)
            average_runtimes_opt.append(average_time)
            writer.writerow([opt_level, num_qubits, average_time, avg_swap])
        average_runtimes.append(average_runtimes_opt)

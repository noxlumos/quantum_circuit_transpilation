import os
import time
import csv

import qiskit
from qiskit import transpile
from qiskit.providers.fake_provider import FakeTokyo
from mqt import qmap

backend = FakeTokyo()


root_directory = 'OLSQ2/samples'


def remove_prefix(filename):
    return filename.replace('OLSQ2/samples/', '')


# Use os.walk to iterate through all files in the directory and its subdirectories
with open('csv_outputs/execution_times_medium_benchmarks_qmap_heuristic2.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)

    # Write the header row
    writer.writerow(['name', 'Layout', 'Execution_Time', 'Num_Qubits', 'Circuit_Depth', 'Circuit_Size', '2_qubit_gates', 'swap_gates_added'])
    for root, dirs, files in os.walk(root_directory):
        for file in files:
            file_path = os.path.join(root, file)  # Get the full path to the file
            print(file_path)
            circ = qiskit.QuantumCircuit.from_qasm_file(file_path)
            two_qubit_gates = 0
            for j in range(len(circ)):
                qubits = circ[j][1]
                if len(qubits) == 2:
                    two_qubit_gates += 1
            try:
                start_time = time.time()
                circ_mapped, results = qmap.compile(circ, arch=backend, method="heuristic", post_mapping_optimizations=False)
                end_time = time.time()
                file_name = f'./samples_output/mqt-qmap-heuristic_{remove_prefix(file_path)}'
                with open(file_name, "w"):
                    pass
                circ_mapped.qasm(formatted=True, filename=file_name)
                swap_count = circ_mapped.count_ops().get('swap', 0)
                execution_time = end_time - start_time
                writer.writerow([remove_prefix(file_path), 'mqt-qmap-heuristic', execution_time, circ.num_qubits, circ.depth(), circ.size(), two_qubit_gates, swap_count])
            except Exception as e:
                print(e, file_path)

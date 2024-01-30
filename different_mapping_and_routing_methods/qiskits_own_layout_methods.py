import os
import time
import csv

import qiskit
from qiskit import transpile
from qiskit.providers.fake_provider import FakeTokyo

backend = FakeTokyo()
layouts = ['sabre', 'dense', 'trivial', 'noise_adaptive']


root_directory = 'sample_circuits/large'


def remove_prefix(filename):
    return filename.replace(f'{root_directory}/', '')


# Use os.walk to iterate through all files in the directory and its subdirectories
with open('csv_outputs/execution_times_qiskit_large.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)

    # Write the header row
    writer.writerow(['name', 'Layout', 'Execution_Time', 'Num_Qubits', 'Circuit_Depth', 'Circuit_Size', '2_qubit_gates', 'swap_gates_added'])
    for root, dirs, files in os.walk(root_directory):
        for file in files:
            file_path = os.path.join(root, file)  # Get the full path to the file
            print(file_path)
            circ = qiskit.QuantumCircuit.from_qasm_file(file_path)
            print(circ.num_qubits, circ.depth())
            two_qubit_gates = 0
            for j in range(len(circ)):
                qubits = circ[j][1]
                if len(qubits) == 2:
                    two_qubit_gates += 1
            for layout in layouts:
                try:
                    start_time = time.time()
                    qc_transpiled = transpile(circ, backend, layout_method=layout, optimization_level=3)
                    end_time = time.time()
                    file_name = f'./qiskit_test/{layout}_{remove_prefix(file_path)}'
                    with open(file_name, "w"):
                        pass
                    qc_transpiled.qasm(formatted=True, filename=file_name)
                    swap_count = qc_transpiled.count_ops().get('swap', 0)
                    print(qc_transpiled.count_ops())
                    execution_time = end_time - start_time
                    writer.writerow([remove_prefix(file_path), layout, execution_time, circ.num_qubits, circ.depth(), circ.size(), two_qubit_gates, swap_count])
                except Exception as e:
                    print(e, file_path)

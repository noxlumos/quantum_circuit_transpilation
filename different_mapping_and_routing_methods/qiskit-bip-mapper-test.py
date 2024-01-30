import csv
import os
import time

import qiskit
from qiskit import transpile
from qiskit.providers.fake_provider import FakeTokyo


backend = FakeTokyo()

# Set the folder path and pattern for the input files
folder = "OLSQ2/samples"

execution_times = []


def remove_prefix(filename):
    return filename.replace(f'{folder}/', '')

# Iterate through the files in the folder
for root, dirs, files in os.walk(folder):
    for file in files:
        file_path = os.path.join(root, file)  # Get the full path to the file
        print(file_path)
        circ = qiskit.QuantumCircuit.from_qasm_file(file_path)
        try:
            start_time = time.time()
            qc_transpiled = transpile(circ, backend, routing_method="bip", optimization_level=3)
            end_time = time.time()
            file_name = f'./samples_outputs/bip_{remove_prefix(file_path)}'
            with open(file_name, "w"):
                pass
            qc_transpiled.qasm(formatted=True, filename=file_name)
            swap_count = qc_transpiled.count_ops().get('swap', 0)
            print(qc_transpiled.count_ops())
            execution_time = end_time - start_time
            execution_times.append([file_path, execution_time, swap_count])
        except Exception as e:
            print(e, file_path)

# Save execution times to a CSV file
with open('execution_times_samples_bip.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)

    # Write the header row
    writer.writerow(['Filename', 'Execution_Time', 'swap'])

    # Write data rows
    writer.writerows(execution_times)

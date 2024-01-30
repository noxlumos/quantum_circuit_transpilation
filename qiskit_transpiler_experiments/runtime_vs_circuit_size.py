import csv
import time
import matplotlib.pyplot as plt
import numpy as np
import psutil

from qiskit.circuit.random import random_circuit
from qiskit import transpile
from qiskit.providers.fake_provider import FakeWashingtonV2

backend = FakeWashingtonV2()

# Varying parameters
qubit_counts = range(5, 125, 10)
circuit_depths = range(50, 1051, 100)

average_runtimes = []
csv_file_path = "csv_outputs/output.csv"

# Writing data to the CSV file
with open(csv_file_path, mode='w', newline='') as csv_file:
    csv_writer = csv.writer(csv_file)
    csv_writer.writerow(['num_qubits', 'circuit_depth', 'average_time'])

    for num_qubits in qubit_counts:
        average_runtimes_qubits = []
        for circuit_depth in circuit_depths:

            total_time = 0
            num_of_trials = 3
            for _ in range(num_of_trials):
                start_time = time.time()

                # Create a random quantum circuit
                circ = random_circuit(num_qubits, circuit_depth, measure=True)

                # Transpile circuit
                qc_basis = transpile(circ, backend, optimization_level=3)

                end_time = time.time()
                execution_time = end_time - start_time
                total_time += execution_time

            average_time = total_time / num_of_trials
            csv_writer.writerow([num_qubits, circuit_depth, average_time])
            average_runtimes_qubits.append(average_time)

        average_runtimes.append(average_runtimes_qubits)
        # Print the current CPU core count
        current_core_count = psutil.cpu_count(logical=False)  # Get physical core count
        print(f"Number of physical CPU cores used: {current_core_count}")

# Create a 3D plot
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

# Create X, Y mesh grid
X, Y = np.meshgrid(circuit_depths, qubit_counts)
Z = np.array(average_runtimes)

# Plot the surface
ax.plot_surface(X, Y, Z, cmap='viridis')

# Label the axes
ax.set_xlabel('Circuit Depth')
ax.set_ylabel('Number of Qubits')
ax.set_zlabel('Average Runtime (seconds)')
ax.set_title('Average Runtime vs Circuit Size')

plt.savefig('average_runtime_vs_circuit_size2.png')
plt.show()

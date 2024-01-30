import os
import subprocess
import time
import csv

# Set the folder path and pattern for the input files
folder = "./circuits/large"

# Set the additional command parameters
params = "couplings/tokyo.txt -defaults -latency Latency_1_2_6 -expander GreedyTopK 10 -queue TrimSlowNodes 2000 1000 -nodeMod GreedyMapper -retain 1"

execution_times = []

# Iterate through the files in the folder
for filename in os.listdir(folder):

    # Create the output file name
    output_file = f"outputs_large/tomq_{os.path.splitext(filename)[0]}.qasm"

    # Record the start time
    start_time = time.time()

    # Construct the command with the current file
    command = f"./mapper {os.path.join(folder, filename)} {params}"
    print(command)
    # Run the command and save the output to a file
    with open(output_file, "w") as output:
        subprocess.run(command, shell=True, stdout=output, stderr=subprocess.STDOUT)

    # Record the end time
    end_time = time.time()

    # Calculate the execution time
    execution_time = end_time - start_time

    execution_times.append([filename, execution_time])

    # Print the execution time and filename
    print(f"Execution time for {filename}: {execution_time} seconds")

# Save execution times to a CSV file
with open('execution_times_large22.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)

    # Write the header row
    writer.writerow(['Filename', 'Execution_Time'])

    # Write data rows
    writer.writerows(execution_times)
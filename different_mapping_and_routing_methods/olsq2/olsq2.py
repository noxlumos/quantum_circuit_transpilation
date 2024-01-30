import os
import subprocess
import time
import csv

# Set the folder path and pattern for the input files
folder = "./samples"

# Set the additional command parameters
execution_times = []

# Iterate through the files in the folder
for filename in os.listdir(folder):

    # Create the output file name

    # Record the start time
    start_time = time.time()

    # Construct the command with the current file
    command = f"python run_olsq.py --dt 'tokyo' --qf {folder}/{filename} --f ./outputs_medium_benchmark --swap --sabre --tran"
    print(command)
    subprocess.run(command, shell=True)
    # Record the end time
    end_time = time.time()

    # Calculate the execution time
    execution_time = end_time - start_time

    execution_times.append([filename, execution_time])

    # Print the execution time and filename
    print(f"Execution time for {filename}: {execution_time} seconds")

# Save execution times to a CSV file
with open('execution_times_medium_benchmarks.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)

    # Write the header row
    writer.writerow(['Filename', 'Execution_Time'])

    # Write data rows
    writer.writerows(execution_times)

import os
import time
import csv
from src import satmap

# Specify the directory where the .qasm files are located
directory = 'examples/large_2'

output = 'outputs/large/'

# List to store execution times
execution_times = []


# Loop through .qasm files in the directory
failed = 0
for filename in os.listdir(directory):
    if filename.endswith(".qasm"):
        qasm_file = os.path.join(directory, filename)
        print(qasm_file)
        # Construct and run the command
        start_time = time.time()
        args = satmap.MappingArguments(
            prog=qasm_file,
            arch='tokyo',
            output_path=output + 'satmap_' + filename,
            timeout=1800,
            k=25,
            cyclic='off',  # 'on' or 'off'
            no_route=False,  # True or False
            weighted=False,  # True or False
            err=None  # 'fake_tokyo' or 'fake_linear' or None
        )
        satmap.map_program(args)
        end_time = time.time()
        execution_time = end_time - start_time
        print(filename, ' execution time: ', execution_time)
        # Append the execution time to the list
        execution_times.append([filename, execution_time])

# Save execution times to a CSV file
with open('execution_times2.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)

    # Write the header row
    writer.writerow(['Filename', 'Execution_Time'])

    # Write data rows
    writer.writerows(execution_times)

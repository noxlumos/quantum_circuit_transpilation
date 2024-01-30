import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
import numpy as np

# Read the CSV file into a DataFrame
df = pd.read_csv('csv_outputs/output_data.csv')

# Define the columns to be plotted
columns_to_plot = ['execution_time_dense', 'execution_time_sabre', 'execution_time_noise_adaptive', 'execution_time_trivial', 'execution_time_toqm','execution_time_satmap','execution_time_tb-olsq2', 'execution_time_qmap_heuristic']
#columns_to_plot = ['execution_time_dense', 'execution_time_sabre', 'execution_time_noise_adaptive', 'execution_time_trivial', 'execution_time_toqm', 'execution_time_qmap-heuristic']
df = df.sort_values(by='Circuit_Size')

# Create a new column combining "name" and "Circuit_Size"
df['name'] = df['name'].str.replace('.qasm', '')
df['name_and_size'] = df['name'] + ", " + df['Circuit_Size'].astype(str)

# Create an array of indices for the x-axis (position of each data point)
x = np.arange(len(df))

# Set the figure size to make it wider
plt.figure(figsize=(12, 6))  # Adjust the width as needed


# Create line plots for each column and add labels with "execution_time_" removed
for column in columns_to_plot:
    label = column.replace('execution_time_', '')
    plt.plot(x, df[column], label=label)

# Customize the plot
plt.xlabel('Circuit, Size')
plt.ylabel('Transpilation Time (seconds)')
plt.title('Transpilation Time vs. Circuits for Different Layouts')

# Set y-axis to logarithmic scale
plt.yscale('log')

# Rotate x-axis labels for better readability
plt.xticks(x, df['name_and_size'], rotation=45, ha='right')  # Rotate by 45 degrees and align to the right

# Add a legend outside the plot
plt.legend(loc='upper left', bbox_to_anchor=(0, 1))

# Save the plot as a PNG file
plt.tight_layout()
plt.savefig('line_chart_time_vs_circuit_small', bbox_inches='tight')

# Show the plot (optional)
plt.show()

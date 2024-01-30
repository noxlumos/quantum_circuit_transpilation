def swap_gate_count(qc):
    # Initialize variables for swap gate tracking
    swap_sequence = []
    swap_gate_count = 0

    for instruction in qc:
        gate_name = instruction.operation.name

        # Check if the gate is a CNOT gate (swap)
        if gate_name == 'cx':
            swap_sequence.append(instruction)
            if len(swap_sequence) == 3:
                qubits1 = swap_sequence[0].qubits
                qubits2 = swap_sequence[1].qubits
                qubits3 = swap_sequence[2].qubits

                # Check if the sequence matches your desired pattern
                if (qubits1[0] == qubits2[1] and qubits1[1] == qubits2[0] and
                        qubits2[0] == qubits3[1] and qubits2[1] == qubits3[0]):
                    swap_gate_count += 1
                    swap_sequence = []
                else:
                    # Remove the first element in the sequence to continue searching
                    swap_sequence.pop(0)
        elif gate_name == 'swp' or gate_name == 'swap':
            swap_sequence = []
            swap_gate_count += 1
        else:
            # Reset the tracking if a non-CNOT gate is encountered
            swap_sequence = []
    return swap_gate_count
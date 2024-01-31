There are 4 main analysis conducted:

- Analysis of Qiskit's Transpiler ([qiskit_transpiler_experiments](qiskit_transpiler_experiments))
  
  - Optimization Level Comparison

  - Maximum Circuit Size Analysis
 
  - Backend-Specific Transpilation Analysis

- Qiskit's Transpiler Breakdown ([qiskit_transpiler_breakdown](qiskit_transpiler_breakdown))

  Qiskit's transpiler is composed of several passes, each handling a specific aspect of the transpilation process. To analyze each pass I used the code from
[qiskit-timeline-debugger](https://github.com/TheGupta2012/qiskit-timeline-debugger). Files step_collector.py and step_collector_models.py are from that repository.
I only changed the code to store the results to a csv file, instead of printing the results to a CLI tool.

- Analysis of State-of-Art Qubit Mapping and Routing Algorithms ([different_mapping_and_routing_methods](different_mapping_and_routing_methods))

  - Qiskit's Algorithms

  [qiskits_own_layout_methods.py](different_mapping_and_routing_methods/qiskits_own_layout_methods.py) is used to transpile the [sample circuits](different_mapping_and_routing_methods/sample_circuits)
  using Qiskit's 4 different layout methods
    
    - Sabre
   
    - Dense
   
    - Trivial
   
    - Noise-Adaptive

  Transpilation time and number of swap gates added after each method is stored as [csv files](different_mapping_and_routing_methods/csv_outputs)
  
  - External Algorithms
  
    - TB-OLSQ2
    
    [olsq2.py](different_mapping_and_routing_methods/olsq2/olsq2.py) analyzes [the repository](https://github.com/UCLA-VAST/OLSQ2).
    In order this python code to work first clone the repository to same level.
      
    - SATMap
   
    [satmap_trials.py](different_mapping_and_routing_methods/satmap/satmap_trials.py) analyzes [the repository](https://github.com/qqq-wisc/satmap).
    In order this python code to work clone and install the repository to same level. 
      
    - TOQM
   
    [toqm.py](different_mapping_and_routing_methods/toqm/toqm.py) analyzes [the repository](https://github.com/qqq-wisc/satmap).
    In order this python code to work clone the repository to same level. 
      
    - QMap
   
    [mqt_qmap.py](different_mapping_and_routing_methods/mqt_qmap.py) analyzes [the repository]([https://github.com/qqq-wisc/satmap](https://github.com/cda-tum/mqt-qmap)).
    In order this python code to work, Install the package with `(venv) $ pip install mqt.qmap`
      
- Transpilation with a Subarchitecture

  //TO DO add the code for fullpipeline from extracting subarchitecture with highest fidelity to running satmap and sabre with those architectures here.


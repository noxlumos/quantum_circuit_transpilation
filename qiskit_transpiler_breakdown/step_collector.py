from copy import deepcopy
from pathlib import Path
import csv

from step_collector_models import PassType, TranspilationStep, Property

_properties = {}

# a list of lists where the first list contains the headers
_raw_steps = []
_outputs_folder = "./outputs/dense/"


def on_step_callback(**kwargs):
    pass_ = kwargs["pass_"]

    pass_type = (
        PassType.ANALYSIS if pass_.is_analysis_pass else PassType.TRANSFORMATION
    )

    transpilation_step = TranspilationStep(pass_.name(), pass_type)
    transpilation_step.docs = pass_.__doc__
    transpilation_step.run_method_docs = getattr(pass_, "run").__doc__

    transpilation_step.duration = round(1000 * kwargs["time"], 2)

    # Properties
    property_set = kwargs["property_set"]
    _added_props = []
    _updated_props = []
    for key in property_set:
        value = property_set[key]
        if key not in _properties.keys():
            _added_props.append(key)
        elif (_properties[key] is None) and (value is not None):
            _updated_props.append(key)
        elif hasattr(value, "__len__") and (
                len(value) != len(_properties[key])
        ):
            _updated_props.append(key)

    if len(_added_props) > 0 or len(_updated_props) > 0:
        for property_name in property_set:
            _properties[property_name] = property_set[property_name]

            property_state = ""
            if property_name in _added_props:
                property_state = "new"
            elif property_name in _updated_props:
                property_state = "updated"

            transpilation_step.property_set[property_name] = Property(
                property_name,
                type(property_set[property_name]),
                property_set[property_name],
                property_state,
            )

    dag = deepcopy(kwargs["dag"])

    # circuit stats:
    if pass_.is_analysis_pass and len(_raw_steps) > 0:
        transpilation_step.circuit_stats = _raw_steps[
            -1
        ].circuit_stats
    else:
        transpilation_step.circuit_stats.width = dag.width()
        transpilation_step.circuit_stats.size = dag.size()
        transpilation_step.circuit_stats.depth = dag.depth()

        circ_ops = {1: 0, 2: 0, 3: 0}

        for node in dag.op_nodes(include_directives=False):
            operands_count = len(node.qargs)
            if operands_count < 4:
                circ_ops[operands_count] += 1

        transpilation_step.circuit_stats.ops_1q = circ_ops[1]
        transpilation_step.circuit_stats.ops_2q = circ_ops[2]
        transpilation_step.circuit_stats.ops_3q = circ_ops[3]

    # Store `dag` to use it for circuit plot generation:
    if (
            transpilation_step.pass_type == PassType.TRANSFORMATION
            and transpilation_step.circuit_stats.depth <= 300
    ):
        transpilation_step.dag = dag

    _raw_steps.append(transpilation_step)


def write_steps_to_csv(filename):
    Path(_outputs_folder).mkdir(parents=True, exist_ok=True)

    _steps = [[
        "Pass Name",
        "Pass Type",
        "Runtime (ms)",
        "Depth",
        "Size",
        "1q Gates",
        "2q Gates",
        "Width",
    ]]

    for transpilation_step in _raw_steps:
        _steps.append([
            transpilation_step.name,
            transpilation_step.pass_type.value,
            transpilation_step.duration,
            transpilation_step.circuit_stats.depth,
            transpilation_step.circuit_stats.size,
            transpilation_step.circuit_stats.ops_1q,
            transpilation_step.circuit_stats.ops_2q,
            transpilation_step.circuit_stats.width,
        ])

    write_file_path = _outputs_folder + filename

    with open(write_file_path, 'w') as f:
        writer = csv.writer(f)
        writer.writerows(_steps)

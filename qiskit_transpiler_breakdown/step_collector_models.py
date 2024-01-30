from enum import Enum
from collections import defaultdict


class Property:
    """Implements the property of a transpiler pass as a data structure."""

    LARGE_VALUE_THRESHOLD = 2000

    def __init__(self, name, prop_type, value, state) -> None:
        self.name = name
        self.prop_type = prop_type
        self.state = state

        if prop_type in (list, defaultdict) and (
            len(value) > self.LARGE_VALUE_THRESHOLD
        ):
            print(len(value))
            self.value = "LARGE_VALUE"
        else:
            self.value = value

    def __repr__(self) -> str:
        return f"{self.name} ({self.prop_type.__name__}) : {self.value}"

    def __eq__(self, other):
        if self.name != other.name:
            return False
        if self.prop_type != other.prop_type:
            return False
        if self.state != other.state:
            return False
        if self.value != other.value:
            return False
        return True


class PassType(Enum):
    """Defines the analysis and transformation passes
    as enums.
    """

    ANALYSIS = "Analysis"
    TRANSFORMATION = "Transformation"


"""Implements a transpiler pass as a common data structure called TranspilationStep.
"""
class CircuitStats:
    """Class to capture different circuit statistics for a quantum circuit."""

    def __init__(self) -> None:
        self.width = None
        self.size = None
        self.depth = None
        self.ops_1q = None
        self.ops_2q = None
        self.ops_3q = None

    def __eq__(self, other):
        return (
            self.width == other.width
            and self.size == other.size
            and self.depth == other.depth
            and self.ops_1q == other.ops_1q
            and self.ops_2q == other.ops_2q
            and self.ops_3q == other.ops_3q
        )

    def __repr__(self) -> str:
        return f"""CircuitStats(width={self.width},
                size={self.size}, depth={self.depth}, 
                1q-ops={self.ops_1q},
                2q-ops={self.ops_2q}, 
                3+q-ops={self.ops_3q})"""

class TranspilationStep:
    """Models a transpilation pass as a step
    with different types of properties and
    statistics
    """

    def __init__(self, name, pass_type) -> None:
        self.index = None
        self.name = name
        self.pass_type = pass_type
        self.docs = ""
        self.run_method_docs = ""
        self.duration = 0
        self.circuit_stats = CircuitStats()
        self.property_set = {}
        self.property_set_index = None
        self.logs = []
        self.dag = None

    def __repr__(self) -> str:
        return f"(name={self.name}, pass_type={self.pass_type})"

    def get_docs(self):
        """Return doc string of the pass

        Returns:
            str: docstring of the step
        """
        return self.docs

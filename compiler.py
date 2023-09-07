"""
This file contains the compiler for Aleo.
"""

import string

from absl import app
from absl import flags
from absl import logging
import numpy as np


TEMPLATE = """
program hack_simple_model.aleo {
    struct Input {
        ${def_input}
    }

    struct Layer1 {
        ${def_layer1}
    }

    struct Intermediate {
        ${def_intermediate}
    }

    struct Layer2 {
        ${def_layer2}
    }

    inline run_layer1(input: Input, layer1: Layer1) -> Intermediate {
        ${layer_1_body}
    }
}
"""
TEMPLATE = string.Template(TEMPLATE)


def get_layer_def(weight: np.array, bias: np.array):
    assert len(weight.shape) == 2
    assert len(bias.shape) == 1
    assert weight.shape[1] == bias.shape[0]
    defs = ""
    for i in range(weight.shape[0]):
        for j in range(weight.shape[1]):
            defs += f"x{i}{j}: field,\n"
    for i in range(bias.shape[0]):
        defs += f"b{i}: field,\n"
    return defs


def get_vector_def(vector: np.array):
    return ", \n".join([f"value{i}: field" for i in range(len(vector))])


def get_layer_1_body(weight: np.array, bias: np.array):
    assert len(weight.shape) == 2
    assert len(bias.shape) == 1
    assert weight.shape[1] == bias.shape[0]
    code = ""
    for j in range(weight.shape[1]):
        code += f"let y{j}: field ="
        for i in range(weight.shape[0]):
            code += f"layer1.weights.w{i}{j} * input.value{i} + "
        code += f"layer1.bias.b{j};\n"
    return code


# def main(_):
#     input_vec = np.random.rand(8)
#     input_def = get_vector_def(input_vec)
#
#     w1 = np.random.rand(8, 4)
#     b1 = np.random.rand(4)
#     layer1 = get_layer_def(w1, b1)
#
#     inter_vec = np.random.rand(4)
#     inter_def = get_vector_def(inter_vec)
#
#     w2 = np.random.rand(4, 1)
#     b2 = np.random.rand(1)
#     layer2 = get_layer_def(w2, b2)
#
#     layer_1_body = get_layer_1_body(w1, b1)
#
#     program = TEMPLATE.substitute({
#         "def_layer1": layer1,
#         "def_layer2": layer2,
#         "def_input": input_def,
#         "def_intermediate": inter_def,
#         "layer_1_body": layer_1_body,
#     })

def main(_):
    w1 = np.random.rand(8, 4)
    b1 = np.random.rand(4)
    payload = '{'

    payload += 'weights: {'
    for i in range(w1.shape[0]):
        for j in range(w1.shape[1]):
            payload += f"w{i}{j}: {w1[i][j]},  "
    payload += '}, '
    payload += 'bias: {'
    for i in range(b1.shape[0]):
        payload += f"b{i}: {b1[i]}, "
    payload += '}, '
    print(payload)

    print("=================================================================")
    print("=================================================================")
    print("=================================================================")
    print("=================================================================")

    code = get_layer_1_body(w1, b1)
    print(code)





if __name__ == "__main__":
    app.run(main)

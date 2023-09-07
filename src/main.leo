// The 'onchainml' program.
program onchainml.aleo {
    struct Input {
        value0: field,
        value1: field,
        value2: field,
        value3: field,
        value4: field,
        value5: field,
        value6: field,
        value7: field
    }

    struct Layer1Weights {
        w00: field,
        w01: field,
        w02: field,
        w03: field,
        w10: field,
        w11: field,
        w12: field,
        w13: field,
        w20: field,
        w21: field,
        w22: field,
        w23: field,
        w30: field,
        w31: field,
        w32: field,
        w33: field,
        w40: field,
        w41: field,
        w42: field,
        w43: field,
        w50: field,
        w51: field,
        w52: field,
        w53: field,
        w60: field,
        w61: field,
        w62: field,
        w63: field,
        w70: field,
        w71: field,
        w72: field,
        w73: field,
    }

    struct Layer1Bias {
        b0: field,
        b1: field,
        b2: field,
        b3: field,
    }

    struct Layer1 {
        weights: Layer1Weights,
        bias: Layer1Bias,
    }

    mapping layer1Store: u8 => Layer1;

    transition setup_network(public layer1: Layer1, public layer2: Layer2) {
        // Just a way of directly calling finalize
        return then finalize(layer1, layer2);
    }

    finalize setup_network (public layer1: Layer1, public layer2: Layer2) {
        Mapping::set(layer1Store, 0u8, layer1);
        Mapping::set(layer2Store, 0u8, layer2);
    }

    struct Vector {
        x0: field,
        x1: field,
        x2: field,
        x3: field,
    }

    inline vector_length(u: Vector) -> field {
        return u.x0 * u.x0 + u.x1 * u.x1;
    }

    inline vector_dot(u: Vector, v: Vector) -> field {
        return u.x0 * v.x0 + u.x1 * v.x1;
    }

    inline cosine_similarity(u: Vector, v: Vector) -> field {
        let denom: field = vector_length(u).square_root() * vector_length(v).square_root();
        let num: field = vector_dot(u, v);
        return num / denom;
    }

    transition inference(public input: Input, layer1: Layer1) -> field {
      let y0: field =layer1.weights.w00 * input.value0 + layer1.weights.w10 * input.value1 + layer1.weights.w20 * input.value2 + layer1.weights.w30 * input.value3 + layer1.weights.w40 * input.value4 + layer1.weights.w50 * input.value5 + layer1.weights.w60 * input.value6 + layer1.weights.w70 * input.value7 + layer1.bias.b0;
let y1: field =layer1.weights.w01 * input.value0 + layer1.weights.w11 * input.value1 + layer1.weights.w21 * input.value2 + layer1.weights.w31 * input.value3 + layer1.weights.w41 * input.value4 + layer1.weights.w51 * input.value5 + layer1.weights.w61 * input.value6 + layer1.weights.w71 * input.value7 + layer1.bias.b1;
let y2: field =layer1.weights.w02 * input.value0 + layer1.weights.w12 * input.value1 + layer1.weights.w22 * input.value2 + layer1.weights.w32 * input.value3 + layer1.weights.w42 * input.value4 + layer1.weights.w52 * input.value5 + layer1.weights.w62 * input.value6 + layer1.weights.w72 * input.value7 + layer1.bias.b2;
let y3: field =layer1.weights.w03 * input.value0 + layer1.weights.w13 * input.value1 + layer1.weights.w23 * input.value2 + layer1.weights.w33 * input.value3 + layer1.weights.w43 * input.value4 + layer1.weights.w53 * input.value5 + layer1.weights.w63 * input.value6 + layer1.weights.w73 * input.value7 + layer1.bias.b3;

        let u: Vector = Vector {
            x0: y0,
            x1: y1,
            x2: y2,
            x3: y3,
        };

        // TODO: Save this to a mapping for every user.
        let v: Vector = Vector {
            x0: 1field,
            x1: 2field,
            x2: 3field,
            x3: 4field,
        };
        return cosine_similarity(u, v)
}

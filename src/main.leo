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
        x00: field,
        x01: field,
        x02: field,
        x03: field,
        x10: field,
        x11: field,
        x12: field,
        x13: field,
        x20: field,
        x21: field,
        x22: field,
        x23: field,
        x30: field,
        x31: field,
        x32: field,
        x33: field,
        x40: field,
        x41: field,
        x42: field,
        x43: field,
        x50: field,
        x51: field,
        x52: field,
        x53: field,
        x60: field,
        x61: field,
        x62: field,
        x63: field,
        x70: field,
        x71: field,
        x72: field,
        x73: field,
    }

    struct Layer1Bias {
        b0: field,
        b1: field,
        b2: field,
        b3: field,
    }

    struct Layer2Weights {
        x00: field,
        x10: field,
        x20: field,
        x30: field,

    }

    struct Layer2Bias {
        b0: field,
    }

    struct Intermediate {
        value0: field, 
        value1: field, 
        value2: field, 
        value3: field
    }

    struct Layer1 {
        weights: Layer1Weights,
        bias: Layer1Bias,
    }

    struct Layer2 {
        weights: Layer2Weights,
        bias: Layer2Bias,
    }

    mapping layer1Store: u8 => Layer1;
    mapping layer2Store: u8 => Layer2;

    transition setup_network(public layer1: Layer1, public layer2: Layer2) {
        // Just a way of directly calling finalize
        return then finalize(layer1, layer2);
    }

    finalize setup_network (public layer1: Layer1, public layer2: Layer2) {
        Mapping::set(layer1Store, 0u8, layer1);
        Mapping::set(layer2Store, 0u8, layer2);
    }

    transition inference(public input: Input) -> u8 {
        return 1u8;
    } 
}

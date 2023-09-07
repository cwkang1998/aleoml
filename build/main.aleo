program onchainml.aleo;

struct Input:
    value0 as field;
    value1 as field;
    value2 as field;
    value3 as field;
    value4 as field;
    value5 as field;
    value6 as field;
    value7 as field;

struct Layer1Weights:
    x00 as field;
    x01 as field;
    x02 as field;
    x03 as field;
    x10 as field;
    x11 as field;
    x12 as field;
    x13 as field;
    x20 as field;
    x21 as field;
    x22 as field;
    x23 as field;
    x30 as field;
    x31 as field;
    x32 as field;
    x33 as field;
    x40 as field;
    x41 as field;
    x42 as field;
    x43 as field;
    x50 as field;
    x51 as field;
    x52 as field;
    x53 as field;
    x60 as field;
    x61 as field;
    x62 as field;
    x63 as field;
    x70 as field;
    x71 as field;
    x72 as field;
    x73 as field;

struct Layer1Bias:
    b0 as field;
    b1 as field;
    b2 as field;
    b3 as field;

struct Layer2Weights:
    x00 as field;
    x10 as field;
    x20 as field;
    x30 as field;

struct Layer2Bias:
    b0 as field;

struct Intermediate:
    value0 as field;
    value1 as field;
    value2 as field;
    value3 as field;

struct Layer1:
    weights as Layer1Weights;
    bias as Layer1Bias;

struct Layer2:
    weights as Layer2Weights;
    bias as Layer2Bias;


mapping layer1Store:
	key left as u8.public;
	value right as Layer1.public;


mapping layer2Store:
	key left as u8.public;
	value right as Layer2.public;

function setup_network:
    input r0 as Layer1.public;
    input r1 as Layer2.public;

    finalize r0 r1;

finalize setup_network:
    input r0 as Layer1.public;
    input r1 as Layer2.public;
    set r0 into layer1Store[0u8];
    set r1 into layer2Store[0u8];


function inference:
    input r0 as Input.public;
    output 1u8 as u8.private;

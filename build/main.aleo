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
    w00 as field;
    w01 as field;
    w02 as field;
    w03 as field;
    w10 as field;
    w11 as field;
    w12 as field;
    w13 as field;
    w20 as field;
    w21 as field;
    w22 as field;
    w23 as field;
    w30 as field;
    w31 as field;
    w32 as field;
    w33 as field;
    w40 as field;
    w41 as field;
    w42 as field;
    w43 as field;
    w50 as field;
    w51 as field;
    w52 as field;
    w53 as field;
    w60 as field;
    w61 as field;
    w62 as field;
    w63 as field;
    w70 as field;
    w71 as field;
    w72 as field;
    w73 as field;

struct Layer1Bias:
    b0 as field;
    b1 as field;
    b2 as field;
    b3 as field;

struct Layer1:
    weights as Layer1Weights;
    bias as Layer1Bias;

record Model:
    owner as address.private;
    layer1 as Layer1.private;

struct Vector:
    x0 as field;
    x1 as field;
    x2 as field;
    x3 as field;


mapping models:
	key left as address.public;
	value right as Layer1.public;

function new_model:
    input r0 as Layer1.public;
    cast self.caller r0 into r1 as Model.record;
    output r1 as Model.record;

    finalize self.caller r0;

finalize new_model:
    input r0 as address.public;
    input r1 as Layer1.public;
    set r1 into models[r0];








function inference:
    input r0 as Model.record;
    input r1 as Input.private;
    mul r0.layer1.weights.w00 r1.value0 into r2;
    mul r0.layer1.weights.w10 r1.value1 into r3;
    add r2 r3 into r4;
    mul r0.layer1.weights.w20 r1.value2 into r5;
    add r4 r5 into r6;
    mul r0.layer1.weights.w30 r1.value3 into r7;
    add r6 r7 into r8;
    mul r0.layer1.weights.w40 r1.value4 into r9;
    add r8 r9 into r10;
    mul r0.layer1.weights.w50 r1.value5 into r11;
    add r10 r11 into r12;
    mul r0.layer1.weights.w60 r1.value6 into r13;
    add r12 r13 into r14;
    mul r0.layer1.weights.w70 r1.value7 into r15;
    add r14 r15 into r16;
    add r16 r0.layer1.bias.b0 into r17;
    mul r0.layer1.weights.w01 r1.value0 into r18;
    mul r0.layer1.weights.w11 r1.value1 into r19;
    add r18 r19 into r20;
    mul r0.layer1.weights.w21 r1.value2 into r21;
    add r20 r21 into r22;
    mul r0.layer1.weights.w31 r1.value3 into r23;
    add r22 r23 into r24;
    mul r0.layer1.weights.w41 r1.value4 into r25;
    add r24 r25 into r26;
    mul r0.layer1.weights.w51 r1.value5 into r27;
    add r26 r27 into r28;
    mul r0.layer1.weights.w61 r1.value6 into r29;
    add r28 r29 into r30;
    mul r0.layer1.weights.w71 r1.value7 into r31;
    add r30 r31 into r32;
    add r32 r0.layer1.bias.b1 into r33;
    mul r0.layer1.weights.w02 r1.value0 into r34;
    mul r0.layer1.weights.w12 r1.value1 into r35;
    add r34 r35 into r36;
    mul r0.layer1.weights.w22 r1.value2 into r37;
    add r36 r37 into r38;
    mul r0.layer1.weights.w32 r1.value3 into r39;
    add r38 r39 into r40;
    mul r0.layer1.weights.w42 r1.value4 into r41;
    add r40 r41 into r42;
    mul r0.layer1.weights.w52 r1.value5 into r43;
    add r42 r43 into r44;
    mul r0.layer1.weights.w62 r1.value6 into r45;
    add r44 r45 into r46;
    mul r0.layer1.weights.w72 r1.value7 into r47;
    add r46 r47 into r48;
    add r48 r0.layer1.bias.b2 into r49;
    mul r0.layer1.weights.w03 r1.value0 into r50;
    mul r0.layer1.weights.w13 r1.value1 into r51;
    add r50 r51 into r52;
    mul r0.layer1.weights.w23 r1.value2 into r53;
    add r52 r53 into r54;
    mul r0.layer1.weights.w33 r1.value3 into r55;
    add r54 r55 into r56;
    mul r0.layer1.weights.w43 r1.value4 into r57;
    add r56 r57 into r58;
    mul r0.layer1.weights.w53 r1.value5 into r59;
    add r58 r59 into r60;
    mul r0.layer1.weights.w63 r1.value6 into r61;
    add r60 r61 into r62;
    mul r0.layer1.weights.w73 r1.value7 into r63;
    add r62 r63 into r64;
    add r64 r0.layer1.bias.b3 into r65;
    cast r17 r33 r49 r65 into r66 as Vector;
    cast 1field 2field 3field 4field into r67 as Vector;
    mul r66.x0 r66.x0 into r68;
    mul r66.x1 r66.x1 into r69;
    add r68 r69 into r70;
    sqrt r70 into r71;
    mul r67.x0 r67.x0 into r72;
    mul r67.x1 r67.x1 into r73;
    add r72 r73 into r74;
    sqrt r74 into r75;
    mul r71 r75 into r76;
    mul r66.x0 r67.x0 into r77;
    mul r66.x1 r67.x1 into r78;
    add r77 r78 into r79;
    div r79 r76 into r80;
    output r80 as field.private;

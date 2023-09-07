// The 'onchainml' program.
program onchainml.aleo {

    // function sigmoid(x: field) -> field {
    //     return 1field / (1field + x.square());
    // }

    // function nnode() {
        
    // }

    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }
}

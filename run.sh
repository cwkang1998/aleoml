#!/bin/bash

# The private key and address of the Alice.
# Swap these into program.json, when running transactions as the first bidder.
# "private_key": "APrivateKey1zkp1w8PTxrRgGfAtfKUSq43iQyVbdQHfhGbiNPEg2LVSEXR",
# "address": "aleo13ssze66adjjkt795z9u5wpq8h6kn0y2657726h4h3e3wfnez4vqsm3008q"

# The private key and address of the Bob.
# Swap these into program.json, when running transactions as the second bidder.
# "private_key": "APrivateKey1zkpFo72g7N9iFt3JzzeG8CqsS5doAiXyFvNCgk2oHvjRCzF"
# "address": "aleo17vy26rpdhqx4598y5gp7nvaa9rk7tnvl6ufhvvf4calsrrqdaqyshdsf5z"

# Swap in the private key of Alice.
echo "
NETWORK=testnet3
PRIVATE_KEY=APrivateKey1zkp1w8PTxrRgGfAtfKUSq43iQyVbdQHfhGbiNPEg2LVSEXR
" > .env

# Register Alice voice with the contract
echo "
###############################################################################
########                                                               ########
########     STEP 1: Publicly mint 100 tokens for Alice                ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PUBLIC BALANCES            |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |         100         |           ########
########           -----------------------------------------           ########
########           |        Bob      |          0          |           ########
########           -----------------------------------------           ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PRIVATE BALANCES           |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |          0          |           ########
########           -----------------------------------------           ########
########           |        Bob      |          0          |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run mint_public aleo13ssze66adjjkt795z9u5wpq8h6kn0y2657726h4h3e3wfnez4vqsm3008q 100u64

# Verify that the voice can unlock the contract and authenticate
echo "
NETWORK=testnet3
PRIVATE_KEY=APrivateKey1zkpFo72g7N9iFt3JzzeG8CqsS5doAiXyFvNCgk2oHvjRCzF
" > .env

# Swap in the private key of Bob.
echo "
NETWORK=testnet3
PRIVATE_KEY=APrivateKey1zkp1w8PTxrRgGfAtfKUSq43iQyVbdQHfhGbiNPEg2LVSEXR
" > .env

# Try to verify with Bob's voice
echo "
###############################################################################
########                                                               ########
########     STEP 3: Publicly transfer 10 tokens from Alice to Bob     ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PUBLIC BALANCES            |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |          90         |           ########
########           -----------------------------------------           ########
########           |        Bob      |          10         |           ########
########           -----------------------------------------           ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PRIVATE BALANCES           |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |          0          |           ########
########           -----------------------------------------           ########
########           |        Bob      |         100         |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run transfer_public aleo17vy26rpdhqx4598y5gp7nvaa9rk7tnvl6ufhvvf4calsrrqdaqyshdsf5z 10u64
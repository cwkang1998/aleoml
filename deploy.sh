PRIVATEKEY=""
WALLETADDRESS="aleo1c5c24skzvfxuegt0ykeldhcv8s7nstfjk530qdywga5jaacn9g8qk7musl"

APPNAME="onchainml"
PATHTOAPP=$(realpath -q $APPNAME)

RECORD="{
}"

snarkos developer deploy "${APPNAME}.aleo" --private-key "${PRIVATEKEY}" --query "https://vm.aleo.org/api" --path "./build/" --broadcast "https://vm.aleo.org/api/testnet3/transaction/broadcast" --fee 1000000 --record "${RECORD}"``
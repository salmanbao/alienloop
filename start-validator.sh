#!/bin/bash
exec solana-validator \
--identity ~/solana-chain/validator-keypair.json \
--vote-account ~/solana-chain/vote-account-keypair.json \
--init-complete-file ~/solana-chain/init-completed \
--log ~/solana-chain/solana-validator.log \
--rpc-faucet-address 127.0.0.1:9900 \
--dynamic-port-range 8000-8020 \
--no-wait-for-vote-to-start-leader \
--ledger ~/solana-chain/ledger/ \
--enable-rpc-transaction-history \
--enable-cpi-and-log-storage \
--no-os-network-limits-test \
--only-known-rpc \
--full-rpc-api \
--rpc-port 8899 \
--require-tower \
--limit-ledger-size

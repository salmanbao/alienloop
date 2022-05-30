#!/usr/bin/env bash

echo "Creating staking account"
solana create-stake-account ~/solana-chain/stake-account.json 1000 \
--from ~/.config/solana/id.json \
--stake-authority ~/.config/solana/id.json \
--withdraw-authority ~/.config/solana/id.json \
--fee-payer ~/.config/solana/id.json

echo "Check staking account"
solana stake-account $(solana-keygen pubkey ~/solana-chain/stake-account.json)

echo "Delegating stake" 
solana delegate-stake \
--stake-authority ~/.config/solana/id.json $(solana-keygen pubkey ~/solana-chain/stake-account.json) J9g6yHv3tiLhE6zbXhxQ6hXZsAqYBTjYDZ9yuHbRKZdy \
--fee-payer ~/.config/solana/id.json

echo "Check staking account"
solana stake-account $(solana-keygen pubkey ~/solana-chain/stake-account.json)

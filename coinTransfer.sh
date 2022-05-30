#!/usr/bin/env bash

echo "## Solana Cli configurations ##"
solana config get

echo "## Set cluster/rpc endpoint ##"

solana config set --url http://localhost:8899

echo "## Current user address ##"

echo "User Address: $(solana-keygen pubkey ~/.config/solana/id.json)"

echo "## Intial ALP Balance ##" 

echo "## Sender user coin balance ##"
solana balance $(solana-keygen pubkey ~/.config/solana/id.json)

echo "## Receiver user coin balance ##"
solana balance $(solana-keygen pubkey ~/solana-chain/user.json)


echo "## Transfer 100 ALP coins from sender address to receiver address ##"
solana transfer --from ~/.config/solana/id.json --allow-unfunded-recipient --fee-payer ~/.config/solana/id.json "$(solana-keygen pubkey ~/solana-chain/user.json)" 100

echo "## After Transaction ALP Balance ##" 

echo "## Sender user coin balance ##"
solana balance $(solana-keygen pubkey ~/.config/solana/id.json)

echo "## Receiver user coin balance ##"
solana balance $(solana-keygen pubkey ~/solana-chain/user.json)


solana delegate-stake --stake-authority ~/.config/solana/id.json 2VM4nZqKae82MvSpqS9gnHWM34XLX1Ec3MCQ2ayQYoqe 61n3ssFCQt7JSWAy5SVSSEiqN8ffFwEH4cXAxWUyn3ig --fee-payer ~/.config/solana/id.json

#!/usr/bin/env bash

## Creating SPL Token ##

output=$(spl-token create-token)
echo $output

IFS=' '
read -a strarr <<< "$output"
echo "Newly Created Token Address: ${strarr[2]}"

echo "Token supply : $(spl-token supply ${strarr[2]})"

echo "## Creating token account ##"
spl-token create-account ${strarr[2]}


echo "Token balance : $(spl-token balance ${strarr[2]})"

echo "## Mint 100 Tokens ##"
spl-token mint ${strarr[2]} 100

echo "Token supply after minting : $(spl-token supply ${strarr[2]})"

echo "Token balance : $(spl-token balance ${strarr[2]})"

echo "## Token Accounts of current user before sending tokens ##"
spl-token accounts -v

echo "## Transfering 50 tokens to the other user ##"
spl-token transfer ${strarr[2]} 50 $(solana-keygen pubkey ~/solana-chain/user.json) --fund-recipient

echo "## Token Accounts of current user after sending tokens ##"
spl-token accounts -v



curl http://localhost:8899 -X POST -H "Content-Type: application/json" -d '
  {
    "jsonrpc": "2.0",
    "id": 1,
    "method": "getProgramAccounts",
    "params": [
      "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA",
      {
        "encoding": "jsonParsed",
        "filters": [
          {
            "dataSize": 165
          },
          {
            "memcmp": {
              "offset": 0,
              "bytes": "P5TsgeHtiUmc9sggdH2MnW22EAT9gR4bBePFAnzu7oR"
            }
          }
        ]
      }
    ]
  }
'
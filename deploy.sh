#!/bin/bash
set -a
source .env
set +a

docker login tts.registry.jetbrains.space -u $reg_user -p $reg_pat

docker pull tts.registry.jetbrains.space/p/rms/rms-import-data/rms-import-data:latest

./sync.sh
./rms.sh
./gateway.sh
./portal.sh


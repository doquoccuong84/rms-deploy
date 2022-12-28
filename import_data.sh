#!/bin/bash
cd rms-ops/import-data

set -a
source ../../.env
set +a

cat << EOF > .env
DB_NAME=$rms_db_name
DB_USERNAME=$rms_db_username
DB_PASSWORD=$rms_db_password
EOF

docker compose up
cd ..

echo Finished import
#!/bin/bash
cd rms-ops/rms-gateway
cat << EOF > .env
CASDOOR_AUTH_SERVER=http://localhost:$casdoor_port
INTERNAL_AUTH_SERVER=http://casdoor_prod:$casdoor_port
BACKEND_SERVICE=http://rms_api_prod:$rms_api_port
SYNC_SERVICE=http://rabbitmq:$rabbitmq_dashboard_port
GATEWAY_PORT=$gateway_port
CASDOOR_PORT=$casdoor_port
CASDOOR_DB_PORT=$casdoor_db_port

# CASDOOR credentials
RMS_CLIENT_ID=$rms_client_id
RMS_CLIENT_SECRET=$rms_client_secret
RMQ_CLIENT_ID=$rabbitmq_client_id
RMQ_CLIENT_SECRET=$rabbitmq_client_secret

EOF
docker compose up -d --build
cd ..

clear

echo ------------------------------
echo Gateway started
echo Creating Portal...
echo ------------------------------
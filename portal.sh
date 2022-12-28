#!/bin/bash
cd rms-ops/rms-portal
cat << EOF > .env.production
VITE_GATEWAY_URL=http://localhost:$gateway_port
# casdoor
VITE_CASDOOR_CLIENT_ID=$rms_client_id
VITE_CASDOOR_REDIRECT_URI=http://localhost:$portal_port/oauth-redirect
VITE_CASDOOR_RESPONSE_TYPE=code
VITE_CASDOOR_SCOPE=openid
VITE_CASDOOR_STATE=state
# Docker env
API_CONTAINER_REGISTRY=tts.registry.jetbrains.space/p/rms/rms-portal
API_IMAGE_NAME=rms-portal-image
API_VERSION=test-img
PORTAL_PORT=$portal_port
EOF
docker compose --env-file .env.production up -d --build
cd ..

clear

echo ------------------------------
echo Portal started
echo ------------------------------
cd rms-ops/rms-portal-service
cat << EOF > .env
DB_NAME=$rms_db_name
DB_USERNAME=$rms_db_username
DB_PASSWORD=$rms_db_password
API_CONTAINER_REGISTRY=tts.registry.jetbrains.space/p/rms/rms-portal-service
API_IMAGE_NAME=rms-portal-service-api
API_VERSION=latest
API_PORT=$rms_api_port
DB_PORT=$rms_db_port
API_MEM_LIMIT=1g
API_CPUS=1
DB_MEM_LIMIT=1g
DB_CPUS=1
FLYWAY_MEM_LIMIT=1g
FLYWAY_CPUS=1
EOF

cd ./config
cat << EOF > config.production.yaml
db:
    postgres:
        host: timeline_db_prod
        port: 5432
        user: $rms_db_username
        password: '$rms_db_password'
        database: $rms_db_name
client_url: http://localhost:$portal_port,http://localhost:3001
sentry:
    dsn: 'https://732f939c0e7b44358fcbc910b22ae7d6@o4503963017609216.ingest.sentry.io/4503963023572992'
    traceSampleRate: 0.0
    maxBreadcrumbs: 50
    sendDefaultPii: '1' # '0' - false, '1' - true
rabbitmq:
    queueName: resource-queue
    host: rabbitmq
    port: $rabbitmq_port
    user: $rabbitmq_default_user
    password: $rabbitmq_default_password
EOF

cd ..
docker compose up -d --build
cd ..

clear

echo ------------------------------
echo RMS API started
echo Creating Gateway...
echo ------------------------------
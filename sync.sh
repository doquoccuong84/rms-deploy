cd rms-ops/rms-synchronization-service
cat << EOF > .env
DB_NAME=$synchronization_db_name
DB_USERNAME=$synchronization_db_username
DB_PASSWORD=$synchronization_db_password
API_CONTAINER_REGISTRY=tts.registry.jetbrains.space/p/rms/rms-synchronization-service
API_IMAGE_NAME=rms-synchronization-service-api
API_VERSION=latest
API_PORT=$synchronization_api_port
DB_PORT=$synchronization_db_port
API_MEM_LIMIT=1g
API_CPUS=1
DB_MEM_LIMIT=1g
DB_CPUS=1
FLYWAY_MEM_LIMIT=1g
FLYWAY_CPUS=1
RABBITMQ_DEFAULT_USER=$rabbitmq_default_user
RABBITMQ_DEFAULT_PASS=$rabbitmq_default_password
RABBITMQ_DASHBOARD_PORT=$rabbitmq_dashboard_port
RABBITMQ_PORT=$rabbitmq_port
EOF

cd ./config
cat << EOF > config.production.yaml
db:
    postgres:
        host: synchronization_db_prod
        port: 5432
        user: $synchronization_db_username
        password: '$synchronization_db_password'
        database: $synchronization_db_name
sentry:
    dsn: 'https://732f939c0e7b44358fcbc910b22ae7d6@o4503963017609216.ingest.sentry.io/4503963023572992'
    traceSampleRate: 0.0
    maxBreadcrumbs: 50
    sendDefaultPii: '1' # '0' - false, '1' - true
rabbitmq:
    queueName: resource-queue
    host: rabbitmq
    port: 5672
    user: $rabbitmq_default_user
    password: $rabbitmq_default_password
hrm:
    name: casdoor
    syncApi: http://casdoor_prod:$casdoor_port/api/get-users?owner=tpp
    token:
        name: Authorization
        value: Bearer $casdoor_token
resourceSync:
    messageLength: 10
EOF

cd ..
docker compose --env-file .env up -d --build
cd ..

clear

echo ------------------------------
echo SYNC started
echo Creating RMS API...
echo ------------------------------
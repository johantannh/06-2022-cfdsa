docker network create nw-net
docker volume create nw-vol

docker run -d \
    --name nwdb --network nw-net \
    -v nw-vol:/var/lib/mysql \
    stackupiss/northwind-db:v1

docker run -d \
    --name nwapp --network nw-net \
    -e DB_HOST=nwdb \
    -e DB_USER=root \
    -e DB_PASSWORD=changeit \
    -p 8080:3000 \
    stackupiss/northwind-app:v1
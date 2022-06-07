exit 0
# This is summarized notes of what I learnt in day 1

# Create docker network
docker network create nw-net

# Create docker volume
docker volume create nw-vol

# Create db with local volume
docker run -d \
    --name nwdb --network nw-net \
    -v nw-vol:/var/lib/mysql \
    stackupiss/northwind-db:v1

# Create app within same network
docker run -d \
    --name nwapp --network nw-net \
    -e DB_HOST=nwdb \
    -e DB_USER=root \
    -e DB_PASSWORD=changeit \
    -p 8080:3000 \
    stackupiss/northwind-app:v1

# To run my own local python package and name it
docker run --rm -p 8080:3000 --name dov-bear-python ghcr.io/johantannh/dov-bear:v1python

# To exec into container and get shell
docker exec -it --rm <container_id> <shell_program_like_bash>

# Following the quick start https://github.com/sigstore/cosign#quick-start
# Step 1: Generate key pair
cosign generate-key-pair

# Step 2: Sign the image
cosign sign --key cosign.key ghcr.io/johantannh/dov-bear:v1python

# Step 3: verify before pulling
cosign verify --key cosign.pub ghcr.io/johantannh/dov-bear:v1python

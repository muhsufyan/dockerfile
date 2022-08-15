docker build -t tetewpoj/volume volume

docker image inspect tetewpoj/volume

docker container create --name volume -p 8080:8080 tetewpoj/volume

docker container start volume

docker container logs volume

docker container inspect volume

docker volume ls
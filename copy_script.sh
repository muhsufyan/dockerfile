docker build -t tetewpoj/copy copy

docker container create --name copy tetewpoj/copy

docker container start copy

docker container logs copy
docker build -t tetewpoj/dockerignore dockerignore

docker container create --name dockerignore tetewpoj/dockerignore

docker container start dockerignore

docker container logs dockerignore
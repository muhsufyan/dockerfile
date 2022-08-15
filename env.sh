docker build -t tetewpoj/env env

docker image inspect tetewpoj/env

docker container create --name env --env APP_PORT=9090 -p 9090:9090 tetewpoj/env

docker container start env

docker container ls

docker container logs env

docker container stop env
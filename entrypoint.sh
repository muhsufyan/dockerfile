docker build -t tetewpoj/entrypoint entrypoint

docker image inspect tetewpoj/entrypoint

docker container create --name entrypoint -p 8080:8080 tetewpoj/entrypoint

docker container start entrypoint
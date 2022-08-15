docker build -t tetewpoj/multi multi

docker image ls

docker container create --name multi -p 8080:8080 tetewpoj/multi

docker container start multi
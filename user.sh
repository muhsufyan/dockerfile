docker build -t tetewpoj/user user

docker container create --name user -p 8080:8080 tetewpoj/user

docker container start user

docker container exec -i -t user /bin/sh
docker build -t tetewpoj/arg arg/error --build-arg app=pzn

docker container create --name arg -p 8080:8080 tetewpoj/arg

docker container start arg

docker container exec -i -t arg /bin/sh

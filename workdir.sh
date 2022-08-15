docker build -t tetewpoj/workdir workdir

docker container create --name workdir -p 8080:8080 tetewpoj/workdir

docker container start workdir

docker container exec -i -t workdir /bin/sh
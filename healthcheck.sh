docker build -t tetewpoj/health health

docker container create --name health -p 8080:8080 tetewpoj/health

docker container start health

docker container ls

docker container inspect health
docker build -t tetewpoj/expose expose

docker image inspect tetewpoj/expose

docker container create --name expose -p 8080:8080 tetewpoj/expose

docker container start expose

docker container ls

docker container stop expose
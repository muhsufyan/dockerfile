docker build -t tetewpoj/add add_instruction

docker container create --name add tetewpoj/add

docker container start add

docker container logs add


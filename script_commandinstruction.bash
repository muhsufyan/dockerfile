docker build -t tetewpoj/command command_instruction

# melihat detail dr image tetewpoj/command untuk mengetahui pengeksekusian command (CMD) melalui inspect
docker image inspect tetewpoj/command

# pertama kita buat container dulu
docker container create --name command tetewpoj/command

docker container start command

docker container logs command
# dockerfile
adalah instruksi" docker untuk membuat docker image.<br>
perintah <b>docker build</b> untuk make docker image dr dockerfile<br>
nama <b>docker build</b> otomatis random / we can set name/tag pd image dg menambahkan perintah <u>-t</u><br>
<b>docker build -t {nama image}:{tag/versi} {folder yg berisi dockerfile-nya}</b><br>
maksudnya dockerfile itu disimpan dalam suatu folder misal dockerfile ada didlm folder user maka foldernya adlh C:\User\user & jika berada diwork directory maka cukup . saja<br>
contoh : docker build -t invite/app:1.0.0 $(pwd)/user<br>
dpt juga membuat namanya image-nya lbh dari 1 (nama image nya ganda/multiple)<br>
docker build -t invite/app:1.0.0 -t invite/app:latest $(pwd)/user

# Dockerfile Format

filenya ditulis sebagai Dockerfile tanpa ekstensi apapun

# Format INSTRUCTION

tanda # untuk memberi komentar<br>
INSTRUCTION arguments <br>
* INSTRUCTION => perintah di Dockerfile, bersifat case sensitive direkomendasikan UPPER CASE<br>
* arguments => data argument untuk INSTRUCTION, bersifat menyesuaikan INSTRUCTION
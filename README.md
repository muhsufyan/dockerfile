# COPY
menambahkan file dari source ke dalam folder destination di Docker Image<br>
ADD VS COPY => COPY hanya melakukan copy file saja, sedangkan ADD selain melakukan copy juga <u>mendownload source dari URL dan secara otomatis melakukan extract file kompres</u><br>
<i>direkomendasikan sebisa mungkin gunakan COPY & jika memang butuh melakukan extract file kompres, gunakan perintah RUN dan jalankan aplikasi untuk extract file kompres tersebut<br>
format :<br>
* <b>COPY {source} {destination}</b><br>
Contoh :
* <b>COPY world.txt hello # menambah file world.txt ke folder hello</b><br>
* <b>COPY *.txt hello # menambah semua file .txt ke folder hello</b><br>

# .dockerignore file 
seperti file .gitignore<br>
file inside .dockerignore otomatis file tersebut tidak akan di ADD atau di COPY

# EXPOSE
memberitahu bahwa container akan listen port pada nomor dan protocol tertentu, hanya digunakan sebagai dokumentasi untuk memberitahu yang membuat Docker Container, bahwa Docker Image ini akan menggunakan port tertentu ketika dijalankan menjadi Docker Container<br>
format <br>
* <b>EXPOSE {port}/{tipe network tcp/udp} # default nya menggunakan TCP</b><br>
* <b>EXPOSE {port}/tcp</b><br>
* <b>EXPOSE {port}/udp</b><br>

# ENV
mengubah environment variable, baik itu ketika tahapan build atau ketika jalan dalam Docker Container<br>
ENV yang sudah di definisikan di dalam Dockerfile bisa digunakan kembali (mengakses kembali/mendptkan value dari env melalui key) dengan menggunakan sintaks <u>${NAMA_ENV}</u> key harus UPPER CASE<br>
docker image inspect => melihat env dlm image<br>
Env juga bisa diganti nilainya ketika pembuatan Docker Container dengan perintah <b>docker container create --env {KEY}={value}</b><br>
format<br>
* <b>ENV {key}={value}</b><br>
* <b>ENV {ke1}={value1} {key2}={value2} …</b><br>

# VOLUME
membuat volume secara otomatis ketika kita membuat Docker Container<br>
Semua file yang terdapat di volume secara otomatis akan otomatis di copy ke Docker Volume, walaupun kita tidak membuat Docker Volume ketika membuat Docker Container nya<br>
format<br>
* <b>VOLUME {/lokasi/folder}</b><br>
* <b>VOLUME {/lokasi/folder1} {/lokasi/folder2} {…}</b><br>
* <b>VOLUME [“{/lokasi/folder1}”, “{/lokasi/folder2}”, “{...}”]</b><br>

# Working Directory 
menentukan direktori / folder untuk menjalankan instruksi RUN, CMD, ENTRYPOINT, COPY dan ADD<br>
if not exist will automatic made<br>
bisa digunakan sebagai path untuk lokasi pertama kali ketika kita masuk ke dalam Docker Container<br>
format<br>
* <b>WORKDIR {folder tmpt bekerja}</b><br>
* <b>WORKDIR /app</b> # artinya working directory nya adalah /app<br>
* <b>WORKDIR docker</b> # sekarang working directory nya adalah /app/docker<br>
* <b>WORKDIR /home/app</b> # sekarang working directory nya adalah /home/app<br>

<br>

# USER
mengubah user atau user group ketika Docker Image dijalankan<br>
default dari user adlh root tp ada juga yg tdk sehingga kita hrs mengatur user <br>
format<br>
* <b>USER <user> # mengubah user</b><br>
* <b>USER <user>:<group> # mengubah user dan user group</b><br>

# ARGUMENT
mendefinisikan variable yang bisa digunakan oleh pengguna untuk dikirim ketika melakukan proses docker build menggunakan perintah <b>--build-arg {key}={value}</b><br>
digunakan pada saat proses build time, artinya saat dalam Docker Container tdk digunakan. hal ini berbeda dg ENV<br>
Cara mengakses variable dari ARG sama seperti mengakses variable dari ENV, menggunakan <b>${variable_name}</b><br>
format<br>
* <b>ARG {key} # membuat argument variable</b><br>
* <b>ARG {key}={defaultvalue} # membuat argument variable dengan default value jika tidak diisi</b><br>

agar mdh dlm membedakan ENV & ARG maka kita pada key ARG ditulis dlm lower case<br>
folder arg/error maka terjd error dikarenakan ARG hanya bisa diakses pada waktu build time, sedangkan CMD itu dijalankan pada saat runtime.<br>
Jadi jika kita ingin menggunakan ARG pada CMD, maka kita perlu memasukkan data ARG tersebut ke ENV sprti pd folder arg/arg_store_in_env<br>

# Health Check
memberi tahu Docker bagaimana untuk mengecek apakah Container masih berjalan dengan baik atau tidak<br>
Jika terdapat HEALTHCHECK, secara otomatis Container akan memili status health, dari awalnya bernilai starting, jika sukses maka bernilai healthy, jika gagal akan bernilai unhealty<br>
format<br>
<b>HEALTHCHECK NONE # artinya disabled health check</b><br>
<b>HEALTHCHECK [OPTIONS] CMD {command}</b><br>
<b>OPTIONS :</b><br>
* <b> --interval=DURATION (default: 30s)</b><br>
* <b> --timeout=DURATION (default: 30s)</b><br>
* <b> --start-period=DURATION (default: 0s)</b><br>
* <b> --retries=N (default: 3)</b><br>

<br>

# Entrypoint
untuk menentukan executable file yang akan dijalankan oleh container<br>
erat kaitannya dengan instruksi CMD<br>
Saat kita membuat instruksi CMD tanpa executable file, secara otomatis CMD akan menggunakan ENTRYPOINT<br>
format<br>
<b>ENTRYPOINT [“executable”, “param1”, “param2”]</b><br>
<b>ENTRYPOINT executable param1 param2</b><br>
Saat menggunakan CMD [“param1”, “param2”], maka param tersebut akan dikirim ke ENTRYPOINT<br>

# Multi Stage Build
Saat kita membuat Dockerfile dari base image yang besar, secara otomatis ukuran Image nya pun akan menjadi besar juga<br>
maka usahakan selalu gunakan base image yang memang kita butuhkan saja, jangan terlalu banyak menginstall fitur di Image padahal tidak kita gunakan
## Contoh Solusi Dengan Image Size Besar
projek yg kita gunakan adlh golang dimana memiliki fitur untuk melakukan kompilasi kode program Go-Lang menjadi binary file, sehingga tidak membutuhkan Image Go-Lang lagi<br>
Kita bisa melakukan proses kompilasi di laptop kita, lalu file binary nya yang kita simpan di Image, dan cukup gunakan base image Linux Alpine misal nya<br>
pada go direkomendasikan memakai binary (go build)<br>
Multi Stage Build, dimana dalam Dockerfile, kita bisa membuat beberapa Build Stage atau tahapan build<br>
di awal build, biasanya kita menggunakan instruksi FROM, dan di dalam Dockerfile, kita bisa menggunakan beberapa instruksi FROM dimana Setiap Instruksi FROM, artinya itu adalah build stage dan pada build stage terakhir adalah build stage yang akan dijadikan sebagai Image <u>Artinya, kita bisa memanfaatkan Docker build stage ini untuk melakukan proses kompilasi kode program Go-Lang kita</u><br>

# From INSTRUCTION
perintah pertama saat membuat image adlh melakukan build stage melalui instruksi <b>FROM</b><br>
FROM => make build stage dr image yg kita tentukan<br>
<b>FROM {image}:{version / tag}</b><br>
ex make docker image from os linux alphine version 3 => <b>FROM alphine:3</b><br>
code untuk docker build ada di file script_frominstruction.sh

# Run INSTRUCTION
mengeksekusi perintah didlm image pada saat build stage(= saat pembuatan image) saja sehingga stlh image telah selesai<br> dibuat  maka perintah Run tidak akan dijalankan lagi <br>
Run bersifat one-off / satu kali dijalankan/dieksekusi<br>
* format : <b>RUN {command}</b><br>
* atau bisa juga : <b>RUN["executable","argument","..."]</b><br>

folder run_instruction

untuk melihat detail build-nya(stlh image jd) gunakan display output melalui perintah<br>
<b>--progress=plain</b><br>
jika ingin mengulangi build stage lagi tanpa cache gunakan perintah<br>
<b>--no-cache</b><br>

# command (CMD) INSTRUCTION
not dijlnkan when proses build, but dijlnkan when container berjln<br>
in Dockerfile we cant add lbh dari 1 instruksi CMD jika tdk maka container hanya akan menjlnkan instruksi CMD yg terakhir saja<br>
format perintah CMD <br>
* <b>CMD command param param</b><br>
* <b>CMD [“executable”, “param”, “param”]</b><br>
* <b>CMD [“param”, “param”]</b> , akan menggunakan executable ENTRY POINT<br>

# Label INSTRUCTION

add metadata into image yg kita buat, metadata : info tambhn like nama app, author, website, dll. fungsi metdadata just as info tambhn not use for container<br>
* <b>LABEL <key>=<value></b><br>
* <b>LABEL <key1>=<value1> <key2>=<value2> …</b><br>

# Add INSTRUCTION
menambh file dr source kedlm folder destination di docker image<br>
bisa juga untuk mendeteksi apakah sebuah file source merupakan file kompres seperti tar.gz, gzip, dan lain-lain & jika file source terdeteksi as file kompress, maka secara otomatis file tersebut akan di extract dalam folder destination<br>
selain itu, untuk mendukung banyak penambahan file sekaligus<br> misal add file with extension .go / .py<br>
pelajari format pattern sprti *, ? dll (sekaligus untuk regex)<br>format add <br>
<b>ADD {source} {destination}</b><br>
Contoh : ADD world.txt hello # menambah file world.txt ke folder hello<br>
ADD *.txt hello # menambah semua file .txt ke folder hello<br>

# slide https://docs.google.com/presentation/d/1bW0-88g_s54-X_rBLaZ-N2EhW3HngAZSN6UInyBlIn8/edit#slide=id.g125a9a30bb3_0_488
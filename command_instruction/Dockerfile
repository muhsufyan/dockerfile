FROM alphine:3

# Perintah RUN just one-off (satu kali dijalankan) saat proses build stage (build image)
RUN mkdir hallo
RUN echo "halo bro">"hallo/halobro.txt"

# perintah ini akan dijlnkan kalau setiap kali container-nya run/dijalankan
CMD cat "hallo/halobro.txt"
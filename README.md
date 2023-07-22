# markov-chain
Menghitung rantai markov secara manual dan membuat functionnya (menggunakan data harian Covid-19 per kecamatan di Kota Semarang)

## 📌Table of contents
- [Definisi](https://github.com/DiannitaOlipmimi/markov-chain#table-of-contents)
- [Study Case](https://github.com/DiannitaOlipmimi/markov-chain#study-case)
- [Step by Step analysis](https://github.com/DiannitaOlipmimi/markov-chain#step-by-step-analysis)
- [Result](https://github.com/DiannitaOlipmimi/markov-chain#result)
- [Dataset](https://github.com/DiannitaOlipmimi/markov-chain#dataset)
- [Links](https://github.com/DiannitaOlipmimi/markov-chain#links)

## 📌**Definisi**
### 📒Markov Chain
Perubahan yang ada di dalam kehidupan sehari-hari sangat bervariasi. Ada perubahan yang bersifat statis namun ada juga yang bersifat dinamis. Karena kehidupan yang terus berjalan, maka perubahan yang terjadi memang tidak bisa dihindari. Acapkali perubahan itu juga berimbas pada sebuah kerugian. Oleh karena itu, ada baiknya apabila dilakukan persiapan untuk sebuah perubahan. Bagaimana caranya untuk menghadapi sebuah perubahan? Setiap transisi yang terjadi dari waktu ke waktu perlu dicermati dengan baik. Salah satu solusi yang relevan untuk situasi tersebut adalah dengan melakukan prediksi akan apa yang terjadi di masa yang akan datang.

Contoh perubahan:
- Prediksi perpindahan minat pada merk tertentu
- Manajemen pengobatan diabetes
- Pemantauan lalu lintas

Rantai Markov (Markov Chain) adalah sebuah teknik perhitungan yang umumnya digunakan dalam melakukan pemodelan bermacam-macam kondisi. Teknik ini digunakan untuk membantu dalam memperkirakan perubahan yang mungkin terjadi di masa mendatang. Perubahan-perubahan tersebut diwakili dalam variabel-variabel dinamis di waktu-waktu tertentu. Sehingga perlu untuk menyimpan nilai dari variabel keadaan pada tiap-tiap waktu tertentu itu

[Source](https://socs.binus.ac.id/2013/06/30/markov-chain/)

## 📌**Study Case**
### **Markov Chain untuk kasus harian COVID-19**

### 📒 Deskripsi Masalah:

### 📒 Data dan Variabel:

### 📒 Tujuan:

### 📒 Langkah Analisis:
✅ *Exploratory Data Analysis* (EDA):

## 📌**Step by step analysis**
### 📒 **menggunakan R/RStudio**

```R
#rantai markov dengan function
rantai_markov=function(data){
  library(markovchain)
  na.sequence=createSequenceMatrix(data, sanitize = FALSE)
  data.seq=as.matrix(na.sequenceMatr)
  prob=data.seq/rowSums(data.seq)
  status=c("naik", "turun")
  MCdata=new("markovchain", states = status, byrow = TRUE,
             transitionMatrix = prob)
  steady=steadyStates(MCdata)
  
  seq_mat=as.data.frame(na.sequence)
  prob_mat=as.data.frame(prob)
  st_mat=as.data.frame(steady)
  
  cat("\t","Matriks Rantai Markov","\n","\n")
  cat("matriks frekuensi","\n")
  print(seq_mat)
  cat("\n","matriks probabilitas transisi","\n")
  print(prob_mat)
  cat("\n","matriks steady state","\n")
  print(st_mat)
}
```

## 📌**Result**
### 📒**menggunakan R/RStudio**

## 📌**Dataset**
### **Data Harian COVID-19 (10 data teratas)**
|Tanggal|Mijen|Semarang Tengah|Candisari|Gajah Mungkur|Tugu|Semarang Selatan|Gunungpati|Semarang Barat|Genuk|Ngaliyan|Banyumanik|Semarang Utara|Tembalang|Semarang Timur|Pedurungan|Gayam Sari|
|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|
|6/02/2020|turun|naik|turun|turun|turun|turun|turun|turun|turun|turun|turun|turun|naik|turun|turun|turun|
|6/03/2020|turun|turun|naik|turun|turun|naik|turun|turun|turun|turun|naik|turun|turun|naik|turun|naik|
|6/04/2020|turun|turun|naik|naik|turun|naik|naik|naik|turun|naik|naik|naik|naik|turun|naik|naik|
|6/05/2020|turun|turun|turun|turun|turun|naik|turun|turun|turun|turun|turun|turun|turun|turun|turun|turun|
|6/06/2020|turun|naik|naik|naik|naik|naik|naik|naik|naik|naik|naik|turun|naik|turun|naik|turun|
|6/07/2020|turun|turun|naik|turun|turun|turun|naik|turun|naik|turun|turun|turun|naik|turun|naik|turun|
|6/08/2020|turun|naik|naik|naik|naik|naik|naik|naik|naik|naik|naik|naik|naik|naik|naik|naik|
|6/09/2020|turun|turun|turun|naik|turun|turun|turun|naik|turun|turun|turun|naik|turun|turun|naik|turun|
|6/10/2020|turun|turun|turun|turun|turun|turun|turun|turun|turun|turun|turun|turun|turun|naik|turun|turun|


## 📌**Links**

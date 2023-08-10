# Merkov-Chain untuk Memperkirakan Kenaikan/penurunan Kasus COVID-19

**⛳ Deskripsi Masalah**

Perubahan yang ada di dalam kehidupan sehari-hari sangat bervariasi. Ada perubahan yang bersifat statis namun ada juga yang bersifat dinamis. Karena kehidupan yang terus berjalan, maka perubahan yang terjadi memang tidak bisa dihindari. Acapkali perubahan itu juga berimbas pada sebuah kerugian. Oleh karena itu, ada baiknya apabila dilakukan persiapan untuk sebuah perubahan. Bagaimana caranya untuk menghadapi sebuah perubahan? Setiap transisi yang terjadi dari waktu ke waktu perlu dicermati dengan baik. Salah satu solusi yang relevan untuk situasi tersebut adalah dengan melakukan prediksi akan apa yang terjadi di masa yang akan datang.

Contoh perubahan:
- Prediksi perpindahan minat pada merk tertentu
- Manajemen pengobatan diabetes
- Pemantauan lalu lintas

Rantai Markov (Markov Chain) adalah sebuah teknik perhitungan yang umumnya digunakan dalam melakukan pemodelan bermacam-macam kondisi. Teknik ini digunakan untuk membantu dalam memperkirakan perubahan yang mungkin terjadi di masa mendatang. Perubahan-perubahan tersebut diwakili dalam variabel-variabel dinamis di waktu-waktu tertentu. Sehingga perlu untuk menyimpan nilai dari variabel keadaan pada tiap-tiap waktu tertentu itu

Menghitung rantai markov secara manual dan membuat functionnya (menggunakan data harian Covid-19 per kecamatan di Kota Semarang)

**⛳ Tujuan**

memprediksi status COVID-19 di Kota Semarang berdasarkan data yang ada

## 📌Table of contents
- [Dataset dan Variabel](https://github.com/DiannitaOlipmimi/markov-chain#step-by-step-analysis)
- [Result](https://github.com/DiannitaOlipmimi/markov-chain#result)
- [Links](https://github.com/DiannitaOlipmimi/markov-chain#links)

## 🧵 Dataset dan Variabel

**📒 Dataset:**

**Data Harian COVID-19 (10 data teratas)**

|Tanggal|Mijen|Semarang Tengah|Candisari|Gajah Mungkur|Tugu|Semarang Selatan|Gunungpati|Semarang Barat|Genuk|Ngaliyan|Banyumanik|Semarang Utara|Tembalang|Semarang Timur|Pedurungan|Gayam Sari|
|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|
|6/02/2020|turun|naik|turun|turun|turun|turun|turun|turun|turun|turun|turun|turun|naik|turun|turun|turun|
|6/03/2020|turun|turun|naik|turun|turun|naik|turun|turun|turun|turun|naik|turun|turun|naik|turun|naik|
|6/04/2020|turun|turun|naik|naik|turun|naik|naik|naik|turun|naik|naik|naik|naik|turun|naik|naik|
|6/05/2020|turun|turun|turun|turun|turun|naik|turun|turun|turun|turun|turun|turun|turun|turun|turun|turun|
|6/06/2020|turun|naik|naik|naik|naik|naik|naik|naik|naik|naik|naik|turun|naik|turun|naik|turun|

**📒Variabel:**

data yang diambil merupakan data asli kenaikan dan penurunan yang terjadi di 16 kabupaten di kota Semarang, Jawa Tengah
- `Tanggal`: waktu harian selama Februri 2020 hingga Desember 2020
- `Miijen`
- `Semarang Tengah`
- `Candisari`
- `Gajah Mungkur`
- `Tugu`
- `Semarang Selatan`
- `Gunungpati`
- `Semarang Barat`
- `Genuk`
- `Ngaliyan`
- `Banyumanik`
- `Semarang Utara`
- `Tembalang`
- `Semarang Timur`
- `Pedurungan`
- `Gayam Sari*`

## 🧵**Result**

**📒 Langkah Analisis:**

✅ *Exploratory Data Analysis* (EDA):

✅ Step 1: Define States

Identify the distinct states or conditions that the system can be in. For example, if you're analyzing the weather, states could be "Sunny," "Cloudy," and "Rainy."

✅ Step 2: Create the Transition Matrix

The transition matrix is the core of a Markov Chain. It shows the probabilities of moving from one state to another. The rows represent the current state, and the columns represent the next state.

For each state, calculate the probability of transitioning to each other state. These probabilities should add up to 1 for each row.

✅ Step 3: Initial State Probabilities

Define the initial probabilities for each state. This represents the starting point of your Markov Chain. These initial probabilities also should add up to 1.

✅ Step 4: Analysis

Steady-State Distribution: If you're interested in a long-term analysis, calculate the steady-state distribution. This represents the long-term probabilities of being in each state. It's the result of iteratively applying the transition matrix until the probabilities stabilize.

N-Step Transition Probabilities: Calculate the probabilities of moving from one state to another in exactly N steps. This can help you understand how the system evolves over time.

✅ Step 5: Visualization

Transition Diagram: Create a diagram to visualize the transitions between states. Nodes represent states, and arrows represent transitions with associated probabilities.

Steady-State Distribution Plot: Plot the steady-state probabilities for each state. This gives you a clear view of the long-term behavior of the system.

✅ Step 6: Interpretation

Analyze the results to draw insights about the behavior of the system. For instance, if you're modeling a customer's buying behavior, the analysis might reveal the probability of a customer switching from buying one product to another over time.

✅ Step 7: Validation and Refinement

Test the accuracy of your Markov Chain by comparing its predictions to real-world data or established theories. If needed, refine the model based on the discrepancies you find.
Remember, this is a basic guide. Depending on the complexity of your system and the analysis you're performing, the steps may vary. Markov Chain Analysis can be more complex, involving higher-order chains, absorbing states, and other variations. It's a powerful tool but can also be intricate, so it's important to have a solid understanding of probability and matrix operations.

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

## 🧵**Links**

📊 Kasus COVID-19 Kota Semarang

https://siagacorona.semarangkota.go.id/

📊 PPID Kominfo Jateng

https://ppid.semarangkota.go.id/peta-sebaran-virus-corona-covid-19-di-kota-semarang/ 
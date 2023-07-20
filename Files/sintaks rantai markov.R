#rantai markov secara manual
data=read.delim("clipboard") #input data

library(markovchain)
na.sequence=createSequenceMatrix(data, sanitize = FALSE) 
data.seq=as.matrix(na.sequenceMatr)

matriks=data.seq/rowSums(data.seq)

status=c("naik", "turun")

MCdata=new("markovchain", states = status, byrow = TRUE,
           transitionMatrix = matriks, name = "Banyumanik")
steadyStates(MCdata)

plot(MCdata)

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

data=read.csv(file.choose(), header = TRUE) #input data
data

#rantai markov perkecamatan di Kota Semarang
rantai_markov(data$Mijen)
rantai_markov(data$Semarang.Tengah)
rantai_markov(data$Candisari)
rantai_markov(data$Gajah.Mungkur)
rantai_markov(data$Tugu)
rantai_markov(data$Semarang.Selatan)
rantai_markov(data$Gunungpati)
rantai_markov(data$Semarang.Barat)
rantai_markov(data$Genuk)
rantai_markov(data$Ngaliyan)
rantai_markov(data$Banyumanik)
rantai_markov(data$Semarang.Utara)
rantai_markov(data$Tembalang)
rantai_markov(data$Semarang.Timur)
rantai_markov(data$Pedurungan)
rantai_markov(data$Gayam.Sari)

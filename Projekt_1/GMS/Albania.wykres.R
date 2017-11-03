install.packages("dplyr")
library("dplyr")
install.packages("fmsb")
library("fmsb")
load("student2012.rda")


dane.Albania <- filter(student2012, student2012$CNT == "Albania")

#dane do wykresu

odpowiedzi <- c("Very much like me", "Mostly like me", "Somewhat like me", "Not much like me", "Not at all like me")
pytania <- select(dane.Albania, ST93Q01, ST93Q03, ST93Q04, ST93Q06, ST93Q07)


tabelka.sumujaca <- matrix(rep(0,25), nrow = 5, ncol=5)

for (i in 1:5){
  for (j in 1:5){
    tabelka.sumujaca[j,i]<-sum(pytania[,i]==odpowiedzi[j], na.rm=TRUE)
  }
}

tabelka.sumujaca <- as.data.frame(tabelka.sumujaca)
colnames(tabelka.sumujaca)=c("When confronted with a problem,\nI give up easily" , "I put off \ndifficult \nproblems" , "I remain interested\n in the tasks \nthat I start" , "I continue working \non tasks until \neverything is perfect" , "When confronted\n with a problem,\n I do more than \nwhat is expected of me")
rownames(tabelka.sumujaca) <- odpowiedzi
tabelka.sumujaca <- rbind(rep(2602,5), rep(0,5), tabelka.sumujaca)

#wykres
radarchart(tabelka.sumujaca, pcol=c("deeppink","royalblue1","red3","forestgreen","orange"), plwd = 2, plty=1, cglcol="grey", cglty=2, vlcex=0.8)
legend(x=0.75, y=1.35, legend = rownames(tabelka.sumujaca[-c(1,2),]), bty = "n", pch=20 , col=c("deeppink","royalblue1","red3","forestgreen","orange") , text.col = "grey", cex=1, pt.cex=2)
title("Problem solving experiences\nAlbania")



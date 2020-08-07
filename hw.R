library(quantmod)
library(DMwR)

setwd("E:/COVID-19哈佛数据分析")
stocknames <- c("AAPL","FB","V","MSFT","GOOGL","JNJ","MPW","ICON","WMB","AMD")

for (i in 1:3) {
  getSymbols(stocknames,
             auto.assign = TRUE,
             from = "2020-05-01",
             to = "2020-06-01")
}
plus <- function(x)
{
  as.data.frame(x)
}
AAPL <- plus(AAPL)
FB <- plus(FB)
GOOGL <- plus(GOOGL)
JNJ <- plus(JNJ)
MSFT <- plus(MSFT)
V <- plus(V)
MPW <- plus(MPW)
ICON <- plus(ICON)
WMB <- plus(WMB)
AMD <- plus(AMD)

stockdata <- cbind.data.frame(AAPL$AAPL.Adjusted,FB$FB.Adjusted,GOOGL$GOOGL.Adjusted,JNJ$JNJ.Adjusted,MSFT$MSFT.Adjusted,V$V.Adjusted,MPW$MPW.Adjusted,ICON$ICON.Adjusted,WMB$WMB.Adjusted,AMD$AMD.Adjusted)
colnames(stockdata) <- c("AAPL","FB","GOOGL","JNJ","MSFT","V","MPW","ICON","WMB","AMD")

for(i in 1:ncol(stockdata))
  {
  stockdata[,i][sample(20,1)]<-NA     #随机设置缺失值
}

knnoutput <- knnImputation(stockdata)   #k近邻填补

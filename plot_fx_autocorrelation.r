# 指定した通貨ペアの日次価格データを取得し, 指定した系列の自己相関をプロットする
# rm(list=ls())
source("PlotAutoCorrelation.r")
library(quantmod)
currency_base <- "EUR"
currendy_term <- "JPY"
currency_pair <- paste(currency_base,currendy_term,sep="/")
variable_name <- paste(currency_base,currendy_term,sep="")
temp <- getFX(Currencies=currency_pair,from=Sys.Date()-499,to=Sys.Date(),verbose=T,warning=T)
v <- get(eval(variable_name))
plot(v)

# target
series <- diff(v)[-1]
# series <- v

plot(series)
lag_max <- 200

PlotAutoCorrelation(series=series,lag_max=lag_max)
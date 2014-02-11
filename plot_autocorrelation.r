# 指定した通貨ペアの日次価格データを取得し, 指定した系列の自己相関をプロットする
rm(list=ls())
source("PlotAutoCorrelation.r")
base <- "EUR"
term <- "JPY"
pair <- paste(base,term,sep="/")
variable_name <- paste(base,term,sep="")
temp <- getFX(Currencies=pair,from=Sys.Date()-499,to=Sys.Date(),verbose=T,warning=T)
# temp <- getMetals(Metals="gold",from=Sys.Date()-499,to=Sys.Date(),verbose=T,warning=T)
#temp <- getSymbols(Symbols="CPIAUCSL",src="FRED",from=Sys.Date()-499,to=Sys.Date(),verbose=T,warning=T)
v <- get(eval(temp))
plot(v)
fx.arima <- auto.arima(x=v,stepwise=T,trace=T,parallel=T)
plot(forecast(object=fx.arima,h=100,level=c(50,95)))
# target
series <- diff(v)[-1]
# series <- v

plot(series)
lag_max <- 50

PlotAutoCorrelation(series=series,lag_max=lag_max)
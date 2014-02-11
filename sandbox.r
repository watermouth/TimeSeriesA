# 指定した通貨ペアの日次価格データを取得し, 指定した系列の自己相関をプロットする
rm(list=ls())
currency_base <- "USD"
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
lag_max <- 400
lags <- c(1:lag_max)
cors <- vector(mode="numeric",length=lag_max)
for(lag in lags){
  cors[lag] <- cor(x=series,y=Lag(series,lag),use="na")
}
plot(x=lags,y=cors)
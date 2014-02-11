#自己相関関数をプロットする
library(quantmod)
PlotAutoCorrelation <- function (series, lag_max, type="l", add=F, col="brue",col2="black") {
  lags <- c(1:lag_max)
  cov0 <- var(x=series,na.rm=T)
  #パッケージのcor
  cors <- vector(mode="numeric",length=lag_max)
  #手作りのcor
  cors2 <- vector(mode="numeric",length=lag_max)
  for(lag in lags){
    cors[lag] <- cor(x=series,y=Lag(series,lag),use="na")
    n <- length(series) - lag
    m <- rep(x=mean(x=series),times=n)
    x <- series[(lag+1):length(series)]
    y <- Lag(series,lag)[(lag+1):length(series)]
    xy <- (x - m) * (y - m)
    cors2[lag] <- sum(xy) / (cov0 * length(series))
  }
  if(add){
#     lines(x=lags,y=cors,col=col)
    lines(x=lags,y=cors2,col=col2)
  } else {
#     plot(x=lags,y=cors,type=type)
    y.up <- max(abs(cors2))
    plot(x=lags,y=cors2,ylim=c(-y.up,y.up),type=type, col=col2)
  }
  # persentile point
  maturity <- length(series)
  upper <- qnorm(p=0.005,mean=0,sd=(1/sqrt(maturity)),lower.tail=F)
  lines(x=lags,y=rep(upper,length.out=length(lags)),col="pink")
  lines(x=lags,y=rep(-upper,length.out=length(lags)),col="pink")
}

#弱定常過程を生成し自己相関を計算してみる
source("PlotAutoCorrelation.r")
maturity <- 800
lag_max <- 200

#ランダムウォーク
series <- rnorm(n=maturity,mean=0,sd=(1/sqrt(maturity)))
series <- diffinv(x=series,xi=0)
PlotAutoCorrelation(series=series,lag_max=lag_max,add=F,col2="red")

#正規ホワイトノイズ
series <- rnorm(n=maturity,mean=0,sd=(1/sqrt(maturity)))
PlotAutoCorrelation(series=series,lag_max=lag_max,add=T,col2="red")

#正規でないホワイトノイズ
series <- rt(n=maturity,df=2)
PlotAutoCorrelation(series=series,lag_max=lag_max,add=T,col2="blue")

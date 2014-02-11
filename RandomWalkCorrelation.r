# ランダムウォークの相関
maturity <- 8000

#ランダムウォーク
series <- rnorm(n=maturity,mean=0,sd=(1/sqrt(maturity)))
series1 <- diffinv(x=series,xi=0)
series <- rnorm(n=maturity,mean=0,sd=(1/sqrt(maturity)))
series2 <- diffinv(x=series,xi=0)

print(cor(x=series1,y=series2))
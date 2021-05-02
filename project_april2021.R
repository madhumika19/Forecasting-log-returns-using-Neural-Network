library(forecast)
library(tseries)

DIS<-read_excel("dis.xlsx")
dis.t<-dis$Returns
DIS_train <- window(dis.t, start=2, end=739) #train data
DIS_test  <- window(dis.t, start=740) #test data
DIS.ts <- ts(DIS$Returns) #converting to time series data

DIS.ts_train <- window(DIS.ts, start=2, end=739)
DIS.ts_test  <- window(DIS.ts, start=740)




plot.ts(DIS.ts_train ,main="Daily Nav of HSBC-CANARA FUND")
adf.test(DIS.ts_train )# series is stationary

pacf(DIS.ts_train) # 2 majorly significant spikes
acf(DIS.ts_train) # no significant spikes

auto.arima(DIS.ts_train) #fetching parameters for arima model


#fitting the arima model for above obtained parameters
DIS.ARIMA <- Arima(data.ts1, order = c(2,0,0))
summary(DIS.ARIMA)
accuracy(forecast(DIS.ARIMA,h=40), DIS.ts_test) 

#plots for checking  volitality presence in the data
pacf((DIS.ts_train)^2)
y_lr_abs <- abs(dis$Returns[-1])
sp_lr_abs <- ts(y_lr_abs)
plot(sp_lr_abs)
acf(sp_lr_abs)
pacf(sp_lr_abs) #1 majorly significant spike

#checking the fit of arch 
install.packages("FinTS")
library(FinTS)
ArchTest(DIS.ts_train)
#arch effect present


# Build the GARCH model - 1, 2
library(fGarch)
library(FinTS)

DIS_garch12 = garchFit(~ garch(1,2), data = DIS.ts_train, trace = F)
DIS_garch12_predict = predict(DIS_garch12, n.ahead = 40)
plot(DIS_garch12_predict$meanForecast)
DIS_garch12_predict.ts = ts(DIS_garch12_predict$meanForecast,start=740)
accuracy(DIS_garch12_predict.ts, DIS.ts_test)


#NNAR
install.packages("nnfor")
library(nnfor)
nnetar(DIS.ts_train)
plot(forecast(nnetar(DIS.ts_train,p=15),h=40))


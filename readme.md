# Forecasting Log returns Using Neural Network

# Objective
To forecast log return values of a mutual fund using various time series methods and neural networks.

# Time series
Time series is a collection of data points collected at constant time intervals. These are analyzed to determine the long term trend so as to forecast the future or perform some other form of analysis.
1) It is time dependent. So the basic assumption of a linear regression model that the observations are independent doesn’t hold in this case.
2) Along with an increasing or decreasing trend, most TS have some form of seasonality trends, i.e. variations specific to a particular time frame.

`Autocorrelation` : Informally, autocorrelation is the similarity between observations as a function of the time lag between them.

`Seasonality` : Seasonality refers to periodic fluctuations (For example, electricity consumption is high during the day and low during night, or online sales increase during Christmas before slowing down again).

`Moving Average` : This model simply states that the next observation is the mean of all past observations.

`Volatility` : Volatility (usually denoted by `σ`) is the degree of variation of a trading price series over time, usually measured by the standard deviation of logarithmic returns.

# Stationary 
A TS is said to be `stationary` if its statistical properties such as mean, variance remain constant over time.

Most of the TS models work on the assumption that the TS is stationary. Intuitively, we can sat that if a Time Series has a particular behaviour over time, there is a very high probability that it will follow the same in the future.

We can check stationarity using the following:
1) **Plotting Rolling Statistics:** We can plot the `moving average` or `moving variance` and see if it varies with time.
2) **Dickey-Fuller Test:** This is one of the statistical tests for checking stationarity. Here the null hypothesis is that the TS is non-stationary. The test results comprise of a Test Statistic and some Critical Values for difference confidence levels. If the `Test Statistic` is less than the `Critical Value`, we can reject the null hypothesis and say that the series is stationary.

**Making Time Series Stationary**

There are 2 major reasons behind non-stationaruty of a TS:
1. **Trend** – varying mean over time. For eg, in this case we saw that on average, the number of passengers was growing over time.
2. **Seasonality** – variations at specific time-frames. eg people might have a tendency to buy cars in a particular month because of pay increment or festivals.

The underlying principle is to model or estimate the trend and seasonality in the series and remove those from the series to get a stationary series. Then statistical forecasting techniques can be implemented on this series. The final step would be to convert the forecasted values into the original scale by applying trend and seasonality constraints back.

# ARIMA
ARIMA stands for `Auto-Regressive Integrated Moving Averages`. The ARIMA forecasting for a stationary time series is nothing but a linear (like a linear regression) equation. The predictors depend on the parameters (p,d,q) of the ARIMA model:

1) **Number of AR (Auto-Regressive) terms (`p`):** AR terms are just lags of dependent variable. For instance if p is 5, the predictors for x(t) will be x(t-1)….x(t-5).


2) **Number of MA (Moving Average) terms (`q`):** MA terms are lagged forecast errors in prediction equation. For instance if q is 5, the predictors for x(t) will be e(t-1)….e(t-5) where e(i) is the difference between the moving average at ith instant and actual value.


3) **Number of Differences (`d`):** These are the number of nonseasonal differences, i.e. in this case we took the first order difference. So either we can pass that variable and put d=0 or pass the original variable and put d=1. Both will generate same results.

# GARCH

An `ARCH(m)` process is one for which the variance at time  is conditional on observations at the previous m times, and the relationship is

**_Var(y<sub>t</sub>|y<sub>t-1</sub>,...,y<sub>t-m</sub>) = &sigma;<sup>2</sup><sub>t</sub> = &alpha;<sub>0</sub> + &alpha;<sub>1</sub>y<sup>2</sup><sub>t-1</sub> + ..... + &alpha;<sub>m</sub>y<sup>2</sup><sub>t-m</sub>_**

With certain constraints imposed on the coefficients, the y<sub>t</sub> series squared will theoretically be AR(m).

A `GARCH (generalized autoregressive conditionally heteroscedastic)` model uses values of the past squared observations and past variances to model the variance at time . As an example, a GARCH(1,1) is

**_&sigma;<sup>2</sup><sub>t</sub> = &alpha;<sub>0</sub> + &alpha;<sub>1</sub>y<sup>2</sup><sub>t-1</sub> + &beta;<sub>1</sub>&alpha;<sup>2</sup><sub>t-1</sub>_**

In the GARCH notation, the first subscript refers to the order of the y<sup>2</sup> terms on the right side, and the second subscript refers to the order of the &sigma;<sup>2</sup> terms.

# Libraries/Packages


`forecast` `tseries` `FinTs` `fGarch` `nnfor`

# Dataset 

Attached in the repository

# References

1) https://towardsdatascience.com/the-complete-guide-to-time-series-analysis-and-forecasting-70d476bfe775
2) https://www.analyticsvidhya.com/blog/2016/02/time-series-forecasting-codes-python/
3) https://en.wikipedia.org/wiki/Volatility_(finance)#:~:text=In%20finance%2C%20volatility%20(usually%20denoted,series%20of%20past%20market%20prices.
4) https://online.stat.psu.edu/stat510/lesson/11/11.1

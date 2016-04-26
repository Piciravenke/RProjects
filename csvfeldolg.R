dat = read.csv("/home/miki/RProjects/724917.csv", stringsAsFactors = FALSE)
time = dat$DATE
tmax = dat$DLY.TMAX.NORMAL
class(time)
class(tmax)
time = as.Date(as.character(time), format = "%Y%m%d")
time[1:10]
class(time)
tmax[tmax == -9999] = NA
tmax = tmax / 10
tmax[1:10]
tmax
range(time)
range(tmax, na.rm = TRUE)
range_t = range(time)
all_dates = seq(range_t[1], range_t[length(range_t)], 1)
length(all_dates)
length(time)

plot(tmax)
plot(time, tmax, type = "l")
plot(tmax ~ time, type = "l")

pdf("/home/miki/RProjects/time_series.pdf")
plot(tmax ~ time, type = "l") 
dev.off()

dat[complete.cases(dat), ]



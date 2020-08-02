#Reading files
file <- read.csv("03PCA020119.txt",header = F)

plot(file$V1,file$V2, xlab = "Delay (mm)", ylab = "Amplitude (a.u.)","l")
#Transforming distance to time=======================================================
c <- 299792458                         #Velocity of light in m/s
distance = (file$V1-file$V1[1])*1e-3   #Distance in meters
time <- ((2*distance)/c)*1e12
#Builing frequency vector============================================================
dt <- tail(time,n=1) - head(time, n=1)
freq <- (seq(1,nrow(file))/dt)
#Fourier transforming amplitude======================================================
amp <- abs(fft(file$V2))
#Plotting============================================================================
plot(freq,amp,xlab = 'Frequency (THz)',ylab = 'Amplitude (a.u)','l',xlim = c(0,5))
plot(time,file$V2,xlab = 'Time delay (ps)',ylab = 'THz E-field Amp','l')

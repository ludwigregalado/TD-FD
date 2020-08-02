ref <- read.csv('PCATest4.txt', header = FALSE)

ref$V1 <- ref$V1-ref$V1[1]
ref$V2 <- ref$V3-ref$V3[1]

write.table(ref,file="PCARef.csv",col.names = FALSE,row.names = FALSE)
plot(ref$V1,ref$V2,xlab = 'Delay (mm)',ylab = 'Amplitude (a.u.)', 'l')

for(i in 0:9){
  name <- paste('03T08-030519_00',i,'.tmp',sep = '')
  tmp <- read.csv(name,sep = ' ',header = FALSE)  
  nameout <- paste('01T08-NOFF-030519-NOFF-030519_',i,'.tmp', sep = '')
  tmp$V1 <- tmp$V1-tmp$V1[1]
  tmp$V2 <- tmp $V2-tmp$V2[1]
  write.table(tmp,file=nameout,col.names = FALSE,row.names = FALSE,sep = ',')
}

options(stringsAsFactors=FALSE)

PATH <- "/mnt/synmibi/Studierende/DATA/CASY/20201127_MD_plasmidserie_CoilHack/"

data <- read.delim(file.path(PATH, "20201127_plasmid_8 +rha .TXT"),header=FALSE)

from <- which(data[,1]=="Size Channel")+1
to <- which(data[,1]=="Counts Repeat 1")-1
dat <- data[from:to,]

plot(dat, type="l")

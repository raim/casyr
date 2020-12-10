options(stringsAsFactors=FALSE)

PATH <- "/mnt/synmibi/Studierende/DATA/CASY/20201127_MD_plasmidserie_CoilHack/"



sizes <- counts <- matrix(NA, nrow=1024, ncol=8)
for ( i in 1:8 ) {
    file.name <- paste0("20201127_plasmid_",i,"+rha.TXT")
    data <- read.delim(file.path(PATH, file.name),header=FALSE)
    
    from <- which(data[,1]=="Size Channel")+1
    to <- which(data[,1]=="Counts Repeat 1")-1
    dat <- data[from:to,]

    counts[,i] <- as.numeric(dat[,2])
    sizes[,i] <- as.numeric(gsub(" ","",dat[,1]))
    #plot(dat, type="l")
}

## check that all sizes are the same
unique(apply(sizes,1,function(x) length(unique(x))))

## add .005 to duplicates
size <- sizes[,1]
size[which(duplicated(size))] <- size[which(duplicated(size))]+.005

idx <- size>=1 & size<=6

png("20201127_casy.png", width=400, height=200)
par(mai=c(.5,.5,.1,.1),mgp=c(1.3,.4,0),tcl=-.25)
image(y=size[idx],x=1:8,z=t(counts[idx,]), col=viridis::viridis(101),
      ylab=expression("cell diameter, "*mu*m), xlab="sample")
axis(1, at=1:8)
dev.off()

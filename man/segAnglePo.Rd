%% segAnglePo
\name{segAnglePo}
\alias{segAnglePo}

\title{
 generate circular skeleton data by user's mapping data
}
\description{
 This function creates a matrix for the draw circular. In the matrix, column 1 is unique 
 segment or chromosome names; column 2 is for the angle start, column 3 the angle end, 
 column 4 is for the accumulative start point number, column 5 is for the accumulative 
 end point number, column 6 is for the start point number, column 6 is for the end point
 number.
}

\usage{
  segAnglePo(seg.dat=seg.dat,seg=seg);
}
\arguments{
   \item{seg.dat}{the data should be matrix or data frame. column 1 is segment name or chromosome name,
     column 2 is segment start, column 3 is segment end, column 4 is segment name2 (option)
     and column 5 is segment discription (option).}
   \item{seg}{vector: segment names (option)}
}

\author{
 Ying Hu <yhu@mail.nih.gov>
 Chunhua Yan <yanch@mail.nih.gov>
}
\references{
OmicCircus: an R package for simple and circular visualization of omic data
}
\examples{

library(OmicCircos);
options(stringsAsFactors = FALSE);
set.seed(1234);

## initial
seg.num     <- 10;
ind.num     <- 20;
seg.po      <- c(20:50);
link.num    <- 10;
link.pg.num <- 10;

sim.out <- sim.circos(seg=seg.num, po=seg.po, ind=ind.num, link=link.num, 
  link.pg=link.pg.num);

seg.f     <- sim.out$seg.frame;
seg.v     <- sim.out$seg.mapping;
link.v    <- sim.out$seg.link
link.pg.v <- sim.out$seg.link.pg
seg.num   <- length(unique(seg.f[,1]));

## 
seg.name <- paste("chr", 1:seg.num, sep="");
db       <- segAnglePo(seg.f, seg=seg.name);

colors   <- rainbow(seg.num, alpha=0.5);
pdffile  <- "OmicCircos4vignette2.pdf";
pdf(pdffile, 8, 8);
par(mar=c(2, 2, 2, 2));
plot(c(1,800), c(1,800), type="n", axes=FALSE, xlab="", ylab="", main="");

circos(R=400, mapping=seg.v, type="chr", cir=db, col=colors, print.chr.lab=TRUE, W=4, scale=TRUE);
circos(R=360, cir=db, W=40, mapping=seg.v, col.v=8, type="box",   B=TRUE, col=colors[1], lwd=0.1, scale=TRUE);
circos(R=320, cir=db, W=40, mapping=seg.v, col.v=8, type="hist",  B=TRUE, col=colors[3], lwd=0.1, scale=TRUE);
circos(R=280, cir=db, W=40, mapping=seg.v, col.v=8, type="ms",  B=TRUE, col=colors[7], lwd=0.1, scale=TRUE);
circos(R=240, cir=db, W=40, mapping=seg.v, col.v=3, type="h",  B=FALSE,  col=colors[2], lwd=0.1);
circos(R=200, cir=db, W=40, mapping=seg.v, col.v=3, type="s", B=TRUE, col=colors, lwd=0.1);
circos(R=160, cir=db, W=40, mapping=seg.v, col.v=3, type="b", B=FALSE, col=colors, lwd=0.1);
circos(R=150, cir=db, W=40, mapping=link.v, type="link", lwd=2, col=colors);
circos(R=150, cir=db, W=40, mapping=link.pg.v, type="link.pg", lwd=2, col=colors);

dev.off()

}


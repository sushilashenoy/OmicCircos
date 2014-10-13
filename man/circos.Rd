%% circos
\name{circos}
\alias{circos}

\title{
 draw circular
}
\description{
 This is the main function of OmicCircos to draw circular shapes. 
}
\usage{
  circos(mapping=mapping, xc=400, yc=400, R=400, W=W, cir="", type="n", col.v=3, B=F,
         print.chr.lab=T, col.bar=F, col.bar.po = "topleft", cluster=F, order=NULL, scale=F, 
         cutoff = "n", zoom="", lwd=1, col=rainbow(10, alpha=0.5)[7], side="")

}

\arguments{
	\item{mapping}{matrix or data frame or character containing draw values with mapping information 
                  (please have a look at the format of example data sets) In general, 
                  the first column is the segment or chromosome ID, the second column 
                  is the positions, the third column is the position label (option) 
                  and next column(s) is(are) the values. Missing values are allowed and 
                  will be ignored.}
   \item{xc}{integer, the circle center x coordinate}
   \item{yc}{integer, the circle center y coordinate}
   \item{R}{integer, the circle radius}
   \item{W}{integer, the circle wide}
   \item{cir}{given genome reference name (hg19, mm10 ...) or data frame (user's mapping 
             data}
   
   \item{type}{the type is one of "b": bar chart, "box": boxplot, "h": histogram, 
               "hist": polygon for multiple samples, "hl": highlight, "l": line graph, 
               "link": linked line based on Bezier curve, "link.pg": linked polygon based
               on Bezier curve, "heatmap": heatmap, "label": gene label or text annotation.}
   \item{col.v}{number of column. The column value will be drawed. If type=heatmap, the
                number is as the first column.}
   \item{B}{logical: draw bachground?}
   \item{print.chr.lab}{logical: draw chromosome or segment labels?}
   \item{col.bar}{logical: draw col.bar? It is for type=heatmap only by the version.}
   \item{col.bar.po}{draw col.bar position (topleft, bottomright).}
   \item{cluster}{logical: cluster and draw Dendrogram at left coner? It is for type=heatmap only.}
   \item{order}{vector: chromosome or segment order}
   \item{scale}{logical: draw scale?}
   \item{cutoff}{numeric: for multiple samples}
   \item{zoom}{vector containing six values: start chromosome, end chromosome, start position, end
              position, start angle and end angle.}
   \item{lwd}{numeric: line width}
   \item{col}{character or vector: color name(s).}
   \item{side}{character (in or out): for type=label only.}
   \item{...}{...}
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

seg.name <- paste("chr", 1:seg.num, sep="");
db       <- segAnglePo(seg.f, seg=seg.name);

colors   <- rainbow(seg.num, alpha=0.5);

pdffile  <- "OmicCircos4vignette1.pdf";
pdf(pdffile, 8, 8);
par(mar=c(2, 2, 2, 2));
plot(c(1,800), c(1,800), type="n", axes=FALSE, xlab="", ylab="", main="");

circos(R=400, cir=db, type="chr", col=colors, print.chr.lab=TRUE, W=4, scale=TRUE);
circos(R=360, cir=db, W=40, mapping=seg.v, col.v=3, type="l",   B=TRUE, col=colors[1], lwd=0.1, scale=TRUE);
circos(R=320, cir=db, W=40, mapping=seg.v, col.v=3, type="ls",  B=FALSE, col=colors[3], lwd=0.1, scale=TRUE);
circos(R=280, cir=db, W=40, mapping=seg.v, col.v=3, type="lh",  B=TRUE, col=colors[7], lwd=0.1, scale=TRUE);
circos(R=240, cir=db, W=40, mapping=seg.v, col.v=19, type="ml",  B=FALSE, col=colors, lwd=0.1, scale=TRUE);
circos(R=200, cir=db, W=40, mapping=seg.v, col.v=19, type="ml2", B=TRUE, col=colors, lwd=0.1);
circos(R=160, cir=db, W=40, mapping=seg.v, col.v=19, type="ml3", B=FALSE, cutoff=5, lwd=0.1);
circos(R=150, cir=db, W=40, mapping=link.v, type="link", lwd=2, col=colors);
circos(R=150, cir=db, W=40, mapping=link.pg.v, type="link.pg", lwd=2, col=colors);

dev.off()

\dontrun{
demo(OmicCircos4vignette1)
demo(OmicCircos4vignette2)
demo(OmicCircos4vignette3)
demo(OmicCircos4vignette4)
demo(OmicCircos4vignette5)
demo(OmicCircos4vignette6)
demo(OmicCircos4vignette7)
demo(OmicCircos4vignette8)
demo(OmicCircos4vignette9)
demo(OmicCircos4vignette10)
}

}

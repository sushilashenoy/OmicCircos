rm(list=ls());
options(stringsAsFactors = FALSE);
library(OmicCircos);

data(UCSC.hs_cyto_mm);
data(UCSC.hs_cyto_mac);

###############################################################
pdffile <- "OmicCircos4vignette8.pdf";
pdf(pdffile, 8, 8);
par(mar=c(2, 2, 2, 2));

plot(c(1,800), c(1,800), type="n", axes=FALSE, xlab="", ylab="", main="hs-mm");
circos(R=380, cir="hg19.mm10", type="chr",  W=4, scale=TRUE);
circos(R=360, cir="hg19.mm10", W=50, mapping=UCSC.hs_cyto_mm, type="link.pg", lwd=2);

plot(c(1,800), c(1,800), type="n", axes=FALSE, xlab="", ylab="", main="hs-mac");
circos(R=380, cir="hg19.mac3", type="chr",  W=4, scale=TRUE);
circos(R=360, cir="hg19.mac3", W=50, mapping=UCSC.hs_cyto_mac, type="link.pg", lwd=2);

dev.off();
rm(list=ls());
options(stringsAsFactors = FALSE);
library(OmicCircos);


data("TCGA.PAM50_genefu_hg18");
data("TCGA.BC.fus");
data("TCGA.BC.cnv.2k.60");
data("TCGA.BC.gene.exp.2k.60");
data("TCGA.BC.sample60");
data("TCGA.BC_Her2_cnv_exp");

pvalue <- -1 * log10(TCGA.BC_Her2_cnv_exp[,5]);
pvalue <- cbind(TCGA.BC_Her2_cnv_exp[,c(1:3)], pvalue);

Her2.i <- which(TCGA.BC.sample60[,2] == "Her2");
Her2.n <- TCGA.BC.sample60[Her2.i,1];

Her2.j <- which(colnames(TCGA.BC.cnv.2k.60) %in% Her2.n);
cnv    <- TCGA.BC.cnv.2k.60[,c(1:3,Her2.j)]; 
cnv.m  <- cnv[,c(4:ncol(cnv))];
cnv.m[cnv.m >  2] <- 2;
cnv.m[cnv.m < -2] <- -2;
cnv <- cbind(cnv[,1:3], cnv.m);

Her2.j   <- which(colnames(TCGA.BC.gene.exp.2k.60) %in% Her2.n);
gene.exp <- TCGA.BC.gene.exp.2k.60[,c(1:3,Her2.j)]; 

colors <- rainbow(10, alpha=0.5);

pdffile  <- "OmicCircos4vignette4.pdf";
pdf(pdffile, 8, 8);
par(mar=c(2, 2, 2, 2));
plot(c(1,800), c(1,800), type="n", axes=FALSE, xlab="", ylab="");

circos(R=300, type="chr", cir="hg18", print.chr.lab=FALSE, W=4);
circos(R=310, cir="hg18", W=20, mapping=TCGA.PAM50_genefu_hg18, type="label", side="out", col="black");
circos(R=250, cir="hg18", W=50, mapping=cnv, col.v=4, type="ml3", B=FALSE, col=colors[7], cutoff=0, scale=TRUE);
circos(R=200, cir="hg18", W=50, mapping=gene.exp, col.v=4, type="ml3", B=TRUE, col=colors[3], cutoff=0, scale=TRUE);
circos(R=140, cir="hg18", W=50, mapping=pvalue, col.v=4, type="l", B=FALSE, col=colors[1], scale=TRUE);
circos(R=132, cir="hg18", W=50, mapping=TCGA.BC.fus, type="link", lwd=2);

plot(c(1,800), c(1,800), type="n", axes=FALSE, xlab="", ylab="");
circos(R=300, type="chr", cir="hg18", col=TRUE, print.chr.lab=FALSE, W=4);
circos(R=290, cir="hg18", W=20, mapping=TCGA.PAM50_genefu_hg18, type="label", side="in", col="blue");
circos(R=310, cir="hg18", W=50, mapping=cnv, col.v=4, type="ml3", B=TRUE, col=colors[7], cutoff=0, scale=TRUE);
circos(R=150, cir="hg18", W=50, mapping=gene.exp, col.v=4, type="ml3", B=TRUE, col=colors[3], cutoff=0, scale=TRUE);
circos(R=90,  cir="hg18", W=50, mapping=pvalue, col.v=4, type="l", B=FALSE, col=colors[1], scale=TRUE);
circos(R=82, cir="hg18", W=50, mapping=TCGA.BC.fus, type="link", lwd=2);

dev.off();

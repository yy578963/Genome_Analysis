library(DESeq2)

data_R7_1 = read.table("SRR24516462.txt", header = TRUE)
R7_1 = data_R7_1[,2]
data_R7_2 = read.table("SRR24516463.txt", header = TRUE)
R7_2 = data_R7_2[,2]
data_R7_3 = read.table("SRR24516464.txt", header = TRUE)
R7_3 = data_R7_3[,2]

# HP126 to R7 

data_HP126_1 = read.table("SRR24516459.txt", header = TRUE)
HP126_1 = data_HP126_1[,2]
data_HP126_2 = read.table("SRR24516460.txt", header = TRUE)
HP126_2 = data_HP126_2[,2]
data_HP126_3 = read.table("SRR24516461.txt", header = TRUE)
HP126_3 = data_HP126_3[,2]

HP126_to_R7_sampleNames = c("R7_1", "R7_2", "R7_3", "HP126_1", "HP126_2", "HP126_3")
HP126_to_R7_data = cbind(R7_1, R7_2, R7_3, HP126_1, HP126_2, HP126_3)
names(HP126_to_R7_data) = HP126_to_R7_sampleNames
rownames(HP126_to_R7_data) = data_R7_1$Geneid

HP126_to_R7_database = data.frame(name=HP126_to_R7_sampleNames, condition=c("R7", "R7", "R7", "HP126", "HP126", "HP126"))
rownames(HP126_to_R7_database) = HP126_to_R7_sampleNames

dds <- DESeqDataSetFromMatrix(HP126_to_R7_data, colData=HP126_to_R7_database, design= ~ condition)
dds <- dds[ rowSums(counts(dds)) > 1, ]

dds <- DESeq(dds)
res <- results(dds)
write.csv(res, "res_des_output.csv")
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds, normalized=TRUE)),by="row.names",sort=FALSE)
write.csv(resdata, "all_des_output.csv", row.names=FALSE)

vsd <- vst(dds, blind = FALSE)
plotPCA(vsd, "condition")

library(ggplot2)

resdata$change <- as.factor(
  ifelse(
    resdata$padj<0.01 & abs(resdata$log2FoldChange)>1,
    ifelse(resdata$log2FoldChange>1, "Up", "Down"),
    "NoDiff"
  )
)
valcano <- ggplot(data=resdata, aes(x=log2FoldChange, y=-log10(padj), color=change)) + 
  geom_point(alpha=0.8, size=1) + 
  theme_bw(base_size=15) + 
  theme(
    panel.grid.minor=element_blank(),
    panel.grid.major=element_blank()
  ) + 
  ggtitle("DESeq2 Valcano") + 
  scale_color_manual(name="", values=c("red", "green", "black"), limits=c("Up", "Down", "NoDiff")) + 
  geom_vline(xintercept=c(-1, 1), lty=2, col="gray", lwd=0.5) + 
  geom_hline(yintercept=-log10(0.01), lty=2, col="gray", lwd=0.5)

valcano

library(pheatmap)

select <- order(rowMeans(counts(dds, normalized=T)), decreasing=T)[1:30]
nt <- normTransform(dds)
log2.norm.counts <- assay(nt)[select,]
df <- as.data.frame(colData(dds)[, c("name", "condition")])
pheatmap(log2.norm.counts, cluster_rows=T, show_rownames=T, cluster_cols=T, annotation_col=df, fontsize=6)

# DV3 to R7 

data_DV3_1 = read.table("SRR24516456.txt", header = TRUE)
DV3_1 = data_DV3_1[,2]
data_DV3_2 = read.table("SRR24516457.txt", header = TRUE)
DV3_2 = data_DV3_2[,2]
data_DV3_3 = read.table("SRR24516458.txt", header = TRUE)
DV3_3 = data_DV3_3[,2]

DV3_to_R7_sampleNames = c("R7_1", "R7_2", "R7_3", "DV3_1", "DV3_2", "DV3_3")
DV3_to_R7_data = cbind(R7_1, R7_2, R7_3, DV3_1, DV3_2, DV3_3)
names(DV3_to_R7_data) = DV3_to_R7_sampleNames
rownames(DV3_to_R7_data) = data_R7_1$Geneid

DV3_to_R7_database = data.frame(name=DV3_to_R7_sampleNames, condition=c("R7", "R7", "R7", "DV3", "DV3", "DV3"))
rownames(DV3_to_R7_database) = DV3_to_R7_sampleNames

dds <- DESeqDataSetFromMatrix(DV3_to_R7_data, colData=DV3_to_R7_database, design= ~ condition)
dds <- dds[ rowSums(counts(dds)) > 1, ]

dds <- DESeq(dds)
res <- results(dds)
write.csv(res, "res_des_output.csv")
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds, normalized=TRUE)),by="row.names",sort=FALSE)
write.csv(resdata, "all_des_output.csv", row.names=FALSE)

vsd <- vst(dds, blind = FALSE)
plotPCA(vsd, "condition")

resdata$change <- as.factor(
  ifelse(
    resdata$padj<0.01 & abs(resdata$log2FoldChange)>1,
    ifelse(resdata$log2FoldChange>1, "Up", "Down"),
    "NoDiff"
  )
)
valcano <- ggplot(data=resdata, aes(x=log2FoldChange, y=-log10(padj), color=change)) + 
  geom_point(alpha=0.8, size=1) + 
  theme_bw(base_size=15) + 
  theme(
    panel.grid.minor=element_blank(),
    panel.grid.major=element_blank()
  ) + 
  ggtitle("DESeq2 Valcano") + 
  scale_color_manual(name="", values=c("red", "green", "black"), limits=c("Up", "Down", "NoDiff")) + 
  geom_vline(xintercept=c(-1, 1), lty=2, col="gray", lwd=0.5) + 
  geom_hline(yintercept=-log10(0.01), lty=2, col="gray", lwd=0.5)

valcano

select <- order(rowMeans(counts(dds, normalized=T)), decreasing=T)[1:30]
nt <- normTransform(dds)
log2.norm.counts <- assay(nt)[select,]
df <- as.data.frame(colData(dds)[, c("name", "condition")])
pheatmap(log2.norm.counts, cluster_rows=T, show_rownames=T, cluster_cols=T, annotation_col=df, fontsize=6)




# together

sampleNames = c("R7_1", "R7_2", "R7_3", "HP126_1", "HP126_2", "HP126_3", "DV3_1", "DV3_2", "DV3_3")
data = cbind(R7_1, R7_2, R7_3, HP126_1, HP126_2, HP126_3,DV3_1, DV3_2, DV3_3)
names(data) = HP126_to_R7_sampleNames
rownames(data) = data_R7_1$Geneid

database = data.frame(name=sampleNames, condition=c("R7", "R7", "R7", "HP126", "HP126", "HP126", "DV3", "DV3", "DV3"))
rownames(database) = sampleNames

dds <- DESeqDataSetFromMatrix(data, colData=database, design= ~ condition)
dds <- dds[ rowSums(counts(dds)) > 1, ]

dds <- DESeq(dds)
res <- results(dds)
write.csv(res, "res_des_output.csv")
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds, normalized=TRUE)),by="row.names",sort=FALSE)
write.csv(resdata, "all_des_output.csv", row.names=FALSE)

vsd <- vst(dds, blind = FALSE)
plotPCA(vsd, "condition")

library(ggplot2)

resdata$change <- as.factor(
  ifelse(
    resdata$padj<0.01 & abs(resdata$log2FoldChange)>1,
    ifelse(resdata$log2FoldChange>1, "Up", "Down"),
    "NoDiff"
  )
)
valcano <- ggplot(data=resdata, aes(x=log2FoldChange, y=-log10(padj), color=change)) + 
  geom_point(alpha=0.8, size=1) + 
  theme_bw(base_size=15) + 
  theme(
    panel.grid.minor=element_blank(),
    panel.grid.major=element_blank()
  ) + 
  ggtitle("DESeq2 Valcano") + 
  scale_color_manual(name="", values=c("red", "green", "black"), limits=c("Up", "Down", "NoDiff")) + 
  geom_vline(xintercept=c(-1, 1), lty=2, col="gray", lwd=0.5) + 
  geom_hline(yintercept=-log10(0.01), lty=2, col="gray", lwd=0.5)

valcano

library(pheatmap)

select <- order(rowMeans(counts(dds, normalized=T)), decreasing=T)[1:30]
nt <- normTransform(dds)
log2.norm.counts <- assay(nt)[select,]
df <- as.data.frame(colData(dds)[, c("name", "condition")])
pheatmap(log2.norm.counts, cluster_rows=T, show_rownames=T, cluster_cols=T, annotation_col=df, fontsize=6)













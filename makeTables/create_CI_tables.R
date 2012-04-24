# Regarding the AA multiple sequence alignments, please find them attached. The first zipped folder contains the AA MSA files of 30 primate species, and the second those of 32 animal species (the ones that Eduardo had used). Jeremy can start working with both files and calculate the CI for both taxa. Later we can use other taxon levels such as mammals, or we can add many more animal species (>1000). 
# Regarding the CI definition, according to Ruiz-Pesini et al, 2004, (Effects of Purifying and Adaptive Selection on Regional Variationin Human mtDNA, Science 303, 223) the conservation index per position is the percentage of species for a list of 39 different species that have the wild type human (rCRS) amino acid. Therefore, when a mutation exists in a query sequence in any of the mtDNA protein-coding genes, then in one column we should  report whether the mutation is synonymous or non-synonymous. In the case of non-synonymous mutations instead of reporting "non-synonymous" we can report the AA change, e.g., A52T, where A is the AA in rCRS AA sequence, 52 is the AA position, and T is the AA in the query sequence. In the next column we should report the CI, that is the percentage of the 39 animal sequences that have A in position 52. 

library("Biostrings")
library("stringr")
library("ggplot2")
seqs<-read.AAStringSet(filename)
str_extract(filename,"([0-9]+)_([A-Za-z0-9]+).fa")
matches<-str_match(filename,"([0-9]+)_([A-Za-z0-9]+).fa")
loci<-matches[2]
commonName<-matches[3]
seqMatrix<-as.matrix(seqs)
#i don't care for gaps
seqMatrix<-seqMatrix[,-which(seqMatrix[1,]=='-')]
of39<-apply(seqMatrix,2,FUN=function(x){length(which(x==x[1]))})
df<-data.frame(loci=loci,common=commonName,aa_pos=1:length(of39),of39=of39)
write.table(df,file=outfile,sep="\t",quote=FALSE,row.names=FALSE)
confirmRCSlen<-paste(seqMatrix[1,],collapse="")
write(confirmRCSlen,file=paste('geneSizes/',commonName,':',str_length(confirmRCSlen),'bp',sep=""))
of39df<-data.frame(x=1:length(of39),y=of39)
p<-ggplot(data=of39df,aes(x=x,y=y))+geom_bar(stat="identity",position="dodge")+xlab("pos")+ylab("rCRS of 39")+opts(title=commonName)
X11(type="cairo")
print(p)
savePlot(filename=paste("plots/",commonName,".tiff",sep=""),type="tiff")
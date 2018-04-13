MF = cc.mf nc.mf elastic.mf quasi.mf matter.mf sc.mf
TMF = cc.tfm nc.tfm elastic.tfm quasi.tfm matter.tfm sc.tfm
PDFLATEX = article.aux article.log article.out article.toc
BIBTEX = article.bbl article.blg

all:
	make article;

clean:
	rm $(MF) $(TMF) $(PDFLATEX) $(BIBTEX)

article:
	pdflatex -shell-escape article.tex
	
mf: $(MF)
	$(foreach var, $(MF), mf '\mode:=laserjet; input $(var)';)

bib: article.aux
	bibtex article

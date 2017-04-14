all: pdf doc

doc: lit_review.md
	pandoc lit_review.md -o ../out/lit_review.docx --filter pandoc-crossref --filter pandoc-citeproc -H format.sty -V fontsize=12pt --bibliography=/Users/Steven/Dropbox/Research/library.bib --csl=austral-ecology.csl

pdf: lit_review.md
	pandoc --filter pandoc-crossref --filter pandoc-citeproc -H format.sty -V fontsize=12pt --bibliography=/Users/Steven/Dropbox/Research/library.bib --csl=austral-ecology.csl lit_review.md -o ../out/lit_review.pdf
clean:
	rm ../out/lit_review.pdf
	rm ../out/lit_review.docx

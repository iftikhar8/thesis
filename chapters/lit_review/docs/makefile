all: pdf doc

doc: lit_review.md
	pandoc lit_review.md -o ../out/lit_review.docx --filter pandoc-crossref

pdf: lit_review.md
	pandoc --filter pandoc-crossref --filter pandoc-citeproc -H format.sty -V fontsize=12pt --bibliography=lit_review.bib --csl=austral-ecology.csl lit_review.md -o ../out/lit_review.pdf 
clean: 
	rm ../out/lit_review.pdf
	rm ../outlit_review.docx

all: pdf doc

doc: lit_review.md
	pandoc --reference-docx=ref.docx lit_review.md -o lit_review.docx --filter pandoc-crossref

pdf: lit_review.md
	pandoc -H format.sty -V fontsize=12pt --bibliography=project.bib --csl=austral-ecology.csl lit_review.md -o lit_review.pdf --filter pandoc-crossref --filter pandoc-citeproc
clean: 
	rm lit_review.pdf
	rm lit_review.docx

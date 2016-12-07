all: pdf doc

doc: lit_review.md
	pandoc --reference-docx=ref.docx lit_review.md -o lit_review.docx --filter pandoc-crossref

pdf: lit_review.md
	pandoc -H format.sty -V fontsize=12pt --csl=austral_ecology.csl lit_review.md -o lit_review.pdf --filter pandoc-crossref

clean: 
	rm lit_review.pdf
	rm lit_review.docx

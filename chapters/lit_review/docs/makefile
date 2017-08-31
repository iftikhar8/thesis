all: pdf doc

doc: lit-review.md
	pandoc --reference-docx=../../../bibliography/template.docx lit-review.md -o ../out/lit-review.docx --filter pandoc-crossref -M "crossrefYaml=../../../templates/pandoc-crossref.yaml" --filter pandoc-citeproc  --bibliography=/Users/steve/Dropbox/Research/library.bib --csl=../../../templates/austral-ecology.csl

pdf: lit-review.md
	pandoc --filter pandoc-crossref --filter pandoc-citeproc -H format.sty -V fontsize=12pt --bibliography=/Users/steve/Dropbox/Research/library.bib --csl=../../../templates/austral-ecology.csl lit-review.md -o ../out/lit-review.pdf
clean:
	rm ../out/lit-review.pdf
	rm ../out/lit-review.docx

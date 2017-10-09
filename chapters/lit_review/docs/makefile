all: pdf draft

draft: lit-review.md
	pandoc --reference-docx=../../../templates/custom-reference-draft.docx --csl=../../../templates/austral-ecology.csl lit-review.md -o ../out/lit-review-draft.docx --filter pandoc-crossref -M "crossrefYaml=../../../templates/pandoc-crossref.yaml" --filter pandoc-citeproc  --bibliography=/Users/steve/Dropbox/Research/library.bib

supplement: supplement.md
	pandoc --reference-docx=../../../templates/custom-reference-draft.docx  supplement.md -o ../out/supplement.docx

final: lit-review.md
	pandoc --reference-docx=../../../templates/custom-reference-final.docx --csl=../../../templates/austral-ecology.csl lit-review.md -o ../out/lit-review-final.docx --filter pandoc-crossref -M "crossrefYaml=../../../templates/pandoc-crossref.yaml" --filter pandoc-citeproc  --bibliography=/Users/steve/Dropbox/Research/library.bib

pdf: lit-review.md
	pandoc --filter pandoc-crossref --filter pandoc-citeproc -H ../../../templates/format.sty -V fontsize=12pt --bibliography=/Users/steve/Dropbox/Research/library.bib --csl=../../../templates/austral-ecology.csl lit-review.md supplement.md -o ../out/lit-review.pdf

clean:
	rm ../out/lit-review.pdf
	rm ../out/lit-review.docx

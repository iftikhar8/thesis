
word-template=templates/custom-reference-meps.docx
pdf-template=templates/format.sty
bibliography=/Users/steve/Dropbox/Research/library.bib
yaml="crossrefYaml=templates/pandoc-crossref.yaml"
csl=templates/inter-research-science-center.csl


abstract:
	pandoc --reference-doc=$(word-template) chapters/abstract/abstract.md -o out/abstract.docx

lit-review:
	pandoc --reference-doc=$(word-template) --filter pandoc-crossref -M $(yaml) --filter pandoc-citeproc  --bibliography=$(bibliography) --csl=$(csl) chapters/lit_review/docs/lit-review.md -o out/lit-review.docx

lit-review-pdf:
	pandoc --filter pandoc-crossref --filter pandoc-citeproc -H $(pdf-template) -V fontsize=12pt --bibliography=$(bibliography) --csl=$(csl) chapters/lit_review/docs/lit-review.md -o out/lit-review.pdf

empirical:
		pandoc --reference-doc=$(word-template) --filter pandoc-crossref -M $(yaml) --filter pandoc-citeproc  --bibliography=$(bibliography) --csl=$(csl) chapters/empirical/docs/empirical.md -o out/empirical.docx

theoretical:
		pandoc --reference-doc=$(word-template) --filter pandoc-crossref -M $(yaml) --filter pandoc-citeproc  --bibliography=$(bibliography) --csl=$(csl) chapters/theoretical/docs/theoretical.md -o out/theoretical.docx

applied:
		pandoc --reference-doc=$(word-template) --filter pandoc-crossref -M $(yaml) --filter pandoc-citeproc  --bibliography=$(bibliography) --csl=$(csl) chapters/applied/docs/applied.md -o out/applied.docx

thesis:
	pandoc --filter pandoc-crossref --filter pandoc-citeproc -H $(pdf-template) -V fontsize=12pt --bibliography=$(bibliography) --csl=$(csl) chapters/lit_review/docs/lit-review.md -o out/lit-review.pdf

clean:
	rm out/*.docx
	rm out/*.pdf

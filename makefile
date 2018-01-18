

word-template=templates/custom-reference.docx
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
		pandoc --toc --reference-doc=$(word-template) --filter pandoc-crossref -M $(yaml) --filter pandoc-citeproc  --bibliography=$(bibliography) --csl=$(csl) chapters/applied/docs/applied.md -o out/applied.docx

thesis-pdf:
	pandoc --filter pandoc-crossref --filter pandoc-citeproc -H $(pdf-template) -V fontsize=12pt --bibliography=$(bibliography) --csl=$(csl) chapters/sections/title.md chapters/lit-review/docs/lit-review.md chapters/empirical/docs/empirical.md chapters/theoretical/docs/theoretical.md chapters/applied/docs/applied.md -o out/thesis.pdf

thesis-docx:
	pandoc  --reference-doc=$(word-template) -M $(yaml) --filter pandoc-crossref --filter pandoc-citeproc --bibliography=$(bibliography) --csl=$(csl) chapters/sections/title.md chapters/lit-review/docs/lit-review.md chapters/empirical/docs/empirical.md chapters/theoretical/docs/theoretical.md chapters/applied/docs/applied.md -o out/thesis.docx

clean:
	rm out/*.docx
	rm out/*.pdf

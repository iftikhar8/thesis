

word-template=templates/thesis-template.docx
pdf-template=templates/format.sty
bibliography=/Users/Steven/Dropbox/Research/my-library.bib
yaml="crossrefYaml=templates/pandoc-crossref.yaml"
csl=templates/inter-research-science-center.csl


abstract:
	pandoc --reference-doc=$(word-template) chapters/abstract/abstract.md -o out/abstract.docx

intro:
		pandoc --reference-doc=$(word-template) --filter pandoc-crossref -M $(yaml) --filter pandoc-citeproc --filter pandoc-docx-pagebreak --bibliography=$(bibliography) --csl=$(csl) chapters/introduction/docs/introduction.md -o out/introduction.docx
lit-review:
	pandoc --reference-doc=$(word-template) --filter pandoc-crossref -M $(yaml) --filter pandoc-citeproc  --bibliography=$(bibliography) --csl=$(csl) chapters/lit_review/docs/lit-review.md -o out/lit-review.docx

lit-review-pdf:
	pandoc --filter pandoc-crossref --filter pandoc-citeproc -H $(pdf-template) -V fontsize=12pt --bibliography=$(bibliography) --csl=$(csl) chapters/lit_review/docs/lit-review.md -o out/lit-review.pdf

empirical:
		pandoc --reference-doc=$(word-template) --filter pandoc-crossref -M $(yaml) --filter pandoc-citeproc --filter pandoc-docx-pagebreak --bibliography=$(bibliography) --csl=$(csl) chapters/empirical/docs/empirical.md -o out/empirical.docx

theoretical:
		pandoc --reference-doc=$(word-template) --filter pandoc-crossref -M $(yaml) --filter pandoc-citeproc --filter pandoc-docx-pagebreak --bibliography=$(bibliography) --csl=$(csl) chapters/theoretical/docs/theoretical.md -o out/theoretical.docx

theoretical-drop:
		pandoc --reference-doc=$(word-template) --filter pandoc-crossref -M $(yaml) --filter pandoc-citeproc --filter pandoc-docx-pagebreak --bibliography=$(bibliography) --csl=$(csl) chapters/theoretical/docs/theoretical.md -o /Users/Steven/Dropbox/theoretical.docx

applied:
		pandoc --filter pandoc-docx-pagebreak --filter pandoc-crossref -M $(yaml) --filter pandoc-citeproc --reference-doc=$(word-template) --bibliography=$(bibliography) --csl=$(csl) chapters/applied/docs/applied.md -o out/applied.docx

applied-drop:
		pandoc --reference-doc=$(word-template) --filter pandoc-crossref -M $(yaml) --filter pandoc-citeproc  --bibliography=$(bibliography) --csl=$(csl) chapters/applied/docs/applied.md -o /Users/Steven/Dropbox/applied.docx

thesis-pdf:
	pandoc --filter pandoc-crossref --filter pandoc-citeproc -H $(pdf-template) -V fontsize=12pt --bibliography=$(bibliography) --csl=$(csl) chapters/sections/title.md chapters/lit-review/docs/lit-review.md chapters/empirical/docs/empirical.md chapters/theoretical/docs/theoretical.md chapters/applied/docs/applied.md -o out/thesis.pdf

thesis-docx:
	pandoc  --reference-doc=$(word-template) -M $(yaml) --filter pandoc-crossref --filter pandoc-citeproc --bibliography=$(bibliography) --csl=$(csl) chapters/sections/title.md chapters/lit-review/docs/lit-review.md chapters/empirical/docs/empirical.md chapters/theoretical/docs/theoretical.md chapters/applied/docs/applied.md -o out/thesis.docx

clean:
	rm out/*.docx
	rm out/*.pdf

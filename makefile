
word-template=templates/custom-reference-draft.docx
pdf-template=templates/format.sty
bibliography=/Users/steve/Dropbox/Research/library.bib
yaml="crossrefYaml=templates/pandoc-crossref.yaml"
csl=templates/austral-ecology.csl


abstract:
	pandoc --reference-doc=$(word-template) chapters/abstract/abstract.md -o out/abstract.docx

lit-review:
	pandoc --reference-doc=$(word-template) --filter pandoc-crossref -M $(yaml) --filter pandoc-citeproc  --bibliography=$(bibliography) chapters/lit_review/docs/lit-review.md -o out/lit-review.docx

lit-review-pdf:
	pandoc --filter pandoc-crossref --filter pandoc-citeproc -H $(pdf-template) -V fontsize=12pt --bibliography=$(bibliography) --csl=$(csl) chapters/lit_review/docs/lit-review.md -o out/lit-review.pdf


thesis:
	pandoc --filter pandoc-crossref --filter pandoc-citeproc -H $(pdf-template) -V fontsize=12pt --bibliography=$(bibliography) --csl=$(csl) chapters/lit_review/docs/lit-review.md -o out/lit-review.pdf
	
clean:
	rm out/*.docx
	rm out/*.pdf

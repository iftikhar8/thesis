all: html pdf docx

chapter=empirical
version=0.1
bibliography=/Users/Steven/Dropbox/Research/library.bib

html :
	Rscript -e "require(knitr); require(markdown); knit('../src/r/$(chapter).rmd', '../out/$(chapter).md'); markdownToHTML('../out/$(chapter).md', '../out/$(chapter).html', options=c('use_xhtml', 'base64_images')); browseURL(paste('file://', file.path(getwd(),'../out/$(chapter).html'), sep=''))"

docx: $(chapter).md
	pandoc $(chapter).md -o ../out/$(chapter).docx --filter pandoc-crossref --filter pandoc-citeproc  --bibliography=$(bibliography) --csl=../../templates/austral-ecology.csl

docx-version:
	pandoc --reference-docx=../../../templates/template.docx $(chapter).md -o ../out/$(chapter)-v$(version).docx --filter pandoc-crossref -M "crossrefYaml=../../../templates/pandoc-crossref.yaml" --filter pandoc-citeproc  --bibliography=$(bibliography) --csl=../../../templates/austral-ecology.csl

pdf: $(chapter).md
	pandoc --filter pandoc-crossref --filter pandoc-citeproc -H ../../templates/format.sty -V fontsize=12pt --bibliography=$(bibliography) --csl=../../templates/austral-ecology.csl $(chapter).md -o ../out/$(chapter).pdf

clean:
	rm ../out/$(chapter).pdf
	rm ../out/$(chapter)-v$(version).docx
	rm ../out/$(chapter).docx

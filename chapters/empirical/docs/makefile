empirical: pdf docx

docx: empirical.md
	pandoc --reference-docx=../../../templates/template.docx empirical.md -o ../out/empirical.docx --filter pandoc-crossref -M "crossrefYaml=../../../templates/pandoc-crossref.yaml" --filter pandoc-citeproc  --bibliography=/Users/steve/Dropbox/Research/library.bib --csl=../../../templates/austral-ecology.csl

pdf: empirical.md
	pandoc --filter pandoc-crossref -M "crossrefYaml=../../../templates/pandoc-crossref.yaml" --filter pandoc-citeproc -H ../../../templates/format.sty -V fontsize=12pt --bibliography=/Users/steve/Dropbox/Research/library.bib --csl=../../../templates/austral-ecology.csl empirical.md -o ../out/empirical.pdf
clean:
	rm ../out/empirical.pdf
	rm ../out/empirical.docx

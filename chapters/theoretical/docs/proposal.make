all: html pdf

html: proposal.md
	pandoc -t slidy -s proposal.md -o proposal.html

pdf: proposal.md
	pandoc -V fontsize=10pt proposal.md -o proposal.pdf 

clean: 
	rm proposal.html
	rm proposal.pdf
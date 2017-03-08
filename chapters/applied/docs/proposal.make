all: html pdf doc

html: proposal.md
	pandoc -t slidy -s proposal.md -o proposal.html

pdf: proposal.md
	pandoc -V fontsize=10pt proposal.md -o proposal.pdf

doc : proposal.md
	pandoc proposal.md -S -o proposal.docx

clean:
	rm proposal.html
	rm proposal.pdf
	rm proposal.docx


NAME = 42pdf

all:
	clear
	./42pdf

e:
	-rm *.subject.pdf
	ls

re: e all


# fun stuff, to remove later
PDF = en.subject.pdf

# no version pdf
# VARS = 103001
# inception pdf
VARS = 131848

URL = https://cdn.intra.42.fr/pdf/pdf/$(VARS)/en.subject.pdf

input:
	$(eval VARS=$(shell read -p "Enter the ID: " id; echo $$id))
	@wget -q "https://cdn.intra.42.fr/pdf/pdf/$(VARS)/en.subject.pdf"

$(PDF):
	@wget -q $(URL)

pdf: $(PDF)

title: pdf
	@pdftotext -l 1 $(PDF) - | head -n 1

summary: pdf
	@pdftotext -l 1 $(PDF) - | sed -n '/Summary:/,/Version:/{/Version:/b;p}'

version: pdf
	@if pdftotext -l 1 $(PDF) - | grep -q 'Version:'; then \
		pdftotext -l 1 $(PDF) - | grep 'Version:' | cut -d' ' -f2; \
	else \
		echo "This pdf doesn't have version"; \
	fi

open: pdf
	@open $(PDF)

cat: pdf
	@pdftotext -l 1 $(PDF) -

wc:
	@ls en.subject* | wc -l

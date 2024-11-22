
all:
	./script
	ls

e:
	rm en.subject*
	ls

re: e all

VARS = 103345

# test:
# 	@wget -q https://cdn.intra.42.fr/pdf/pdf/$(VARS)/en.subject.pdf
# 	@pdftotext -l 1 en.subject.pdf - | grep 'Version:' | cut -d' ' -f2
# 	@rm en.subject.pdf

wc:
	@ls en.subject* | wc -l

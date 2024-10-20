
all:
	./script
	ls

e:
	rm en.subject*
	ls

re: e all

VARS = https://cdn.intra.42.fr/pdf/pdf/103345/en.subject.pdf

# test:
# 	@wget -q $(VARS)
# 	@pdftotext -l 1 en.subject.pdf - | grep 'Version:' | cut -d' ' -f2
# 	@rm en.subject.pdf

wc:
	@ls en.subject* | wc -l

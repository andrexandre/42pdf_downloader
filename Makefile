NAME = 42pdf

all:
	clear ; ./$(NAME)

rm:
	-rm -f *.subject.pdf
	-rm -rf cpp_modules
	-rm -rf common_core
	ls

re: rm all

wc:
	@ls en.subject* | wc -l

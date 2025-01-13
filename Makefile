NAME = 42pdf

all:
	clear ; ./$(NAME)

rm:
	-rm -f *.subject.pdf .subject.pdf
	-rm -rf c_piscine cpp_modules common_core all_42_pdf minilibx-linux
	ls

re: rm all

wc:
	@ls en.subject* | wc -l

NAME = 42pdf

all:
	clear
	./$(NAME)

rm:
	-rm -f *.subject.pdf
	-rm -rf cpp_modules
	-rm -rf common_core
	ls

re: rm all

wc:
	@ls en.subject* | wc -l

# As of 1/1/2025 there's no projects on intra that have only numbers
# on the title, use the following command to check subjects:
# cat $db_name | cut -d' ' -f2- | grep '^[0-9]\+$'

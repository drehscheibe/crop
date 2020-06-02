NAME=crop
ARCHIVE_NAME=$(NAME).tar.gz
ARCHIVE_CONTENTS=$(NAME).dtx Makefile README $(NAME).ins

all: $(NAME).sty $(NAME).pdf

archive: $(NAME).ins
	rm -rf $(NAME)/
	mkdir $(NAME)/
	cp $(ARCHIVE_CONTENTS) $(NAME)/
	tar -czf $(ARCHIVE_NAME) $(NAME)

$(NAME).pdf:
	latexmk $(NAME).dtx

$(NAME).sty: $(NAME).ins
	tex $(NAME).ins

$(NAME).ins:
	pdflatex $(NAME).dtx

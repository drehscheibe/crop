NAME=crop
ARCHIVE_NAME=$(NAME).tar.gz
ARCHIVE_CONTENTS=$(NAME).dtx $(NAME).pdf Makefile README $(NAME).ins $(NAME).sty

all: $(NAME).sty $(NAME).pdf

archive: $(ARCHIVE_CONTENTS)
	rm -rf $(NAME)/
	mkdir $(NAME)/
	cp $(ARCHIVE_CONTENTS) $(NAME)/
	tar -czf $(ARCHIVE_NAME) $(NAME)

$(NAME).pdf: $(NAME.dtx)
	latexmk $(NAME).dtx

$(NAME).sty: $(NAME).ins
	tex $(NAME).ins

$(NAME).ins:
	pdflatex $(NAME).dtx

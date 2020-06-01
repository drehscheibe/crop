NAME=crop
ARCHIVE_NAME=$(NAME).tar.gz
ARCHIVE_CONTENTS=$(NAME).dtx Makefile $(NAME).txt $(NAME).ins

all: $(NAME).sty $(NAME).pdf

archive: $(NAME).ins
	@ tar -czf $(ARCHIVE_NAME) $(ARCHIVE_CONTENTS)
	@ echo $(ARCHIVE_NAME):
	@ echo ====================
	@ tar -tzf $(ARCHIVE_NAME)

$(NAME).pdf:
	latexmk $(NAME).dtx

$(NAME).sty: $(NAME).ins
	tex $(NAME).ins

$(NAME).ins:
	pdflatex $(NAME).dtx

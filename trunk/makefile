MAIN=main-learnpad-d7-1

SUBDIR=$(shell find . -type d | grep -v "\.svn" )

OTHERTEXFILES=makefile $(shell ls *.tex)

OTHERFIGFILES=$(shell find . -name "*.png")

BIBFILES=$(shell find . -name "*.bib")

ARCHIVENAME=LearnPAd_D7p1_v
VERSION=$(shell grep "\\version{.*}" $(MAIN) | sed "s/\\\\version{//" | sed "s/}.*//" | sed "s/[[:space:]]//g")
DESTINATION=/tmp/
ARCHIVE=$(DESTINATION)$(ARCHIVENAME)$(VERSION).tgz
SOURCES=$(shell basename `pwd`)
PARENT_SOURCES=$(shell cd ..;pwd)

VCS=".svn"

all:
	pdflatex $(MAIN)
	bibtex $(MAIN)
	pdflatex $(MAIN)
	pdflatex $(MAIN)

mostlyclean:
	rm -f $(MAIN).aux
	rm -f $(MAIN).bbl
	rm -f $(MAIN).blg
	rm -f $(MAIN).log
	rm -f $(MAIN).out
	rm -f *~

clean: mostlyclean
	rm -f $(MAIN).pdf
	rm -f rm -f *~ *.log *.aux *.out *.toc *.blg *.bbl *.toc *.lof *.backup *.ind *.ilg *.idx *.spl *.lol *.lot *.ent *.bak

treeclean: clean
	for d in $(SUBDIR) ; do cd $$d ; $(MAKE) clean ; cd - ; done

install:
	for i in $(SUBDIR); do if [ ! -e "$$i/makefile" ]; then cp makefile $$i; fi; done

deploy: treeclean
	rm -rf $(ARCHIVE)
	tar -zcvf $(ARCHIVE) -C $(PARENT_SOURCES) --exclude="*$(VCS)" --exclude="makefile" --exclude="*kilepr" --exclude=".*" $(SOURCES)	

ignore:
	svn propset svn:ignore "*.toc\
		*.log\
		*~\
		*.aux\
		*.out\
		*.blg\
		*.bbl\
		*.lof\
		*.backup\
		*.ind\
		*.ilg\
		*.idx\
		*.spl\
		*.lol\
		*.lot\
		*.ent\
		*.bak\
		*.pdf" .

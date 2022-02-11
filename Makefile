.PHONY: all clean prepare main release preview/notes.tex preview/exercises.tex

all: prepare main release

main: build/notes.pdf 

exercises: build/notes.pdf

build/notes.pdf: notes.tex
	latexmk -f -quiet -output-directory="./build"

build/exercises.pdf: exercises.tex
	latexmk -f -quiet -output-directory="./build"

preview/notes.tex:
	latexmk -pvc notes.tex

preview/exercises.tex:
	latexmk -pvc exercises.tex

clean:
	rm -rf build submission
	latexmk -c

prepare:
	mkdir -p build print 

release:
	cp build/*.pdf print 

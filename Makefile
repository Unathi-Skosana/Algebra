.PHONY: all clean prepare main release preview

all: prepare main release preview/main.tex

main: build/main.pdf 

exercises: build/main.pdf

build/main.pdf: main.tex
	latexmk -f -quiet -pdflatex -output-directory="./build"

build/exercises.pdf: exercises.tex
	latexmk -f -quiet -pdflatex -output-directory="./build"

preview/main.tex:
	latexmk -pvc main.tex

preview/exercises.tex:
	latexmk -pvc exercises.tex

clean:
	rm -rf build submission
	latexmk -c

prepare:
	mkdir -p build submission

release:
	cp build/*.pdf submission

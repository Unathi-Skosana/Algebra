.PHONY: all clean prepare main release preview

all: prepare main release preview

main: build/master.pdf

build/master.pdf: master.tex
	latexmk -f -quiet -pdflatex -output-directory="./build"

preview:
	latexmk -pvc

clean:
	rm -rf build submission
	latexmk -c

prepare:
	mkdir -p build submission

release:
	cp build/*.pdf submission

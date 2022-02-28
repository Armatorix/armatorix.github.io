.PHONY: build
build: build-tpls build-tex


.PHONY: build-tpls
build-tpls:
	go run main.go

.PHONY: build-tex
build-tex:
	pdflatex main.tex
	rm main.aux main.out main.log main.tex

.PHONY: install-tex
install-tex:
	sudo apt-get install texlive-full
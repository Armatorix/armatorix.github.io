.PHONY: build
build: build-tpls build-tex


.PHONY: build-tpls
build-tpls:
	go run main.go

.PHONY: build-tex
build-tex:
	pdflatex main.tex
	rm main.aux main.out main.log main.tex
	mv main.pdf godev_wsokolowski.pdf

.PHONY: install-tex
install-tex:
	sudo apt-get -y --fix-missing install texlive-full

.PHONY: run
run:
	python3 -m http.server
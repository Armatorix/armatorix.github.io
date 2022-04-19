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
	sudo apt-get install texlive-full

.PHONY: run
run:
	docker run -p 8000:8000 -v $(pwd):/dummy python:slim-buster python -m http.server --directory /dumm

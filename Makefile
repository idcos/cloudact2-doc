

.PHONY: serve
serve:
	gitbook serve


.PHONY: build
build:
	gitbook build


.PHONY: single
single:
	gitbook build -f page


.PHONY: pdf
pdf:
	gitbook pdf ./ ./cloud-act2.pdf
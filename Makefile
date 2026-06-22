
.PHONY: main
main:
	rhombus main.rhm

upload:
	mkdir -p compiled/web
	cp *.html *.svg *.ico *.png find-user-exe.rkt compiled/web
	raco s3-sync --web --check-metadata compiled/web s3://rhombus-lang.org

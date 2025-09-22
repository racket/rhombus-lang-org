
.PHONE: index
index:
	rhombus index.rhm

upload:
	mkdir -p compiled/web
	cp *.html *.svg *.ico *.png compiled/web
	raco s3-sync --web --check-metadata compiled/web s3://rhombus-lang.org

version=`cat VERSION`

release:
	git tag -a v$(version) -m "v$(version)"
	git push --tags

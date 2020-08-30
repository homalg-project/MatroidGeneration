all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g \
		PackageInfo.g \
		doc/Doc.autodoc \
		gap/*.gd gap/*.gi examples/*.g* 
			gap makedoc.g

clean:
	(cd doc ; ./clean)

test: doc
	hpcgap tst/testall.g

test-tabs:
	! grep -RP "\t" examples/ gap/

test-with-coverage: doc
	hpcgap --quitonbreak --cover stats tst/testall.g
	echo 'LoadPackage("profiling"); OutputJsonCoverage("stats", "coverage.json");' | hpcgap

ci-test: test-tabs test-with-coverage

.PHONY: clean realclean

drupal:
	bin/setup

site:
	bin/setup

clean:
	rm -rf drupal

realclean: clean
	chmod +w site
	rm -rf site

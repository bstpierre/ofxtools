init:
	pip install pipenv --upgrade
	pipenv install --dev --skip-lock

ci:
	TZ="US/Central" pipenv run nosetests -dsv --with-yanc --with-coverage --cover-package ofxtools tests/*.py

test:
	coverage erase
	nosetests -dsv --with-yanc --with-coverage --cover-package ofxtools tests/*.py

clean:
	find -regex '.*\.pyc' -exec rm {} \;
	find -regex '.*~' -exec rm {} \;
	rm -rf reg-settings.py
	rm -rf MANIFEST dist build *.egg-info
	rm -rf test.db

install:
	make clean
	make uninstall
	python setup.py install

uninstall:
	pip uninstall -y ofxtools

lint:
	pylint ofxtools/*.py

lint-tests:
	pylint tests/*.py

.PHONY:	test clean lint lint-tests install uninstall

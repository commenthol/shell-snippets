
SHELL=/usr/bin/bash
VENV=.venv
PYTHON=python3
PYTHON_VERSION=$(shell ${PYTHON} -V | cut -d " " -f 2 | cut -c1-3)
SITE_PACKAGES=${VENV}/lib/python${PYTHON_VERSION}/site-packages
VENV_ACTIVATE=. ${VENV}/bin/activate

default: tests

${VENV}:
	@echo "Creating Python environment..." >&2
	@${PYTHON} -m venv ${VENV}
	@echo "Updating pip..." >&2
	@${VENV_ACTIVATE}; pip install -U pip pipenv && pipenv install && pipenv install -d autopep8

.PHONY: active 
active:
	${VENV_ACTIVATE} && exec $$SHELL

.PHONY: deps
deps: ${VENV}

.PHONY: tests
tests: deps
	@${PYTHON} -m pytest -s tests

.PHONY: freeze
freeze: deps
	pipenv lock -r > requirements.txt

.PHONY: clean
clean:
	rm -rf .pytest_cache

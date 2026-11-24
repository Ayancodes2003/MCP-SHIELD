.PHONY: install lint format test cov opa-test build docker

install:
	uv sync --all-extras

lint:
	python -m ruff check .
	python -m ruff format --check .
	python -m mypy

format:
	python -m ruff format .

test:
	python -m pytest -q

cov:
	python -m pytest -q --cov

opa-test:
	opa test policies/

build:
	uv build

docker:
	docker build -t mcp-shield .

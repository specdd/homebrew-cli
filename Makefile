.PHONY: audit install test

FORMULA := ./Formula/specdd.rb

audit:
	brew audit --strict --online --new $(FORMULA)

install:
	brew install --build-from-source --verbose $(FORMULA)

test:
	brew test $(FORMULA)

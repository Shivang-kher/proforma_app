.PHONY: help get pods clean deep-clean build gen run run-ios run-mac run-web fix

# ── default ───────────────────────────────────────────────
help:
	@echo ""
	@echo "  Proforma App — available commands"
	@echo ""
	@echo "  Setup"
	@echo "    make get          flutter pub get"
	@echo "    make pods         pod install (iOS)"
	@echo ""
	@echo "  Code generation (drift)"
	@echo "    make gen          run build_runner once"
	@echo "    make watch        run build_runner in watch mode"
	@echo ""
	@echo "  Run"
	@echo "    make run-ios      run on connected iPhone"
	@echo "    make run-mac      run on macOS"
	@echo "    make run-web      run in Chrome"
	@echo ""
	@echo "  Clean"
	@echo "    make clean        flutter clean"
	@echo "    make deep-clean   flutter clean + remove pods + pub cache reset"
	@echo ""
	@echo "  Code quality"
	@echo "    make fix          dart fix --apply"
	@echo "    make analyze      flutter analyze"
	@echo ""

# ── setup ─────────────────────────────────────────────────
get:
	flutter pub get

pods:
	cd ios && pod install --repo-update

# ── code generation ───────────────────────────────────────
gen:
	dart run build_runner build

watch:
	dart run build_runner watch

# ── run ───────────────────────────────────────────────────
run-ios:
	flutter run -d ios

run-mac:
	flutter run -d macos

run-web:
	flutter run -d chrome

# ── clean ─────────────────────────────────────────────────
clean:
	flutter clean
	@echo "✓ Cleaned Flutter build artifacts"

deep-clean: clean
	rm -rf ios/Pods ios/.symlinks ios/Podfile.lock
	flutter pub cache repair
	flutter pub get
	cd ios && pod install
	@echo "✓ Deep clean complete — pods reinstalled"

# ── quality ───────────────────────────────────────────────
fix:
	dart fix --apply

analyze:
	flutter analyze

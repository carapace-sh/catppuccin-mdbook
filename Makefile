define apply
	@echo "Patching with ./$1/patch.diff..."
	@git -C mdBook apply ../$1/patch.diff
endef

default:
	@echo "Select make target..."

clean: patch
	@echo "Resetting to clean state..."
	@git -C mdBook restore .
	@git -C mdBook clean -f .

build: clean
	$(call apply,peach)
	@echo "Building from source..."
	@cd mdBook && pnpm install && pnpm run build

patch:
	@echo "Creating patch..."
	@git -C mdBook diff > patch.diff

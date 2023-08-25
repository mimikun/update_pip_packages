today = $(shell date "+%Y%m%d")
product_name = update_pip_packages

.PHONY : patch
patch : clean diff-patch patch-copy2win

.PHONY : diff-patch
diff-patch :
	git diff origin/master > $(product_name).$(today).patch

.PHONY : patch-branch
patch-branch :
	git switch -c patch-$(today)

.PHONY : patch-copy2win
patch-copy2win :
	cp *.patch $$WIN_HOME/Downloads/

.PHONY : install
install :
	bash utils/install.sh

.PHONY : clean
clean :
	rm -f fmt-*
	rm -f *.patch

.PHONY : lint
lint :
	bash utils/lint.sh

.PHONY : lint_pwsh
lint_pwsh :
	@echo "Run PowerShell ScriptAnalyzer"
	@pwsh -Command "& {Invoke-ScriptAnalyzer ./Invoke-UpdatePipPackage.ps1}"
	@pwsh -Command "& {Invoke-ScriptAnalyzer ./Invoke-PueueUpdatePipPackage.ps1}"

.PHONY : test
test : lint lint_pwsh

.PHONY : format
format :
	bash utils/format.sh

.PHONY : fmt
fmt : format

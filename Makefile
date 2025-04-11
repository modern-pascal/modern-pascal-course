# Compile all examples with FPC.
# Use `find` to find all *.dpr files (including subdirectories)
# and compile them with FPC, in Delphi mode (-Mdelphi,
# see README.md for explanation why we use Delphi mode).
.PHONY: all
all:
	find . \
		'(' -type d -name '140_forms_etc' -prune ')' -o \
		'(' -type d -name '150_data_module_using_components' -prune ')' -o \
		'(' -type d -name 'xxx_advanced_records_initialize' -prune ')' -o \
		'(' -type f -iname *.dpr \
				'(' -execdir fpc -Mdelphi {} ';' -o -quit ')' \
		')'

# Compile all examples with FPC.
# Use `find` to find all *.dpr files (including subdirectories)
# and compile them with FPC, in Delphi mode (-Mdelphi,
# see README.md for explanation why we use Delphi mode).
.PHONY: all
all:
	find . \
		'(' -type d -name '140_forms_etc' -prune ')' -o \
		'(' -type d -name '150_data_module_using_components' -prune ')' -o \
		'(' -type d -name '310_anonymous' -prune ')' -o \
		'(' -type d -name '305_callbacks_assigning' -prune ')' -o \
		'(' -type d -name '300_callbacks_events' -prune ')' -o \
		'(' -type f -iname *.dpr \
				'(' -execdir fpc -Mdelphi {} ';' -o -quit ')' \
		')'

# If you have FPC 3.3.1, you can use this, to test more examples.
.PHONY: all-fpc331
all-fpc331:
	find . \
		'(' -type d -name '140_forms_etc' -prune ')' -o \
		'(' -type d -name '150_data_module_using_components' -prune ')' -o \
		'(' -type f -iname *.dpr \
				'(' -execdir fpc -Mdelphi {} ';' -o -quit ')' \
		')'

# TODO: Add Delphi call version.
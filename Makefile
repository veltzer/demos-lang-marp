##########
# params #
##########
# do you want to see the commands executed ?
DO_MKDBG:=0
# do you want dependency on the Makefile itself ?
DO_ALLDEP:=1
# do you want to convert marp to PDF?
DO_MARP_PDF:=1
# do you want to convert marp to PDF?
DO_MARP_PPTX:=1
# do you want to convert marp to HTML?
DO_MARP_HTML:=1

########
# code #
########
ALL:=

# silent stuff
ifeq ($(DO_MKDBG),1)
Q:=
# we are not silent in this branch
else # DO_MKDBG
Q:=@
#.SILENT:
endif # DO_MKDBG

# dependency on the makefile itself
ifeq ($(DO_ALLDEP),1)
.EXTRA_PREREQS+=$(foreach mk, ${MAKEFILE_LIST},$(abspath ${mk}))
endif # DO_ALLDEP

MARP_SRC:=$(shell find marp -type f -and -name "*.md")
MARP_BAS:=$(basename $(MARP_SRC))
MARP_PDF:=$(addprefix out/,$(addsuffix .pdf,$(MARP_BAS)))
MARP_PPTX:=$(addprefix out/,$(addsuffix .pptx,$(MARP_BAS)))
MARP_HTML:=$(addprefix out/,$(addsuffix .html,$(MARP_BAS)))

ifeq ($(DO_MARP_PDF),1)
ALL+=$(MARP_PDF)
endif # DO_MARP_PDF

ifeq ($(DO_MARP_PPTX),1)
ALL+=$(MARP_PPTX)
endif # DO_MARP_PPTX

ifeq ($(DO_MARP_HTML),1)
ALL+=$(MARP_HTML)
endif # DO_MARP_HTML

#########
# rules #
#########
.PHONY: all
all: $(ALL)
	@true

.PHONY: debug
debug:
	$(info doing [$@])
	$(info MARP_SRC is $(MARP_SRC))
	$(info MARP_BAS is $(MARP_BAS))
	$(info MARP_PDF is $(MARP_PDF))
	$(info MARP_PPTX is $(MARP_PPTX))
	$(info MARP_HTML is $(MARP_HTML))

.PHONY: clean
clean:
	$(info doing [$@])
	$(Q)rm -f $(ALL)

.PHONY: clean_hard
clean_hard:
	$(info doing [$@])
	$(Q)git clean -qffxd

############
# patterns #
############
$(MARP_PDF): out/%.pdf: %.md
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)pymakehelper only_print_on_error node_modules/.bin/marp --pdf --output $@ $<
$(MARP_PPTX): out/%.pptx: %.md
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)pymakehelper only_print_on_error node_modules/.bin/marp --quiet --pptx --output $@ $<
$(MARP_HTML): out/%.html: %.md
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)pymakehelper only_print_on_error node_modules/.bin/marp --html --output $@ $<

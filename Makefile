##############
# parameters #
##############
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
# do you want to convert mermaid diagrams into png?
DO_MERMAID_PNG:=0

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

MARP_SRC:=$(shell find marp -type f -and -name "*.md")
MARP_BAS:=$(basename $(MARP_SRC))
MARP_PDF:=$(addprefix out/,$(addsuffix .pdf,$(MARP_BAS)))
MARP_PPTX:=$(addprefix out/,$(addsuffix .pptx,$(MARP_BAS)))
MARP_HTML:=$(addprefix out/,$(addsuffix .html,$(MARP_BAS)))

MERMAID_SRC:=$(shell find mermaid -type f -and -name "*.mmd")
MERMAID_BAS:=$(basename $(MERMAID_SRC))
MERMAID_PNG:=$(addprefix out/,$(addsuffix .png,$(MERMAID_BAS)))

ifeq ($(DO_MARP_PDF),1)
ALL+=$(MARP_PDF)
endif # DO_MARP_PDF

ifeq ($(DO_MARP_PPTX),1)
ALL+=$(MARP_PPTX)
endif # DO_MARP_PPTX

ifeq ($(DO_MARP_HTML),1)
ALL+=$(MARP_HTML)
endif # DO_MARP_HTML

ifeq ($(DO_MERMAID_PNG),1)
ALL+=$(MERMAID_PNG)
endif # DO_MERMAID_PNG

# MARP_DEPENDS=engine.js
MARP_DEPENDS=
MARP_FLAGS=--html --allow-local-files --quiet

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
	$(info MERMAID_SRC is $(MERMAID_SRC))
	$(info MERMAID_BAS is $(MERMAID_BAS))
	$(info MERMAID_PNG is $(MERMAID_PNG))

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
$(MARP_PDF): out/%.pdf: %.md $(MARP_DEPENDS)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)pymakehelper only_print_on_error node_modules/.bin/marp $(MARP_FLAGS) --pdf --output $@ $<
$(MARP_PPTX): out/%.pptx: %.md $(MARP_DEPENDS)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)pymakehelper only_print_on_error node_modules/.bin/marp $(MARP_FLAGS) --pptx --output $@ $<
$(MARP_HTML): out/%.html: %.md $(MARP_DEPENDS)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)pymakehelper only_print_on_error node_modules/.bin/marp $(MARP_FLAGS) --html --output $@ $<
$(MERMAID_PNG): out/%.png: %.mmd .mmdc.config.json
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)pymakehelper only_print_on_error node_modules/.bin/mmdc -p .mmdc.config.json -i $< -o $@

##########
# alldep #
##########
ifeq ($(DO_ALLDEP),1)
.EXTRA_PREREQS+=$(foreach mk, ${MAKEFILE_LIST},$(abspath ${mk}))
endif # DO_ALLDEP

.NOTPARALLEL:

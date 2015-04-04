
#================================
# PROJECT DEFINITION
#================================

ROOT:=$(CURDIR)
TYR_PATH=$(ROOT)/../Tyr
BIN=$(ROOT)/bin
SCRIPT=$(ROOT)/Gungnir
DATA=$(ROOT)/Droupnir
ANALYSIS=$(ROOT)/Sleipnir
PROJECT=[Odin]
DONE=@echo "$(PROJECT) $@ done"


DATA_NAME_0=dividend earning price
DATA_NAME=$(foreach file, $(DATA_NAME_0), $(DATA)/$(file))

#================================
# RULE
#================================
.PHONY: clean setup install gen $(DATA_NAME_0)

all: gen
	
gen:
	@echo "Hello"


parser_all: $(DATA_NAME_0)
	$(DONE)

$(DATA_NAME_0):
	-@sh $(BIN)/parsing.sh "$@_all" $(BIN) $(DATA)/$@
	$(DONE)

setup: install
	@mkdir -p $(DATA) $(DATA_NAME)
	$(DONE)

install: 
	@cd $(TYR_PATH) && make;
	@cp -rf $(TYR_PATH)/bin .
	@cp -f $(SCRIPT)/script/* $(BIN)/
	$(DONE)

clean:
	@rm -rf $(BIN)
	$(DONE)

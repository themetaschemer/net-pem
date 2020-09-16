SOURCE_DIR=net/pem
SOURCES=\
 $(SOURCE_DIR)/pem.rkt

RACO="$(shell which raco)"

all: $(SOURCES)
	$(RACO) make $(SOURCES)

test: $(SOURCES)
	$(RACO) test $(SOURCES)

testOnly: $(SOURCES)
	$(RACO) test $(SOURCE_DIR)/$(module)

# GNU Make solution makefile autogenerated by Premake
# Type "make help" for usage help

ifndef config
  config=debug
endif
export config

PROJECTS := framework tutorial1 FragPosition VertexColors

.PHONY: all clean help $(PROJECTS)

all: $(PROJECTS)

framework: 
	@echo "==== Building framework ($(config)) ===="
	@${MAKE} --no-print-directory -C common -f Makefile

tutorial1: framework
	@echo "==== Building tutorial1 ($(config)) ===="
	@${MAKE} --no-print-directory -C tutorial1 -f Makefile

FragPosition: framework
	@echo "==== Building FragPosition ($(config)) ===="
	@${MAKE} --no-print-directory -C tutorial2 -f FragPosition.make

VertexColors: framework
	@echo "==== Building VertexColors ($(config)) ===="
	@${MAKE} --no-print-directory -C tutorial2 -f VertexColors.make

clean:
	@${MAKE} --no-print-directory -C common -f Makefile clean
	@${MAKE} --no-print-directory -C tutorial1 -f Makefile clean
	@${MAKE} --no-print-directory -C tutorial2 -f FragPosition.make clean
	@${MAKE} --no-print-directory -C tutorial2 -f VertexColors.make clean

help:
	@echo "Usage: make [config=name] [target]"
	@echo ""
	@echo "CONFIGURATIONS:"
	@echo "   debug"
	@echo "   release"
	@echo ""
	@echo "TARGETS:"
	@echo "   all (default)"
	@echo "   clean"
	@echo "   framework"
	@echo "   tutorial1"
	@echo "   FragPosition"
	@echo "   VertexColors"
	@echo ""
	@echo "For more information, see http://industriousone.com/premake/quick-start"

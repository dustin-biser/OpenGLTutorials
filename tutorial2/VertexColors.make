# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifeq ($(config),debug)
  OBJDIR     = obj/Debug/VertexColors
  TARGETDIR  = .
  TARGET     = $(TARGETDIR)/VertexColors
  DEFINES   += -DDEBUG -DFREEGLUT_STATIC -D_LIB -DFREEGLUT_LIB_PRAGMAS=0 -DLOAD_X11
  INCLUDES  += -I../ext/glsdk/glload/include -I../ext/glsdk/glutil/include -I../ext/glsdk/freeglut/include -I. -I../common
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -Wall -std=c++0x
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L../ext/glsdk/glload/lib -L../ext/glsdk/glutil/lib -L../ext/glsdk/freeglut/lib -L../lib
  LIBS      += -lframework -lglloadD -lglutilD -lfreeglutD -lGL -lGLU
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../lib/libframework.a
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release)
  OBJDIR     = obj/Release/VertexColors
  TARGETDIR  = .
  TARGET     = $(TARGETDIR)/VertexColors
  DEFINES   += -DRELEASE -DNDEBUG -DFREEGLUT_STATIC -D_LIB -DFREEGLUT_LIB_PRAGMAS=0 -DLOAD_X11
  INCLUDES  += -I../ext/glsdk/glload/include -I../ext/glsdk/glutil/include -I../ext/glsdk/freeglut/include -I. -I../common
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -Wall -std=c++0x
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L../ext/glsdk/glload/lib -L../ext/glsdk/glutil/lib -L../ext/glsdk/freeglut/lib -L../lib
  LIBS      += -lframework -lglload -lglutil -lfreeglut -lGL -lGLU
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../lib/libframework.a
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/VertexColors.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking VertexColors
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning VertexColors
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	-$(SILENT) cp $< $(OBJDIR)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
endif

$(OBJDIR)/VertexColors.o: VertexColors.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)

#
#   ejs-vxworks-default.mk -- Makefile to build Embedthis Ejscript for vxworks
#

export WIND_BASE := $(WIND_BASE)
export WIND_HOME := $(WIND_BASE)/..
export WIND_PLATFORM := $(WIND_PLATFORM)

PRODUCT         := ejs
VERSION         := 2.3.0
BUILD_NUMBER    := 1
PROFILE         := default
ARCH            := $(shell uname -m | sed 's/i.86/x86/;s/x86_64/x64/;s/arm.*/arm/;s/mips.*/mips/')
OS              := vxworks
CC              := ccpentium
LD              := /usr/bin/ld
CONFIG          := $(OS)-$(ARCH)-$(PROFILE)
LBIN            := $(CONFIG)/bin

BIT_ROOT_PREFIX       := deploy
BIT_BASE_PREFIX       := $(BIT_ROOT_PREFIX)
BIT_DATA_PREFIX       := $(BIT_VAPP_PREFIX)
BIT_STATE_PREFIX      := $(BIT_VAPP_PREFIX)
BIT_BIN_PREFIX        := $(BIT_VAPP_PREFIX)
BIT_INC_PREFIX        := $(BIT_VAPP_PREFIX)/inc
BIT_LIB_PREFIX        := $(BIT_VAPP_PREFIX)
BIT_MAN_PREFIX        := $(BIT_VAPP_PREFIX)
BIT_SBIN_PREFIX       := $(BIT_VAPP_PREFIX)
BIT_ETC_PREFIX        := $(BIT_VAPP_PREFIX)
BIT_WEB_PREFIX        := $(BIT_VAPP_PREFIX)/web
BIT_LOG_PREFIX        := $(BIT_VAPP_PREFIX)
BIT_SPOOL_PREFIX      := $(BIT_VAPP_PREFIX)
BIT_CACHE_PREFIX      := $(BIT_VAPP_PREFIX)
BIT_APP_PREFIX        := $(BIT_BASE_PREFIX)
BIT_VAPP_PREFIX       := $(BIT_APP_PREFIX)
BIT_SRC_PREFIX        := $(BIT_ROOT_PREFIX)/usr/src/$(PRODUCT)-$(VERSION)

CFLAGS          += -fno-builtin -fno-defer-pop -fvolatile -w
DFLAGS          += -D_REENTRANT -DVXWORKS -DRW_MULTI_THREAD -D_GNU_TOOL -DCPU=PENTIUM $(patsubst %,-D%,$(filter BIT_%,$(MAKEFLAGS)))
IFLAGS          += -I$(CONFIG)/inc -I$(WIND_BASE)/target/h -I$(WIND_BASE)/target/h/wrn/coreip
LDFLAGS         += '-Wl,-r'
LIBPATHS        += -L$(CONFIG)/bin
LIBS            += 

DEBUG           := debug
CFLAGS-debug    := -g
DFLAGS-debug    := -DBIT_DEBUG
LDFLAGS-debug   := -g
DFLAGS-release  := 
CFLAGS-release  := -O2
LDFLAGS-release := 
CFLAGS          += $(CFLAGS-$(DEBUG))
DFLAGS          += $(DFLAGS-$(DEBUG))
LDFLAGS         += $(LDFLAGS-$(DEBUG))

unexport CDPATH

all compile: prep \
        $(CONFIG)/bin/libmpr.out \
        $(CONFIG)/bin/libmprssl.out \
        $(CONFIG)/bin/ejsman.out \
        $(CONFIG)/bin/makerom.out \
        $(CONFIG)/bin/libest.out \
        $(CONFIG)/bin/ca.crt \
        $(CONFIG)/bin/libpcre.out \
        $(CONFIG)/bin/libhttp.out \
        $(CONFIG)/bin/http.out \
        $(CONFIG)/bin/libsqlite3.out \
        $(CONFIG)/bin/sqlite.out \
        $(CONFIG)/bin/libzlib.out \
        $(CONFIG)/bin/libejs.out \
        $(CONFIG)/bin/ejs.out \
        $(CONFIG)/bin/ejsc.out \
        $(CONFIG)/bin/ejsmod.out \
        $(CONFIG)/bin/ejsrun.out \
        $(CONFIG)/bin/ejs.mod \
        $(CONFIG)/bin/ejs.unix.mod \
        $(CONFIG)/bin/jem.es \
        $(CONFIG)/bin/jem.out \
        $(CONFIG)/bin/ejs.db.mod \
        $(CONFIG)/bin/ejs.db.mapper.mod \
        $(CONFIG)/bin/ejs.db.sqlite.mod \
        $(CONFIG)/bin/libejs.db.sqlite.out \
        $(CONFIG)/bin/ejs.web.mod \
        $(CONFIG)/bin/libejs.web.out \
        $(CONFIG)/bin/www \
        $(CONFIG)/bin/ejs.template.mod \
        $(CONFIG)/bin/ejs.zlib.mod \
        $(CONFIG)/bin/libejs.zlib.out \
        $(CONFIG)/bin/ejs.tar.mod \
        $(CONFIG)/bin/mvc.es \
        $(CONFIG)/bin/mvc.out \
        $(CONFIG)/bin/ejs.mvc.mod \
        $(CONFIG)/bin/utest.es \
        $(CONFIG)/bin/utest.worker \
        $(CONFIG)/bin/utest.out

.PHONY: prep

prep:
	@if [ "$(CONFIG)" = "" ] ; then echo WARNING: CONFIG not set ; exit 255 ; fi
	@if [ "$(BIT_APP_PREFIX)" = "" ] ; then echo WARNING: BIT_APP_PREFIX not set ; exit 255 ; fi
	@[ ! -x $(CONFIG)/bin ] && mkdir -p $(CONFIG)/bin; true
	@[ ! -x $(CONFIG)/inc ] && mkdir -p $(CONFIG)/inc; true
	@[ ! -x $(CONFIG)/obj ] && mkdir -p $(CONFIG)/obj; true
	@[ ! -f $(CONFIG)/inc/bit.h ] && cp projects/ejs-vxworks-default-bit.h $(CONFIG)/inc/bit.h ; true
	@[ ! -f $(CONFIG)/inc/bitos.h ] && cp src/bitos.h $(CONFIG)/inc/bitos.h ; true
	@if ! diff $(CONFIG)/inc/bit.h projects/ejs-vxworks-default-bit.h >/dev/null ; then\
		echo cp projects/ejs-vxworks-default-bit.h $(CONFIG)/inc/bit.h  ; \
		cp projects/ejs-vxworks-default-bit.h $(CONFIG)/inc/bit.h  ; \
	fi; true
clean:
	rm -rf $(CONFIG)/bin/libmpr.out
	rm -rf $(CONFIG)/bin/libmprssl.out
	rm -rf $(CONFIG)/bin/ejsman.out
	rm -rf $(CONFIG)/bin/makerom.out
	rm -rf $(CONFIG)/bin/libest.out
	rm -rf $(CONFIG)/bin/ca.crt
	rm -rf $(CONFIG)/bin/libpcre.out
	rm -rf $(CONFIG)/bin/libhttp.out
	rm -rf $(CONFIG)/bin/http.out
	rm -rf $(CONFIG)/bin/libsqlite3.out
	rm -rf $(CONFIG)/bin/sqlite.out
	rm -rf $(CONFIG)/bin/libzlib.out
	rm -rf $(CONFIG)/bin/libejs.out
	rm -rf $(CONFIG)/bin/ejs.out
	rm -rf $(CONFIG)/bin/ejsc.out
	rm -rf $(CONFIG)/bin/ejsmod.out
	rm -rf $(CONFIG)/bin/ejsrun.out
	rm -rf $(CONFIG)/bin/jem.es
	rm -rf $(CONFIG)/bin/jem.out
	rm -rf $(CONFIG)/bin/ejs.db.mod
	rm -rf $(CONFIG)/bin/ejs.db.mapper.mod
	rm -rf $(CONFIG)/bin/ejs.db.sqlite.mod
	rm -rf $(CONFIG)/bin/libejs.db.sqlite.out
	rm -rf $(CONFIG)/bin/ejs.web.mod
	rm -rf $(CONFIG)/bin/libejs.web.out
	rm -rf $(CONFIG)/bin/www
	rm -rf $(CONFIG)/bin/ejs.template.mod
	rm -rf $(CONFIG)/bin/libejs.zlib.out
	rm -rf $(CONFIG)/bin/mvc.es
	rm -rf $(CONFIG)/bin/ejs.mvc.mod
	rm -rf $(CONFIG)/bin/utest.es
	rm -rf $(CONFIG)/bin/utest.worker
	rm -rf $(CONFIG)/bin/utest.out
	rm -rf $(CONFIG)/obj/removeFiles.o
	rm -rf $(CONFIG)/obj/mprLib.o
	rm -rf $(CONFIG)/obj/mprSsl.o
	rm -rf $(CONFIG)/obj/manager.o
	rm -rf $(CONFIG)/obj/makerom.o
	rm -rf $(CONFIG)/obj/estLib.o
	rm -rf $(CONFIG)/obj/pcre.o
	rm -rf $(CONFIG)/obj/httpLib.o
	rm -rf $(CONFIG)/obj/http.o
	rm -rf $(CONFIG)/obj/sqlite3.o
	rm -rf $(CONFIG)/obj/sqlite.o
	rm -rf $(CONFIG)/obj/zlib.o
	rm -rf $(CONFIG)/obj/ecAst.o
	rm -rf $(CONFIG)/obj/ecCodeGen.o
	rm -rf $(CONFIG)/obj/ecCompiler.o
	rm -rf $(CONFIG)/obj/ecLex.o
	rm -rf $(CONFIG)/obj/ecModuleWrite.o
	rm -rf $(CONFIG)/obj/ecParser.o
	rm -rf $(CONFIG)/obj/ecState.o
	rm -rf $(CONFIG)/obj/dtoa.o
	rm -rf $(CONFIG)/obj/ejsApp.o
	rm -rf $(CONFIG)/obj/ejsArray.o
	rm -rf $(CONFIG)/obj/ejsBlock.o
	rm -rf $(CONFIG)/obj/ejsBoolean.o
	rm -rf $(CONFIG)/obj/ejsByteArray.o
	rm -rf $(CONFIG)/obj/ejsCache.o
	rm -rf $(CONFIG)/obj/ejsCmd.o
	rm -rf $(CONFIG)/obj/ejsConfig.o
	rm -rf $(CONFIG)/obj/ejsDate.o
	rm -rf $(CONFIG)/obj/ejsDebug.o
	rm -rf $(CONFIG)/obj/ejsError.o
	rm -rf $(CONFIG)/obj/ejsFile.o
	rm -rf $(CONFIG)/obj/ejsFileSystem.o
	rm -rf $(CONFIG)/obj/ejsFrame.o
	rm -rf $(CONFIG)/obj/ejsFunction.o
	rm -rf $(CONFIG)/obj/ejsGC.o
	rm -rf $(CONFIG)/obj/ejsGlobal.o
	rm -rf $(CONFIG)/obj/ejsHttp.o
	rm -rf $(CONFIG)/obj/ejsIterator.o
	rm -rf $(CONFIG)/obj/ejsJSON.o
	rm -rf $(CONFIG)/obj/ejsLocalCache.o
	rm -rf $(CONFIG)/obj/ejsMath.o
	rm -rf $(CONFIG)/obj/ejsMemory.o
	rm -rf $(CONFIG)/obj/ejsMprLog.o
	rm -rf $(CONFIG)/obj/ejsNamespace.o
	rm -rf $(CONFIG)/obj/ejsNull.o
	rm -rf $(CONFIG)/obj/ejsNumber.o
	rm -rf $(CONFIG)/obj/ejsObject.o
	rm -rf $(CONFIG)/obj/ejsPath.o
	rm -rf $(CONFIG)/obj/ejsPot.o
	rm -rf $(CONFIG)/obj/ejsRegExp.o
	rm -rf $(CONFIG)/obj/ejsSocket.o
	rm -rf $(CONFIG)/obj/ejsString.o
	rm -rf $(CONFIG)/obj/ejsSystem.o
	rm -rf $(CONFIG)/obj/ejsTimer.o
	rm -rf $(CONFIG)/obj/ejsType.o
	rm -rf $(CONFIG)/obj/ejsUri.o
	rm -rf $(CONFIG)/obj/ejsVoid.o
	rm -rf $(CONFIG)/obj/ejsWebSocket.o
	rm -rf $(CONFIG)/obj/ejsWorker.o
	rm -rf $(CONFIG)/obj/ejsXML.o
	rm -rf $(CONFIG)/obj/ejsXMLList.o
	rm -rf $(CONFIG)/obj/ejsXMLLoader.o
	rm -rf $(CONFIG)/obj/ejsByteCode.o
	rm -rf $(CONFIG)/obj/ejsException.o
	rm -rf $(CONFIG)/obj/ejsHelper.o
	rm -rf $(CONFIG)/obj/ejsInterp.o
	rm -rf $(CONFIG)/obj/ejsLoader.o
	rm -rf $(CONFIG)/obj/ejsModule.o
	rm -rf $(CONFIG)/obj/ejsScope.o
	rm -rf $(CONFIG)/obj/ejsService.o
	rm -rf $(CONFIG)/obj/ejs.o
	rm -rf $(CONFIG)/obj/ejsc.o
	rm -rf $(CONFIG)/obj/ejsmod.o
	rm -rf $(CONFIG)/obj/doc.o
	rm -rf $(CONFIG)/obj/docFiles.o
	rm -rf $(CONFIG)/obj/listing.o
	rm -rf $(CONFIG)/obj/slotGen.o
	rm -rf $(CONFIG)/obj/ejsrun.o
	rm -rf $(CONFIG)/obj/ejsSqlite.o
	rm -rf $(CONFIG)/obj/ejsHttpServer.o
	rm -rf $(CONFIG)/obj/ejsRequest.o
	rm -rf $(CONFIG)/obj/ejsSession.o
	rm -rf $(CONFIG)/obj/ejsWeb.o
	rm -rf $(CONFIG)/obj/ejsZlib.o

clobber: clean
	rm -fr ./$(CONFIG)

$(CONFIG)/inc/mpr.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/deps/mpr/mpr.h" "vxworks-x86-default/inc/mpr.h"

$(CONFIG)/inc/bit.h: 

$(CONFIG)/inc/bitos.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/bitos.h" "vxworks-x86-default/inc/bitos.h"

$(CONFIG)/obj/mprLib.o: \
    src/deps/mpr/mprLib.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/mpr.h \
    $(CONFIG)/inc/bitos.h
	$(CC) -c -o $(CONFIG)/obj/mprLib.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/deps/mpr/mprLib.c

$(CONFIG)/bin/libmpr.out: \
    $(CONFIG)/inc/mpr.h \
    $(CONFIG)/obj/mprLib.o
	$(CC) -r -o $(CONFIG)/bin/libmpr.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/mprLib.o 

$(CONFIG)/inc/est.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/deps/est/est.h" "vxworks-x86-default/inc/est.h"

$(CONFIG)/obj/estLib.o: \
    src/deps/est/estLib.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/est.h \
    $(CONFIG)/inc/bitos.h
	$(CC) -c -o $(CONFIG)/obj/estLib.o -fno-builtin -fno-defer-pop -fvolatile $(DFLAGS) $(IFLAGS) src/deps/est/estLib.c

$(CONFIG)/bin/libest.out: \
    $(CONFIG)/inc/est.h \
    $(CONFIG)/obj/estLib.o
	$(CC) -r -o $(CONFIG)/bin/libest.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/estLib.o 

$(CONFIG)/obj/mprSsl.o: \
    src/deps/mpr/mprSsl.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/mpr.h \
    $(CONFIG)/inc/est.h
	$(CC) -c -o $(CONFIG)/obj/mprSsl.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/deps/mpr/mprSsl.c

$(CONFIG)/bin/libmprssl.out: \
    $(CONFIG)/bin/libmpr.out \
    $(CONFIG)/bin/libest.out \
    $(CONFIG)/obj/mprSsl.o
	$(CC) -r -o $(CONFIG)/bin/libmprssl.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/mprSsl.o 

$(CONFIG)/obj/manager.o: \
    src/deps/mpr/manager.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/mpr.h
	$(CC) -c -o $(CONFIG)/obj/manager.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/deps/mpr/manager.c

$(CONFIG)/bin/ejsman.out: \
    $(CONFIG)/bin/libmpr.out \
    $(CONFIG)/obj/manager.o
	$(CC) -o $(CONFIG)/bin/ejsman.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/manager.o $(LDFLAGS)

$(CONFIG)/obj/makerom.o: \
    src/deps/mpr/makerom.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/mpr.h
	$(CC) -c -o $(CONFIG)/obj/makerom.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/deps/mpr/makerom.c

$(CONFIG)/bin/makerom.out: \
    $(CONFIG)/bin/libmpr.out \
    $(CONFIG)/obj/makerom.o
	$(CC) -o $(CONFIG)/bin/makerom.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/makerom.o $(LDFLAGS)

$(CONFIG)/bin/ca.crt: \
    src/deps/est/ca.crt
	mkdir -p "vxworks-x86-default/bin"
	cp "src/deps/est/ca.crt" "vxworks-x86-default/bin/ca.crt"

$(CONFIG)/inc/pcre.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/deps/pcre/pcre.h" "vxworks-x86-default/inc/pcre.h"

$(CONFIG)/obj/pcre.o: \
    src/deps/pcre/pcre.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/pcre.h
	$(CC) -c -o $(CONFIG)/obj/pcre.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/deps/pcre/pcre.c

$(CONFIG)/bin/libpcre.out: \
    $(CONFIG)/inc/pcre.h \
    $(CONFIG)/obj/pcre.o
	$(CC) -r -o $(CONFIG)/bin/libpcre.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/pcre.o 

$(CONFIG)/inc/http.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/deps/http/http.h" "vxworks-x86-default/inc/http.h"

$(CONFIG)/obj/httpLib.o: \
    src/deps/http/httpLib.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/http.h \
    $(CONFIG)/inc/mpr.h
	$(CC) -c -o $(CONFIG)/obj/httpLib.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/deps/http/httpLib.c

$(CONFIG)/bin/libhttp.out: \
    $(CONFIG)/bin/libmpr.out \
    $(CONFIG)/bin/libpcre.out \
    $(CONFIG)/inc/http.h \
    $(CONFIG)/obj/httpLib.o
	$(CC) -r -o $(CONFIG)/bin/libhttp.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/httpLib.o 

$(CONFIG)/obj/http.o: \
    src/deps/http/http.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/http.h
	$(CC) -c -o $(CONFIG)/obj/http.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/deps/http/http.c

$(CONFIG)/bin/http.out: \
    $(CONFIG)/bin/libhttp.out \
    $(CONFIG)/obj/http.o
	$(CC) -o $(CONFIG)/bin/http.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/http.o $(LDFLAGS)

$(CONFIG)/inc/sqlite3.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/deps/sqlite/sqlite3.h" "vxworks-x86-default/inc/sqlite3.h"

$(CONFIG)/obj/sqlite3.o: \
    src/deps/sqlite/sqlite3.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/sqlite3.h
	$(CC) -c -o $(CONFIG)/obj/sqlite3.o -fno-builtin -fno-defer-pop -fvolatile $(DFLAGS) $(IFLAGS) src/deps/sqlite/sqlite3.c

$(CONFIG)/bin/libsqlite3.out: \
    $(CONFIG)/inc/sqlite3.h \
    $(CONFIG)/obj/sqlite3.o
	$(CC) -r -o $(CONFIG)/bin/libsqlite3.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/sqlite3.o 

$(CONFIG)/obj/sqlite.o: \
    src/deps/sqlite/sqlite.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/sqlite3.h
	$(CC) -c -o $(CONFIG)/obj/sqlite.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/deps/sqlite/sqlite.c

$(CONFIG)/bin/sqlite.out: \
    $(CONFIG)/bin/libsqlite3.out \
    $(CONFIG)/obj/sqlite.o
	$(CC) -o $(CONFIG)/bin/sqlite.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/sqlite.o $(LDFLAGS)

$(CONFIG)/inc/zlib.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/deps/zlib/zlib.h" "vxworks-x86-default/inc/zlib.h"

$(CONFIG)/obj/zlib.o: \
    src/deps/zlib/zlib.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/zlib.h
	$(CC) -c -o $(CONFIG)/obj/zlib.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/deps/zlib/zlib.c

$(CONFIG)/bin/libzlib.out: \
    $(CONFIG)/inc/zlib.h \
    $(CONFIG)/obj/zlib.o
	$(CC) -r -o $(CONFIG)/bin/libzlib.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/zlib.o 

$(CONFIG)/inc/ejs.cache.local.slots.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/slots/ejs.cache.local.slots.h" "vxworks-x86-default/inc/ejs.cache.local.slots.h"

$(CONFIG)/inc/ejs.db.sqlite.slots.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/slots/ejs.db.sqlite.slots.h" "vxworks-x86-default/inc/ejs.db.sqlite.slots.h"

$(CONFIG)/inc/ejs.slots.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/slots/ejs.slots.h" "vxworks-x86-default/inc/ejs.slots.h"

$(CONFIG)/inc/ejs.web.slots.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/slots/ejs.web.slots.h" "vxworks-x86-default/inc/ejs.web.slots.h"

$(CONFIG)/inc/ejs.zlib.slots.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/slots/ejs.zlib.slots.h" "vxworks-x86-default/inc/ejs.zlib.slots.h"

$(CONFIG)/inc/ejsByteCode.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/ejsByteCode.h" "vxworks-x86-default/inc/ejsByteCode.h"

$(CONFIG)/inc/ejsByteCodeTable.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/ejsByteCodeTable.h" "vxworks-x86-default/inc/ejsByteCodeTable.h"

$(CONFIG)/inc/ejsCustomize.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/ejsCustomize.h" "vxworks-x86-default/inc/ejsCustomize.h"

$(CONFIG)/inc/ejs.h: \
    $(CONFIG)/inc/mpr.h \
    $(CONFIG)/inc/http.h \
    $(CONFIG)/inc/ejsByteCode.h \
    $(CONFIG)/inc/ejsByteCodeTable.h \
    $(CONFIG)/inc/ejs.slots.h \
    $(CONFIG)/inc/ejsCustomize.h
	mkdir -p "vxworks-x86-default/inc"
	cp "src/ejs.h" "vxworks-x86-default/inc/ejs.h"

$(CONFIG)/inc/ejsCompiler.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/ejsCompiler.h" "vxworks-x86-default/inc/ejsCompiler.h"

$(CONFIG)/obj/ecAst.o: \
    src/compiler/ecAst.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejsCompiler.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ecAst.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/compiler/ecAst.c

$(CONFIG)/obj/ecCodeGen.o: \
    src/compiler/ecCodeGen.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejsCompiler.h
	$(CC) -c -o $(CONFIG)/obj/ecCodeGen.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/compiler/ecCodeGen.c

$(CONFIG)/obj/ecCompiler.o: \
    src/compiler/ecCompiler.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejsCompiler.h
	$(CC) -c -o $(CONFIG)/obj/ecCompiler.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/compiler/ecCompiler.c

$(CONFIG)/obj/ecLex.o: \
    src/compiler/ecLex.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejsCompiler.h
	$(CC) -c -o $(CONFIG)/obj/ecLex.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/compiler/ecLex.c

$(CONFIG)/obj/ecModuleWrite.o: \
    src/compiler/ecModuleWrite.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejsCompiler.h
	$(CC) -c -o $(CONFIG)/obj/ecModuleWrite.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/compiler/ecModuleWrite.c

$(CONFIG)/obj/ecParser.o: \
    src/compiler/ecParser.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejsCompiler.h
	$(CC) -c -o $(CONFIG)/obj/ecParser.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/compiler/ecParser.c

$(CONFIG)/obj/ecState.o: \
    src/compiler/ecState.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejsCompiler.h
	$(CC) -c -o $(CONFIG)/obj/ecState.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/compiler/ecState.c

$(CONFIG)/obj/dtoa.o: \
    src/core/src/dtoa.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/mpr.h
	$(CC) -c -o $(CONFIG)/obj/dtoa.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/dtoa.c

$(CONFIG)/obj/ejsApp.o: \
    src/core/src/ejsApp.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsApp.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsApp.c

$(CONFIG)/obj/ejsArray.o: \
    src/core/src/ejsArray.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsArray.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsArray.c

$(CONFIG)/obj/ejsBlock.o: \
    src/core/src/ejsBlock.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsBlock.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsBlock.c

$(CONFIG)/obj/ejsBoolean.o: \
    src/core/src/ejsBoolean.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsBoolean.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsBoolean.c

$(CONFIG)/obj/ejsByteArray.o: \
    src/core/src/ejsByteArray.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsByteArray.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsByteArray.c

$(CONFIG)/obj/ejsCache.o: \
    src/core/src/ejsCache.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsCache.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsCache.c

$(CONFIG)/obj/ejsCmd.o: \
    src/core/src/ejsCmd.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsCmd.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsCmd.c

$(CONFIG)/obj/ejsConfig.o: \
    src/core/src/ejsConfig.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsConfig.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsConfig.c

$(CONFIG)/obj/ejsDate.o: \
    src/core/src/ejsDate.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsDate.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsDate.c

$(CONFIG)/obj/ejsDebug.o: \
    src/core/src/ejsDebug.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsDebug.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsDebug.c

$(CONFIG)/obj/ejsError.o: \
    src/core/src/ejsError.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsError.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsError.c

$(CONFIG)/obj/ejsFile.o: \
    src/core/src/ejsFile.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsFile.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsFile.c

$(CONFIG)/obj/ejsFileSystem.o: \
    src/core/src/ejsFileSystem.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsFileSystem.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsFileSystem.c

$(CONFIG)/obj/ejsFrame.o: \
    src/core/src/ejsFrame.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsFrame.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsFrame.c

$(CONFIG)/obj/ejsFunction.o: \
    src/core/src/ejsFunction.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsFunction.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsFunction.c

$(CONFIG)/obj/ejsGC.o: \
    src/core/src/ejsGC.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsGC.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsGC.c

$(CONFIG)/obj/ejsGlobal.o: \
    src/core/src/ejsGlobal.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsGlobal.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsGlobal.c

$(CONFIG)/obj/ejsHttp.o: \
    src/core/src/ejsHttp.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsHttp.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsHttp.c

$(CONFIG)/obj/ejsIterator.o: \
    src/core/src/ejsIterator.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsIterator.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsIterator.c

$(CONFIG)/obj/ejsJSON.o: \
    src/core/src/ejsJSON.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsJSON.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsJSON.c

$(CONFIG)/obj/ejsLocalCache.o: \
    src/core/src/ejsLocalCache.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsLocalCache.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsLocalCache.c

$(CONFIG)/obj/ejsMath.o: \
    src/core/src/ejsMath.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsMath.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsMath.c

$(CONFIG)/obj/ejsMemory.o: \
    src/core/src/ejsMemory.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsMemory.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsMemory.c

$(CONFIG)/obj/ejsMprLog.o: \
    src/core/src/ejsMprLog.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsMprLog.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsMprLog.c

$(CONFIG)/obj/ejsNamespace.o: \
    src/core/src/ejsNamespace.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsNamespace.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsNamespace.c

$(CONFIG)/obj/ejsNull.o: \
    src/core/src/ejsNull.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsNull.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsNull.c

$(CONFIG)/obj/ejsNumber.o: \
    src/core/src/ejsNumber.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsNumber.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsNumber.c

$(CONFIG)/obj/ejsObject.o: \
    src/core/src/ejsObject.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsObject.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsObject.c

$(CONFIG)/obj/ejsPath.o: \
    src/core/src/ejsPath.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h \
    $(CONFIG)/inc/pcre.h
	$(CC) -c -o $(CONFIG)/obj/ejsPath.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsPath.c

$(CONFIG)/obj/ejsPot.o: \
    src/core/src/ejsPot.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsPot.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsPot.c

$(CONFIG)/obj/ejsRegExp.o: \
    src/core/src/ejsRegExp.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h \
    $(CONFIG)/inc/pcre.h
	$(CC) -c -o $(CONFIG)/obj/ejsRegExp.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsRegExp.c

$(CONFIG)/obj/ejsSocket.o: \
    src/core/src/ejsSocket.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsSocket.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsSocket.c

$(CONFIG)/obj/ejsString.o: \
    src/core/src/ejsString.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h \
    $(CONFIG)/inc/pcre.h
	$(CC) -c -o $(CONFIG)/obj/ejsString.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsString.c

$(CONFIG)/obj/ejsSystem.o: \
    src/core/src/ejsSystem.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsSystem.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsSystem.c

$(CONFIG)/obj/ejsTimer.o: \
    src/core/src/ejsTimer.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsTimer.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsTimer.c

$(CONFIG)/obj/ejsType.o: \
    src/core/src/ejsType.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsType.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsType.c

$(CONFIG)/obj/ejsUri.o: \
    src/core/src/ejsUri.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsUri.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsUri.c

$(CONFIG)/obj/ejsVoid.o: \
    src/core/src/ejsVoid.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsVoid.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsVoid.c

$(CONFIG)/obj/ejsWebSocket.o: \
    src/core/src/ejsWebSocket.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsWebSocket.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsWebSocket.c

$(CONFIG)/obj/ejsWorker.o: \
    src/core/src/ejsWorker.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsWorker.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsWorker.c

$(CONFIG)/obj/ejsXML.o: \
    src/core/src/ejsXML.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsXML.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsXML.c

$(CONFIG)/obj/ejsXMLList.o: \
    src/core/src/ejsXMLList.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsXMLList.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsXMLList.c

$(CONFIG)/obj/ejsXMLLoader.o: \
    src/core/src/ejsXMLLoader.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsXMLLoader.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/core/src/ejsXMLLoader.c

$(CONFIG)/obj/ejsByteCode.o: \
    src/vm/ejsByteCode.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsByteCode.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/vm/ejsByteCode.c

$(CONFIG)/obj/ejsException.o: \
    src/vm/ejsException.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsException.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/vm/ejsException.c

$(CONFIG)/obj/ejsHelper.o: \
    src/vm/ejsHelper.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsHelper.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/vm/ejsHelper.c

$(CONFIG)/obj/ejsInterp.o: \
    src/vm/ejsInterp.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsInterp.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/vm/ejsInterp.c

$(CONFIG)/obj/ejsLoader.o: \
    src/vm/ejsLoader.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsLoader.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/vm/ejsLoader.c

$(CONFIG)/obj/ejsModule.o: \
    src/vm/ejsModule.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsModule.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/vm/ejsModule.c

$(CONFIG)/obj/ejsScope.o: \
    src/vm/ejsScope.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsScope.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/vm/ejsScope.c

$(CONFIG)/obj/ejsService.o: \
    src/vm/ejsService.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsService.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/vm/ejsService.c

$(CONFIG)/bin/libejs.out: \
    $(CONFIG)/bin/libhttp.out \
    $(CONFIG)/inc/ejs.cache.local.slots.h \
    $(CONFIG)/inc/ejs.db.sqlite.slots.h \
    $(CONFIG)/inc/ejs.slots.h \
    $(CONFIG)/inc/ejs.web.slots.h \
    $(CONFIG)/inc/ejs.zlib.slots.h \
    $(CONFIG)/inc/bitos.h \
    $(CONFIG)/inc/ejs.h \
    $(CONFIG)/inc/ejsByteCode.h \
    $(CONFIG)/inc/ejsByteCodeTable.h \
    $(CONFIG)/inc/ejsCompiler.h \
    $(CONFIG)/inc/ejsCustomize.h \
    $(CONFIG)/obj/ecAst.o \
    $(CONFIG)/obj/ecCodeGen.o \
    $(CONFIG)/obj/ecCompiler.o \
    $(CONFIG)/obj/ecLex.o \
    $(CONFIG)/obj/ecModuleWrite.o \
    $(CONFIG)/obj/ecParser.o \
    $(CONFIG)/obj/ecState.o \
    $(CONFIG)/obj/dtoa.o \
    $(CONFIG)/obj/ejsApp.o \
    $(CONFIG)/obj/ejsArray.o \
    $(CONFIG)/obj/ejsBlock.o \
    $(CONFIG)/obj/ejsBoolean.o \
    $(CONFIG)/obj/ejsByteArray.o \
    $(CONFIG)/obj/ejsCache.o \
    $(CONFIG)/obj/ejsCmd.o \
    $(CONFIG)/obj/ejsConfig.o \
    $(CONFIG)/obj/ejsDate.o \
    $(CONFIG)/obj/ejsDebug.o \
    $(CONFIG)/obj/ejsError.o \
    $(CONFIG)/obj/ejsFile.o \
    $(CONFIG)/obj/ejsFileSystem.o \
    $(CONFIG)/obj/ejsFrame.o \
    $(CONFIG)/obj/ejsFunction.o \
    $(CONFIG)/obj/ejsGC.o \
    $(CONFIG)/obj/ejsGlobal.o \
    $(CONFIG)/obj/ejsHttp.o \
    $(CONFIG)/obj/ejsIterator.o \
    $(CONFIG)/obj/ejsJSON.o \
    $(CONFIG)/obj/ejsLocalCache.o \
    $(CONFIG)/obj/ejsMath.o \
    $(CONFIG)/obj/ejsMemory.o \
    $(CONFIG)/obj/ejsMprLog.o \
    $(CONFIG)/obj/ejsNamespace.o \
    $(CONFIG)/obj/ejsNull.o \
    $(CONFIG)/obj/ejsNumber.o \
    $(CONFIG)/obj/ejsObject.o \
    $(CONFIG)/obj/ejsPath.o \
    $(CONFIG)/obj/ejsPot.o \
    $(CONFIG)/obj/ejsRegExp.o \
    $(CONFIG)/obj/ejsSocket.o \
    $(CONFIG)/obj/ejsString.o \
    $(CONFIG)/obj/ejsSystem.o \
    $(CONFIG)/obj/ejsTimer.o \
    $(CONFIG)/obj/ejsType.o \
    $(CONFIG)/obj/ejsUri.o \
    $(CONFIG)/obj/ejsVoid.o \
    $(CONFIG)/obj/ejsWebSocket.o \
    $(CONFIG)/obj/ejsWorker.o \
    $(CONFIG)/obj/ejsXML.o \
    $(CONFIG)/obj/ejsXMLList.o \
    $(CONFIG)/obj/ejsXMLLoader.o \
    $(CONFIG)/obj/ejsByteCode.o \
    $(CONFIG)/obj/ejsException.o \
    $(CONFIG)/obj/ejsHelper.o \
    $(CONFIG)/obj/ejsInterp.o \
    $(CONFIG)/obj/ejsLoader.o \
    $(CONFIG)/obj/ejsModule.o \
    $(CONFIG)/obj/ejsScope.o \
    $(CONFIG)/obj/ejsService.o
	$(CC) -r -o $(CONFIG)/bin/libejs.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/ecAst.o $(CONFIG)/obj/ecCodeGen.o $(CONFIG)/obj/ecCompiler.o $(CONFIG)/obj/ecLex.o $(CONFIG)/obj/ecModuleWrite.o $(CONFIG)/obj/ecParser.o $(CONFIG)/obj/ecState.o $(CONFIG)/obj/dtoa.o $(CONFIG)/obj/ejsApp.o $(CONFIG)/obj/ejsArray.o $(CONFIG)/obj/ejsBlock.o $(CONFIG)/obj/ejsBoolean.o $(CONFIG)/obj/ejsByteArray.o $(CONFIG)/obj/ejsCache.o $(CONFIG)/obj/ejsCmd.o $(CONFIG)/obj/ejsConfig.o $(CONFIG)/obj/ejsDate.o $(CONFIG)/obj/ejsDebug.o $(CONFIG)/obj/ejsError.o $(CONFIG)/obj/ejsFile.o $(CONFIG)/obj/ejsFileSystem.o $(CONFIG)/obj/ejsFrame.o $(CONFIG)/obj/ejsFunction.o $(CONFIG)/obj/ejsGC.o $(CONFIG)/obj/ejsGlobal.o $(CONFIG)/obj/ejsHttp.o $(CONFIG)/obj/ejsIterator.o $(CONFIG)/obj/ejsJSON.o $(CONFIG)/obj/ejsLocalCache.o $(CONFIG)/obj/ejsMath.o $(CONFIG)/obj/ejsMemory.o $(CONFIG)/obj/ejsMprLog.o $(CONFIG)/obj/ejsNamespace.o $(CONFIG)/obj/ejsNull.o $(CONFIG)/obj/ejsNumber.o $(CONFIG)/obj/ejsObject.o $(CONFIG)/obj/ejsPath.o $(CONFIG)/obj/ejsPot.o $(CONFIG)/obj/ejsRegExp.o $(CONFIG)/obj/ejsSocket.o $(CONFIG)/obj/ejsString.o $(CONFIG)/obj/ejsSystem.o $(CONFIG)/obj/ejsTimer.o $(CONFIG)/obj/ejsType.o $(CONFIG)/obj/ejsUri.o $(CONFIG)/obj/ejsVoid.o $(CONFIG)/obj/ejsWebSocket.o $(CONFIG)/obj/ejsWorker.o $(CONFIG)/obj/ejsXML.o $(CONFIG)/obj/ejsXMLList.o $(CONFIG)/obj/ejsXMLLoader.o $(CONFIG)/obj/ejsByteCode.o $(CONFIG)/obj/ejsException.o $(CONFIG)/obj/ejsHelper.o $(CONFIG)/obj/ejsInterp.o $(CONFIG)/obj/ejsLoader.o $(CONFIG)/obj/ejsModule.o $(CONFIG)/obj/ejsScope.o $(CONFIG)/obj/ejsService.o 

$(CONFIG)/obj/ejs.o: \
    src/cmd/ejs.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejsCompiler.h
	$(CC) -c -o $(CONFIG)/obj/ejs.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/cmd/ejs.c

$(CONFIG)/bin/ejs.out: \
    $(CONFIG)/bin/libejs.out \
    $(CONFIG)/obj/ejs.o
	$(CC) -o $(CONFIG)/bin/ejs.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/ejs.o $(LDFLAGS)

$(CONFIG)/obj/ejsc.o: \
    src/cmd/ejsc.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejsCompiler.h
	$(CC) -c -o $(CONFIG)/obj/ejsc.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/cmd/ejsc.c

$(CONFIG)/bin/ejsc.out: \
    $(CONFIG)/bin/libejs.out \
    $(CONFIG)/obj/ejsc.o
	$(CC) -o $(CONFIG)/bin/ejsc.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/ejsc.o $(LDFLAGS)

src/cmd/ejsmod.h: 

$(CONFIG)/obj/ejsmod.o: \
    src/cmd/ejsmod.c\
    $(CONFIG)/inc/bit.h \
    src/cmd/ejsmod.h \
    $(CONFIG)/inc/ejs.h
	$(CC) -c -o $(CONFIG)/obj/ejsmod.o $(CFLAGS) $(DFLAGS) $(IFLAGS) -Isrc/cmd src/cmd/ejsmod.c

$(CONFIG)/obj/doc.o: \
    src/cmd/doc.c\
    $(CONFIG)/inc/bit.h \
    src/cmd/ejsmod.h
	$(CC) -c -o $(CONFIG)/obj/doc.o $(CFLAGS) $(DFLAGS) $(IFLAGS) -Isrc/cmd src/cmd/doc.c

$(CONFIG)/obj/docFiles.o: \
    src/cmd/docFiles.c\
    $(CONFIG)/inc/bit.h \
    src/cmd/ejsmod.h
	$(CC) -c -o $(CONFIG)/obj/docFiles.o $(CFLAGS) $(DFLAGS) $(IFLAGS) -Isrc/cmd src/cmd/docFiles.c

$(CONFIG)/obj/listing.o: \
    src/cmd/listing.c\
    $(CONFIG)/inc/bit.h \
    src/cmd/ejsmod.h \
    $(CONFIG)/inc/ejsByteCodeTable.h
	$(CC) -c -o $(CONFIG)/obj/listing.o $(CFLAGS) $(DFLAGS) $(IFLAGS) -Isrc/cmd src/cmd/listing.c

$(CONFIG)/obj/slotGen.o: \
    src/cmd/slotGen.c\
    $(CONFIG)/inc/bit.h \
    src/cmd/ejsmod.h
	$(CC) -c -o $(CONFIG)/obj/slotGen.o $(CFLAGS) $(DFLAGS) $(IFLAGS) -Isrc/cmd src/cmd/slotGen.c

$(CONFIG)/bin/ejsmod.out: \
    $(CONFIG)/bin/libejs.out \
    $(CONFIG)/obj/ejsmod.o \
    $(CONFIG)/obj/doc.o \
    $(CONFIG)/obj/docFiles.o \
    $(CONFIG)/obj/listing.o \
    $(CONFIG)/obj/slotGen.o
	$(CC) -o $(CONFIG)/bin/ejsmod.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/ejsmod.o $(CONFIG)/obj/doc.o $(CONFIG)/obj/docFiles.o $(CONFIG)/obj/listing.o $(CONFIG)/obj/slotGen.o $(LDFLAGS)

$(CONFIG)/obj/ejsrun.o: \
    src/cmd/ejsrun.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejsCompiler.h
	$(CC) -c -o $(CONFIG)/obj/ejsrun.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/cmd/ejsrun.c

$(CONFIG)/bin/ejsrun.out: \
    $(CONFIG)/bin/libejs.out \
    $(CONFIG)/obj/ejsrun.o
	$(CC) -o $(CONFIG)/bin/ejsrun.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/ejsrun.o $(LDFLAGS)

$(CONFIG)/bin/ejs.mod: \
    $(CONFIG)/bin/ejsc.out \
    $(CONFIG)/bin/ejsmod.out
	cd src/core; ../../$(CONFIG)/bin/ejsc --out ../../$(CONFIG)/bin/ejs.mod  --optimize 9 --bind --require null *.es  ; cd ../..
	cd src/core; ../../$(CONFIG)/bin/ejsmod --require null --cslots ../../$(CONFIG)/bin/ejs.mod ; cd ../..
	cd src/core; if ! diff ejs.slots.h ../../$(CONFIG)/inc/ejs.slots.h >/dev/null; then cp ejs.slots.h ../../$(CONFIG)/inc; fi ; cd ../..
	cd src/core; rm -f ejs.slots.h ; cd ../..

$(CONFIG)/bin/ejs.unix.mod: \
    $(CONFIG)/bin/ejsc.out \
    $(CONFIG)/bin/ejs.mod
	cd src/jems/ejs.unix; ../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.unix.mod  --optimize 9 Unix.es ; cd ../../..

$(CONFIG)/bin/jem.es: 
	cd src/jems/ejs.jem; cp jem.es ../../../$(CONFIG)/bin ; cd ../../..

$(CONFIG)/bin/jem.out: \
    $(CONFIG)/bin/libejs.out \
    $(CONFIG)/bin/jem.es \
    $(CONFIG)/obj/ejsrun.o
	$(CC) -o $(CONFIG)/bin/jem.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/ejsrun.o $(LDFLAGS)

$(CONFIG)/bin/ejs.db.mod: \
    $(CONFIG)/bin/ejsc.out \
    $(CONFIG)/bin/ejs.mod
	cd src/jems/ejs.db; ../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.db.mod  --optimize 9 *.es ; cd ../../..

$(CONFIG)/bin/ejs.db.mapper.mod: \
    $(CONFIG)/bin/ejsc.out \
    $(CONFIG)/bin/ejs.mod \
    $(CONFIG)/bin/ejs.db.mod
	cd src/jems/ejs.db.mapper; ../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.db.mapper.mod  --optimize 9 *.es ; cd ../../..

$(CONFIG)/bin/ejs.db.sqlite.mod: \
    $(CONFIG)/bin/ejsc.out \
    $(CONFIG)/bin/ejsmod.out \
    $(CONFIG)/bin/ejs.mod
	cd src/jems/ejs.db.sqlite; ../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.db.sqlite.mod  --optimize 9 *.es ; cd ../../..

$(CONFIG)/obj/ejsSqlite.o: \
    src/jems/ejs.db.sqlite/ejsSqlite.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h \
    $(CONFIG)/inc/ejs.db.sqlite.slots.h
	$(CC) -c -o $(CONFIG)/obj/ejsSqlite.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/jems/ejs.db.sqlite/ejsSqlite.c

$(CONFIG)/bin/libejs.db.sqlite.out: \
    $(CONFIG)/bin/libmpr.out \
    $(CONFIG)/bin/libejs.out \
    $(CONFIG)/bin/ejs.mod \
    $(CONFIG)/bin/ejs.db.sqlite.mod \
    $(CONFIG)/bin/libsqlite3.out \
    $(CONFIG)/obj/ejsSqlite.o
	$(CC) -r -o $(CONFIG)/bin/libejs.db.sqlite.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/ejsSqlite.o 

$(CONFIG)/bin/ejs.web.mod: \
    $(CONFIG)/bin/ejsc.out \
    $(CONFIG)/bin/ejsmod.out \
    $(CONFIG)/bin/ejs.mod
	cd src/jems/ejs.web; ../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.web.mod  --optimize 9 *.es ; cd ../../..
	cd src/jems/ejs.web; ../../../$(CONFIG)/bin/ejsmod --cslots ../../../$(CONFIG)/bin/ejs.web.mod ; cd ../../..
	cd src/jems/ejs.web; if ! diff ejs.web.slots.h ../../../$(CONFIG)/inc/ejs.web.slots.h >/dev/null; then cp ejs.web.slots.h ../../../$(CONFIG)/inc; fi ; cd ../../..
	cd src/jems/ejs.web; rm -f ejs.web.slots.h ; cd ../../..

$(CONFIG)/inc/ejsWeb.h: 
	mkdir -p "vxworks-x86-default/inc"
	cp "src/jems/ejs.web/ejsWeb.h" "vxworks-x86-default/inc/ejsWeb.h"

$(CONFIG)/obj/ejsHttpServer.o: \
    src/jems/ejs.web/ejsHttpServer.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h \
    $(CONFIG)/inc/ejsCompiler.h \
    $(CONFIG)/inc/ejsWeb.h \
    $(CONFIG)/inc/ejs.web.slots.h \
    $(CONFIG)/inc/http.h
	$(CC) -c -o $(CONFIG)/obj/ejsHttpServer.o $(CFLAGS) $(DFLAGS) $(IFLAGS) -Isrc/jems/ejs.web/src src/jems/ejs.web/ejsHttpServer.c

$(CONFIG)/obj/ejsRequest.o: \
    src/jems/ejs.web/ejsRequest.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h \
    $(CONFIG)/inc/ejsCompiler.h \
    $(CONFIG)/inc/ejsWeb.h \
    $(CONFIG)/inc/ejs.web.slots.h
	$(CC) -c -o $(CONFIG)/obj/ejsRequest.o $(CFLAGS) $(DFLAGS) $(IFLAGS) -Isrc/jems/ejs.web/src src/jems/ejs.web/ejsRequest.c

$(CONFIG)/obj/ejsSession.o: \
    src/jems/ejs.web/ejsSession.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h \
    $(CONFIG)/inc/ejsWeb.h
	$(CC) -c -o $(CONFIG)/obj/ejsSession.o $(CFLAGS) $(DFLAGS) $(IFLAGS) -Isrc/jems/ejs.web/src src/jems/ejs.web/ejsSession.c

$(CONFIG)/obj/ejsWeb.o: \
    src/jems/ejs.web/ejsWeb.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h \
    $(CONFIG)/inc/ejsCompiler.h \
    $(CONFIG)/inc/ejsWeb.h \
    $(CONFIG)/inc/ejs.web.slots.h
	$(CC) -c -o $(CONFIG)/obj/ejsWeb.o $(CFLAGS) $(DFLAGS) $(IFLAGS) -Isrc/jems/ejs.web/src src/jems/ejs.web/ejsWeb.c

$(CONFIG)/bin/libejs.web.out: \
    $(CONFIG)/bin/libejs.out \
    $(CONFIG)/bin/ejs.mod \
    $(CONFIG)/inc/ejsWeb.h \
    $(CONFIG)/obj/ejsHttpServer.o \
    $(CONFIG)/obj/ejsRequest.o \
    $(CONFIG)/obj/ejsSession.o \
    $(CONFIG)/obj/ejsWeb.o
	$(CC) -r -o $(CONFIG)/bin/libejs.web.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/ejsHttpServer.o $(CONFIG)/obj/ejsRequest.o $(CONFIG)/obj/ejsSession.o $(CONFIG)/obj/ejsWeb.o 

$(CONFIG)/bin/www: 
	cd src/jems/ejs.web; rm -fr ../../../$(CONFIG)/bin/www ; cd ../../..
	cd src/jems/ejs.web; cp -r www ../../../$(CONFIG)/bin ; cd ../../..

$(CONFIG)/bin/ejs.template.mod: \
    $(CONFIG)/bin/ejsc.out \
    $(CONFIG)/bin/ejs.mod
	cd src/jems/ejs.template; ../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.template.mod  --optimize 9 TemplateParser.es ; cd ../../..

$(CONFIG)/bin/ejs.zlib.mod: \
    $(CONFIG)/bin/ejsc.out \
    $(CONFIG)/bin/ejs.mod
	cd src/jems/ejs.zlib; ../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.zlib.mod  --optimize 9 *.es ; cd ../../..

$(CONFIG)/obj/ejsZlib.o: \
    src/jems/ejs.zlib/ejsZlib.c\
    $(CONFIG)/inc/bit.h \
    $(CONFIG)/inc/ejs.h \
    $(CONFIG)/inc/zlib.h \
    $(CONFIG)/inc/ejs.zlib.slots.h
	$(CC) -c -o $(CONFIG)/obj/ejsZlib.o $(CFLAGS) $(DFLAGS) $(IFLAGS) src/jems/ejs.zlib/ejsZlib.c

$(CONFIG)/bin/libejs.zlib.out: \
    $(CONFIG)/bin/libejs.out \
    $(CONFIG)/bin/ejs.mod \
    $(CONFIG)/bin/ejs.zlib.mod \
    $(CONFIG)/bin/libzlib.out \
    $(CONFIG)/obj/ejsZlib.o
	$(CC) -r -o $(CONFIG)/bin/libejs.zlib.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/ejsZlib.o 

$(CONFIG)/bin/ejs.tar.mod: \
    $(CONFIG)/bin/ejsc.out \
    $(CONFIG)/bin/ejs.mod
	cd src/jems/ejs.tar; ../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.tar.mod  --optimize 9 *.es ; cd ../../..

$(CONFIG)/bin/mvc.es: 
	cd src/jems/ejs.mvc; cp mvc.es ../../../$(CONFIG)/bin ; cd ../../..

$(CONFIG)/bin/mvc.out: \
    $(CONFIG)/bin/libejs.out \
    $(CONFIG)/bin/mvc.es \
    $(CONFIG)/obj/ejsrun.o
	$(CC) -o $(CONFIG)/bin/mvc.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/ejsrun.o $(LDFLAGS)

$(CONFIG)/bin/ejs.mvc.mod: \
    $(CONFIG)/bin/ejsc.out \
    $(CONFIG)/bin/ejs.mod \
    $(CONFIG)/bin/ejs.web.mod \
    $(CONFIG)/bin/ejs.template.mod \
    $(CONFIG)/bin/ejs.unix.mod
	cd src/jems/ejs.mvc; ../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.mvc.mod  --optimize 9 *.es ; cd ../../..

$(CONFIG)/bin/utest.es: 
	cd src/jems/ejs.utest; cp utest.es ../../../$(CONFIG)/bin ; cd ../../..

$(CONFIG)/bin/utest.worker: 
	cd src/jems/ejs.utest; cp utest.worker ../../../$(CONFIG)/bin ; cd ../../..

$(CONFIG)/bin/utest.out: \
    $(CONFIG)/bin/libejs.out \
    $(CONFIG)/bin/utest.es \
    $(CONFIG)/bin/utest.worker \
    $(CONFIG)/obj/ejsrun.o
	$(CC) -o $(CONFIG)/bin/utest.out $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/ejsrun.o $(LDFLAGS)

version: 
	@echo 2.3.0-1

stop: 
	

installBinary: stop


start: 
	

install: stop installBinary start
	

uninstall: stop



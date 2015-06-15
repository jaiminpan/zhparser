# contrib/zh_parser/Makefile

MODULE_big = zhparser
OBJS = zhparser.o \
		charset.o crc32.o pool.o scws.o xdict.o darray.o rule.o lock.o xdb.o xtree.o

EXTENSION = zhparser
DATA = zhparser--1.0.sql zhparser--unpackaged--1.0.sql
DATA_TSEARCH = dict.utf8.xdb rules.utf8.ini

REGRESS = zhparser

PG_CPPFLAGS = -DHAVE_STRUCT_FLOCK -DHAVE_FLOCK

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/zhparser
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif

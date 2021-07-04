# Copyright (c) 2015-2019, Ulf Magnusson
# SPDX-License-Identifier: ISC

ifeq ($(origin CC), default)
  CC = gcc
endif

CFLAGS ?= -g -Og
override CFLAGS += $(shell pkg-config --cflags ncursesw) \
                   -std=gnu11 \
                   -Wall \
                   -Wextra \
                   -Wmissing-declarations \
                   -Wno-sign-compare \
                   -Wno-unused-parameter \
                   -Wredundant-decls \
                   -Wstrict-prototypes

override LDLIBS += -lreadline \
		   -lpthread \
                   $(shell pkg-config --libs-only-l ncursesw)

override LDFLAGS += $(shell pkg-config --libs-only-L --libs-only-other ncursesw)

attach: attach.c

.PHONY: clean
clean:
	$(RM) attach

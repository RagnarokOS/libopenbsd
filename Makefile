# $Ragnarok: Makefile,v 1.17 2025/01/24 16:36:48 lecorbeau Exp $

CFLAGS		?= -O2 -pipe
CFLAGS		+= -I.
CPPFLAGS	+=
LDFLAGS		+=

LIB	 = libopenbsd.a
OBJS	 = basename.o dirname.o e_log.o e_log10.o e_pow.o e_sqrt.o errc.o fgetln.o fmt_scaled.o \
	   getbsize.o getopt_long.o ldexp.o ohash.o pwd.o reallocarray.o recallocarray.o s_fabs.o \
	   s_scalbn.o setmode.o strlcat.o strlcpy.o strtonum.o strmode.o verrc.o vwarnc.o warnc.o
HEADERS	= math_private.h ohash.h openbsd.h

all: ${OBJS}
	${AR} cr ${LIB} ${OBJS}
	ranlib ${LIB}

install:
	install -d -m 755 -g 0 -o root ${DESTDIR}/usr/lib/libopenbsd
	install -m 755 -g 0 -o root ${LIB} ${DESTDIR}/usr/lib/libopenbsd
	install -m 755 -g 0 -o root ${HEADERS} ${DESTDIR}/usr/lib/libopenbsd

clean:
	rm -f ${LIB} ${OBJS}

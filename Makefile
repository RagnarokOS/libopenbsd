# $Ragnarok: Makefile,v 1.16 2025/01/21 00:34:15 lecorbeau Exp $

include ${TOPDIR}/usr/share/mk/libs.mk

# For the .deb package
PKG	= libopenbsd
VERSION	= 02
PKGDIR	= ${PKG}_${VERSION}_amd64

CFLAGS	?= ${O_FLAG} -pipe ${HARDENING_CPPFLAGS} ${HARDENING_CFLAGS}
CFLAGS	+= -I.
LDFLAGS += ${HARDENING_LDFLAGS}

LIB	 = libopenbsd.a
OBJS	 = basename.o dirname.o e_log.o e_log10.o e_pow.o e_sqrt.o errc.o fgetln.o fmt_scaled.o \
	   getbsize.o getopt_long.o ldexp.o ohash.o pwd.o reallocarray.o recallocarray.o s_fabs.o \
	   s_scalbn.o strlcat.o strlcpy.o strtonum.o strmode.o verrc.o vwarnc.o warnc.o
HEADERS	= math_private.h ohash.h openbsd.h

all: ${OBJS}
	${AR} cr ${LIB} ${OBJS}
	ranlib ${LIB}

install:
	install -d -m 755 -g 0 -o root ${DESTDIR}/lib/libopenbsd
	install -m 755 -g 0 -o root ${LIB} ${DESTDIR}/lib/libopenbsd
	install -m 755 -g 0 -o root ${HEADERS} ${DESTDIR}/lib/libopenbsd

deb: all
	mkdir -p ${PKGDIR}
	cp -r DEBIAN/ ${PKGDIR}/
	install -d ${PKGDIR}/lib/libopenbsd
	install ${LIB} ${PKGDIR}/lib/libopenbsd
	install ${HEADERS} ${PKGDIR}/lib/libopenbsd
	/usr/bin/dpkg-deb -b ${PKGDIR} . 2>&1 | tee ${PKG}_${VERSION}.build

clean:
	rm -f ${LIB} ${OBJS}

distclean: clean
	rm -rf ${PKGDIR} ${PKG}_${VERSION}.build

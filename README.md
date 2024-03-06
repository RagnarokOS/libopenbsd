# libopenbsd

Static library containing OpenBSD functions. Used in Ragnarok to compile
some OpenBSD software.

This would have been impossible without Ibara's [baseutils](https://github.com/ibara/baseutils)
repository.

## Building

*Note: I'm not wasting time building a full library deb package for
something this simple. Instead, dpkg-deb -b is used.*

Building a deb package is as simple as running (as a regular user):
`make DESTDIR=libopenbsd_$VERSION deb`, substituting *$VERSION* for
the package version.

Building on non-Ragnarok systems is done the usual way, but will
require the [libs.mk](https://raw.githubusercontent.com/RagnarokOS/src/master/usr/share/mk/libs.mk)
file installed to `/usr/share/mk/`. 

```
    $ make
    # make install
```

####################################
# make the VERSION
VERSION: stamp-h1
	@if test -f "$(top_srcdir)/build-aux/VERSION" ; \
	then \
		echo Creating VERSION && \
		( cd "$(top_srcdir)" && \
		  echo '# Generated by Makefile. Do not edit.'; echo; \
		  ./build-aux/missing --run cat "$(top_srcdir)/build-aux/VERSION" ) > $(top_builddir)/VERSION.tmp \
		&& mv -f $(top_builddir)/VERSION.tmp $(top_builddir)/VERSION \
		|| ( rm -f $(top_builddir)/VERSION.tmp ; \
		     echo Failed to generate VERSION >&2 ); \
	else \
		echo A Version file in  "$(top_srcdir)/build-aux is required to generate a VERSION" >&2; \
		echo "empty" > $(top_builddir)/VERSION ; \
	fi

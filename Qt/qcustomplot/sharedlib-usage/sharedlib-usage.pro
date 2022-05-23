#
# Example project that uses QCustomPlot as a shared library
#
# The compiled shared library file(s) must be in the project directory.
# On Unix, set LD_LIBRARY_PATH to "." before launching the compiled application
# unless the library files are installed in one of the library locations (e.g. /usr/lib)
#
# Note that the qcustomplot.h header should not be added to the project file in the
# HEADERS variable, but only included in your source files with #include.
#


QT          += widgets printsupport

TEMPLATE    = app

DESTDIR     = "../../../Dest"

CONFIG      += c++11

TARGET      = sharedlib-usage

# Tell the qcustomplot header that it will be used as library:
DEFINES     += QCUSTOMPLOT_USE_LIBRARY

SOURCES     += main.cpp

INCLUDEPATH += ..

# Link with debug version of qcustomplot if compiling in debug mode, else with release library:
CONFIG(debug, release|debug) {
LIBS        += -L$$DESTDIR -lqcustomplotd2
} else {
LIBS        += -L$$DESTDIR -lqcustomplot2
}

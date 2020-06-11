#-------------------------------------------------
#
# Project:  QDeviceWatcher
#
#-------------------------------------------------

QT += core
CONFIG += c++14

TARGET = QDeviceWatcher
TEMPLATE = lib

DEFINES += QDEVICEWATCHER_LIBRARY

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

HEADERS += \
    QDeviceWatcher/qdevicewatcher_p.h \
    QDeviceWatcher/qdevicewatcher.h \
    qdevicewatcher_global.hpp

SOURCES += \
    QDeviceWatcher/qdevicewatcher.cpp

unix {
  macx {
    LIBS += -framework DiskArbitration -framework Foundation
    SOURCES += QDeviceWatcher/qdevicewatcher_mac.cpp
  } else {
    SOURCES += QDeviceWatcher/qdevicewatcher_linux.cpp
  }
}
win32 {
    LIBS *= -luser32
    wince* {
        SOURCES += QDeviceWatcher/qdevicewatcher_wince.cpp
    } else {
        SOURCES += QDeviceWatcher/qdevicewatcher_win32.cpp
    }
}

BUILDDIR = build
BUILDTYPE = release
CONFIG += debug_and_release

CONFIG(debug,debug|release) {
    BUILDTYPE = debug
}

DESTDIR = $$BUILDDIR/$$BUILDTYPE
OBJECTS_DIR = $$BUILDDIR/$$BUILDTYPE/.obj
MOC_DIR = $$BUILDDIR/$$BUILDTYPE/.moc
RCC_DIR = $$BUILDDIR/$$BUILDTYPE/.rcc
UI_DIR = $$BUILDDIR/$$BUILDTYPE/.ui

# Default rules for deployment.
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target

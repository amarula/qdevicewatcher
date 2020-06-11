# QDeviceWatcher

QDeviceWatcher is a Qt library that handle devices changes, USB storage add/remove events and mount events.

## Installation

Download the repository, build and install the library.

```bash
git clone https://github.com/amarula/qdevicewatcher.git
mkdir build && cd build
qmake ..
make -j4
make install
```

Alternatively the library can be build as dependency of subdir project:

```qmake
SUBDIRS = \
    QDeviceWatcher \
    ...

QDeviceWatcher.subdir = deps/QDeviceWatcher

MainApp.depends = QDeviceWatcher
```

and link the binaries:

```qmake
INCLUDEPATH += \
    deps/QDeviceWatcher

CONFIG(release, release|debug) {
    LIBS += -Ldeps/QDeviceWatcher/build/release
} else {
    LIBS += -Ldeps/QDeviceWatcher/build/debug
}

LIBS += -lQDeviceWatcher
```

## Usage

Create an instance of `QDeviceWatcher`, start the monitoring `QDeviceWatcher::start()` and attach to the device changes signals: `QDeviceWatcher::deviceAdded(const QString &dev)`, `QDeviceWatcher::deviceChanged(const QString &dev)`, `QDeviceWatcher::deviceRemoved(const QString &dev)`

## Authors
 * **Wang Bin** - *Initial work* - [wang-bin](https://github.com/wang-bin)
 * **Andrea Ricchi** - *Maintainer* - [AndreaRicchi](https://github.com/AndreaRicchi)
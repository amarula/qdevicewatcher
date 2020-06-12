TEMPLATE = subdirs

SUBDIRS = \
        QDeviceWatcher \
        App

QDeviceWatcher.subdir = ../../QDeviceWatcher
App.subdir = ./App

App.depends = QDeviceWatcher

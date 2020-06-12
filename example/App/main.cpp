#include <QDeviceWatcher/qdevicewatcher.h>

#include <QCoreApplication>
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    QDeviceWatcher watcher(&a);

    QObject::connect(&watcher, &QDeviceWatcher::deviceAdded, [](const QString &dev) {
        qDebug() << "Device added" << dev;
    });
    QObject::connect(&watcher, &QDeviceWatcher::deviceChanged, [](const QString &dev) {
        qDebug() << "Device changed" << dev;
    });
    QObject::connect(&watcher, &QDeviceWatcher::deviceRemoved, [](const QString &dev) {
        qDebug() << "Device removed" << dev;
    });
    QObject::connect(&watcher, &QDeviceWatcher::deviceMounted, [](const QString &mountPath) {
        qDebug() << "Device mounted" << mountPath;
    });
    QObject::connect(&watcher, &QDeviceWatcher::deviceMountFailed, [](const QString &dev) {
        qDebug() << "Device mount failed" << dev;
    });

    watcher.start();

    return a.exec();
}

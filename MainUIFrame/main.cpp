#include "mainwindow.h"

#include <QApplication>
#include "Core.h"
#include "SubUIFrame.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    Core core;
    core.test();

    SubUIFrame subUIFrame;
    subUIFrame.show();

    MainWindow w;
    w.show();
    return a.exec();
}

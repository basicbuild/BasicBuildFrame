#include "mainwindow.h"
#include <QLabel>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{
    resize(640, 480);
    QLabel* lbeCenter = new QLabel("This is MainUIFrame", this);
    lbeCenter->setAlignment(Qt::AlignCenter);
    setCentralWidget(lbeCenter);
}

MainWindow::~MainWindow()
{
   
}

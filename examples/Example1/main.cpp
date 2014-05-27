#include "mainwindow.h"
#include <QApplication>
#include <QTranslator>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    QTranslator translator;
    if (translator.load(":/Example1_tr_TR")) {
        a.installTranslator(&translator);
    }

    MainWindow w;
    w.show();

    return a.exec();
}

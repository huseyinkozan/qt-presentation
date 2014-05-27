#include "mainwindow.h"
#include "ui_mainwindow.h"
//#include <QMapIterator>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    connect(this, SIGNAL(signal1()), this, SLOT(slot1()));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_lineEdit_returnPressed()
{

    emit signal1();

    QString text = ui->lineEdit->text();

    ui->listWidget->addItem(text);
    ui->lineEdit->clear();

    QListWidget * lw = new QListWidget(this);


    // split the value
    QStringList l = text.trimmed().split('=');
    if (l.count() != 2) {
        return;
    }

    // sum the values
    if (m_map.keys().contains(l.first().toLower()))
        m_map[ l.first().toLower() ] += l.last().toInt();
    else
        m_map.insert(l.first().toLower(), l.last().toInt());

    // print the sum
    ui->textEdit->clear();
    QMapIterator< QString, int > it(m_map);
    while (it.hasNext()) {
        it.next();
        ui->textEdit->append(
                    tr("%1 = %2").arg(it.key()).arg(it.value())
                    );
    }
}

void MainWindow::slot1()
{
    qDebug("signal1");
}

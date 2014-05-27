#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QMap>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

signals:
    void signal1();


private slots:
    void on_lineEdit_returnPressed();

    void slot1();

private:
    Ui::MainWindow *ui;

    QMap< QString, int > m_map;
};

#endif // MAINWINDOW_H

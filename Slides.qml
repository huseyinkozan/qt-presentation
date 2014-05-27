/****************************************************************************
**
** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt 5 launch demo.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/


import QtQuick 2.0
import QtGraphicalEffects 1.0

import "QtLabsPresentation"

OpacityTransitionPresentation {

    id: presentation
    anchors.fill: parent;

    transitionTime: 500

    Component.onCompleted: {
        // fix from,to initialize bug
        fromSlide = openingSlide;
        toSlide = openingSlide;
    }




    /********************************************************************************
     *
     * Introduction
     *
     */

    Rectangle {
        id: openingSlideBlackout
        color: "black"
        anchors.fill: parent;
        Behavior on opacity { NumberAnimation { duration: 1000 } }
    }

    onCurrentSlideChanged: {
        if (currentSlide < 2)
            openingSlideBlackout.opacity = 1;
        else
            openingSlideBlackout.opacity = 0;
    }

    Slide {
        id: openingSlide
    }



    Slide {
        id: introSlide
        centeredText:
'





Hüseyin Kozan

'
        fontScale: 2
        Image {
        z: -1
            opacity: 1
            source: "image/qt-logo.png"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
            scale: 0.5
        }
        Text {
            text: "huseyinkozan"
            color: parent.textColor
            anchors.top: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            scale: 2
        }
    }

    Slide {
        title: "Qt nedir ?"
        content: [
            "Çoklu platform uygulama ve UI çatısı (Framework)",
            "Tarihçe",
            " 1991: Başlangıç, 1994: Trolltech, 1996: KDE",
            " 2008: Nokia, 2011: Qt Project, 2012: Digia",
            "Lisanslama",
            " Qt Project: GPLv3, LGPLv2.1",
            " Digia: Ticari Lisans"
        ]
    }

    Slide {
        title: "Masaüstü platformlar"
        content: [
            "Unix",
            " X11: GNU/Linux, FreeBSD, HP-UX, Solaris, AIX,...",
            " Wayland",
            " QNX",
            " VxWorks",
            "Apple OS X",
            "Microsoft Windows: XP, Vista, 7, 8, 8/RT",
        ]
    }

    Slide {
        title: "Mobil Platformlar"
        content: [
            "Android, Sailfish OS, Embedded Linux,...",
            "iOS",
            "BlackBerry 10",
            "Windows CE/Mobile/Phone 8",
        ]
    }

    VideoSlide {
        title: "Qt 5 Everywhere Demo"
        videoSource: "video/Qt5EverywhereDemo_vlc.ogg"
    }

    PhotoViewSlide {
        title: "Kullanılan Yerler"
    }

    WebkitSlide {
        title: "Kullanılan Yerler - Wikipedia"
        source: "http://en.wikipedia.org/wiki/Category:Software_that_uses_Qt"
    }

    Slide {
        title: "Programlama Dilleri"
        content: [
            "C++",
            "QML",
            "Python (binding/wrapper)",
        ]
    }

    Slide {
        title: "C++ ile kodlama"
        content: [
            "QCoreApplication: ",
            " Komut satırı işleme",
            " Olay döngüsü",
            " Olay işleme",
            "QApplication:",
            " Stil yönetimi",
            " Masaüstü bilgileri",
        ]

        CodeSection {
            text:
"#include \"mainwindow.h\"
#include <QApplication>
#include <QTranslator>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    QTranslator translator;
    if (translator.load(\":/Example1_tr_TR\")) {
        a.installTranslator(&translator);
    }

    MainWindow w;
    w.show();

    return a.exec();
}
"
        }
    }

    Slide {
        title: "Example1 - C++"
        content: [
            "İnceleyelim",
            " Qt Creator, MOC, UIC çıktıları",
            " Nasıl Çalışır",
            "Ekleme Yapalım",
            " QToolButton Add: QObject::connect()",
            " QAction Exit: on_actionExit_click()",
            " QPushButton Clear: UI'den Sinyal-Slot bağlama",
            "Türkçe Çeviri",
        ]
    }

    Slide {
        title: "QML"
        content: [
            "C++ ile entegrasyon",
            "Çizim",
            " OpenGL ES 2.0 veya OpenGL 2.0",
            " Parçacık efekti, grafik efektler, Shader efektleri, animasyon nesneleri, Anchor,...",
            " Durum, Geçiş, Animasyon",
            "Girdi: Dokunma, fare, klavye, ivme ölçer,...",
            "Dinamik nesne oluşturma, özellik ve sinyal-slot bağlama",
        ]
    }

    CodeSlide {
        title: "Example2 - QML"
        code:
"import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.0

ApplicationWindow {

    title: qsTr(\"Hello World\")

    width: 640
    height: 480

    menuBar: MenuBar {
        Menu {
            title: qsTr(\"File\")
            MenuItem {
                text: qsTr(\"Exit\")
                onTriggered: Qt.quit();
            }
        }
    }

    Button {
        text: qsTr(\"Hello World\")
        anchors.centerIn: parent
    }
}
"
    }

    WebkitSlide {
        title: "Qt4 Modülleri"
        source: "http://qt-project.org/doc/qt-4.8/modules.html"
    }

    WebkitSlide {
        title: "Qt5 Modülleri"
        source: "http://qt-project.org/doc/qt-5/modules.html"
    }

    Slide {
        title: "Geliştirme Araçları"
        content: [
            "Qt Creator",
            "Qt Designer",
            "Qt Assistant",
            "Qt Linguist, lupdate, lrelease",
            "qmake, moc, uic, rcc, ",
        ]
    }

    WebkitSlide {
        title: "Kaynaklar - Qt Project"
        source: "http://qt-project.org"
    }

    WebkitSlide {
        title: "Kaynaklar - Youtube"
        source: "http://youtube.com/user/QtStudios"
    }

    WebkitSlide {
        title: "Kaynaklar - Kitaplar"
        source: "https://qt-project.org/books"
    }

    WebkitSlide {
        title: "Kaynaklar - Tavsiye Kitap"
        source: "http://www.ics.com/designpatterns/book/index.html"
    }

    Slide {
        title: "Qt Demoları"
        content: [
            "Qt4 : qtdemo",
            "Qt5 : qt5-launch-demo"
        ]
    }

    VideoSlide {
        title: "Sorular ?"
    }

    Slide {
        title: "Bonus"
        content: [
            "http://qmlbook.org/",
            "http://code.woboq.org"
        ]
    }
}

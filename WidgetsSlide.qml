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
import Qt.labs.presentation 1.0

Slide {
    id: slide

    property int slamTime: 400;
    property int waitTime: 500;

    y: parent.height * 0.1

    SequentialAnimation {
        id: widgetAnimation
        ScriptAction { script: {
                boxesImage.opacity = 0;
                koffice.opacity = 0;
                koffice2.opacity = 0;
            }
        }
        PauseAnimation { duration: slide.waitTime }
        ParallelAnimation {
            NumberAnimation { target: boxesImage; property: "opacity"; from: 0; to: 1; duration: slide.slamTime; easing.type: Easing.OutBack }
            NumberAnimation { target: boxesImage; property: "rotation"; from: 20; to: 10; duration: slide.slamTime; easing.type: Easing.OutBack }
            NumberAnimation { target: boxesImage; property: "scale"; from: 2; to: 1.5; duration: slide.slamTime; easing.type: Easing.OutBack }
        }
        PauseAnimation { duration: slide.waitTime }
        ParallelAnimation {
            NumberAnimation { target: koffice; property: "opacity"; from: 0; to: 1; duration: slide.slamTime; easing.type: Easing.OutBack }
            NumberAnimation { target: koffice; property: "rotation"; from: -35; to: -20; duration: slide.slamTime; easing.type: Easing.OutBack}
            NumberAnimation { target: koffice; property: "scale"; from: 2; to: 1.5; duration: slide.slamTime; easing.type: Easing.OutBack }
        }
        PauseAnimation { duration: slide.waitTime }
        ParallelAnimation {
            NumberAnimation { target: koffice2; property: "opacity"; from: 0; to: 1; duration: slide.slamTime; easing.type: Easing.OutBack }
            NumberAnimation { target: koffice2; property: "rotation"; from: 35; to: 20; duration: slide.slamTime; easing.type: Easing.OutBack}
            NumberAnimation { target: koffice2; property: "scale"; from: 2; to: 1.5; duration: slide.slamTime; easing.type: Easing.OutBack }
        }
        running: false
    }

    onVisibleChanged: {
        widgetAnimation.running = slide.visible;
    }

    Column {
        id: row

        property int w: slide.width * .2
//        x: 0
//        y: 0
//        height: slide.height
        anchors.fill: parent
        property int highestZ: 0
        Image {
            id: boxesImage;
            source: "using/kde.png"
            fillMode: Image.PreserveAspectFit
            antialiasing: true
            opacity: 0
            width: parent.w
            y: index * (parent.height*.2)
            x: slide.width - parent.w
            rotation: 10
            scale: 1.5

            states: [
                State {
                    name: "clicked"
                    PropertyChanges {
                        target: boxesImage
                        rotation: 1
                        z: row.highestZ + 1
                        width: slide.width * 0.9
//                        scale: slide.width / boxesImage.width

                        x: 0
                        y: 0
                    }
                }
            ]

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: parent.state == 'clicked' ? parent.state = '' : parent.state = 'clicked'
            }
        }
        Image {
            id: koffice
            source: "using/koffice.png"
            fillMode: Image.PreserveAspectFit
            width: parent.w
            y: index * (parent.height*.2)
            x: slide.width - parent.w
            antialiasing: true
            opacity: 0

            states: [
                State {
                    name: "clicked"
                    PropertyChanges {
                        target: koffice
                        rotation: 1
                        z: row.highestZ + 1
                        width: slide.width * 0.9
//                        scale: slide.width / boxesImage.width

                        x: 0
                        y: 0
                    }
                }
            ]

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: parent.state == 'clicked' ? parent.state = '' : parent.state = 'clicked'
            }
        }
        Image {
            id: koffice2
            source: "using/koffice.png"
            fillMode: Image.PreserveAspectFit
            width: parent.w
            y: index * (parent.height*.2)
            x: slide.width - parent.w
            antialiasing: true
            opacity: 0

            states: [
                State {
                    name: "clicked"
                    PropertyChanges {
                        target: koffice2
                        rotation: 1
                        z: row.highestZ + 1
                        width: slide.width * 0.9
//                        scale: slide.width / boxesImage.width

                        x: 0
                        y: 0
                    }
                }
            ]

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: parent.state == 'clicked' ? parent.state = '' : parent.state = 'clicked'
            }
        }
    }
}


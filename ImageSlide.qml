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

    property int highestZ: 0

    centeredText: ""

    property variant model


    Rectangle {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: parent.width * .8
        opacity: 0
    }

    Repeater {
        id: listView

        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: parent.width * .2

        model: parent.model

        delegate: mydelegate
    }

//    Image {
//        id: big
//        source: ""
//        visible: false //hidden by default
//       anchors.centerIn: parent
//    }


    Component {
        id: mydelegate


        Image {
            id: image

            scale: (width / parent.width) * 0.2

            anchors.right: slide.right
            fillMode: Image.PreserveAspectFit

            source: imagePath
            opacity: .9
            antialiasing: true

            states: [
                State {
                    name: "clicked"
                    PropertyChanges {
                        target: image
                        opacity: 1
                        z: slide.highestZ + 1
                        x: (slide.width - width) / 2
                        scale: 1
                    }
                }
            ]

            transitions: [
                Transition {
                    from: ""
                    to: "clicked"
                    NumberAnimation { target: image; property: "scale"; duration: 200; easing.type: Easing.InOutQuad }
                },
                Transition {
                    from: "clicked"
                    to: ""
                    NumberAnimation { target: image; property: "scale"; duration: 200; easing.type: Easing.InOutQuad }
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


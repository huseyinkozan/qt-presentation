import QtQuick 2.0
import Qt.labs.presentation 1.0

Slide {
    id: slide

    property string source: "http://google.com.tr";

    Loader {
        id: webkitLoader

        anchors.fill: parent

        source: "WebKitSlideContent.qml"
        onLoaded: {
//            console.log("loaded webkit, source=" + parent.source)
            item.source = parent.source;
        }
    }

    centeredText: webkitLoader.status == Loader.Error ? "Qt WebKit not installed or otherwise failed to load" : ""
}


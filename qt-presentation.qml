
import QtQuick 2.0
import QtGraphicalEffects 1.0
import "QtLabsPresentation"

Item {
     id: demoMain;

    property bool useDropShadow: true;
    property bool autorun: false;

    width: 1280
    height: 720

    BackgroundSwirls {}

    SlideCounter {
        textColor: slides.textColor;
        currentSlide: slides.currentSlide;
        lengthOfSlides: slides.slides.length;
    }
    Clock {
        textColor: slides.textColor;
        fontFamily: "mono"
    }

    Timer {
        interval: 2000
        running: parent.autorun
        repeat: true

        onTriggered: {
            var from = slides.currentSlide;
            var to = from == slides.slides.length - 1 ? 1 : from + 1;
            slides.switchSlides(slides.slides[from], slides.slides[to], true);
            slides.currentSlide = to;
        }
    }

    Slides {
        id: slides
        titleColor: "white"
        textColor: "white"
        anchors.fill: parent
        layer.enabled: parent.useDropShadow
        layer.effect: DropShadow {
            horizontalOffset: slides.width * 0.005;
            verticalOffset: slides.width * 0.005;
            radius: 16.0
            samples: 16
            fast: true
            color: Qt.rgba(0.0, 0.0, 0.0, 0.7);
        }
    }
}





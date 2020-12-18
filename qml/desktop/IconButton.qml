import QtQuick 2.12

MouseArea {
    focus: true
    property alias backgroundImage: backgroundImage.source
    property alias backgroundColor: rectangle.color
    property int keyCode

    width: 100
    height: 30

    Keys.onPressed: {
        if (event.key === keyCode){
            imageOverlay.opacity = 0.5;
        }
    }

    Keys.onReleased: {
        if (event.key === keyCode){
            imageOverlay.opacity = 0;
        }
    }

    onPressed: {
        imageOverlay.opacity = 0.5;
    }

    onReleased: {
        imageOverlay.opacity = 0;
    }

    Rectangle {
        id: rectangle
        color: "black"
        anchors.fill: parent
    }

    Image {
        id: backgroundImage
        anchors.fill: parent
    }

    Rectangle {
        id: imageOverlay
        color: "gray"
        anchors.fill: parent
        opacity: 0
    }
}

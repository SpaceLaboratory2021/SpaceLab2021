import QtQuick 2.12

MouseArea {
    id: root

    property var iconImage
    property var iconRotation
    property alias backgroundColor: background.color
    property int keyCode
    property bool reverseOpacity: false

    focus: true
    width: 100
    height: 50

    Rectangle {
        id: background
        anchors.fill: parent
        radius: 10
        opacity: reverseOpacity ? 0 : 1
    }

    Image {
        id: icon
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source: iconImage
        rotation: iconRotation
    }

    Keys.onPressed: {
        if (event.key === keyCode){
            background.opacity = 0.5;
        }
    }

    Keys.onReleased: {
        if (event.key === keyCode){
            background.opacity = reverseOpacity ? 0 : 1;
        }
    }

    onPressed: {
        background.opacity = 0.5;
    }

    onReleased: {
        background.opacity = reverseOpacity ? 0 : 1;
    }
}

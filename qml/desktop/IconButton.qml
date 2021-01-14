import QtQuick 2.12

MouseArea {
    id: root

    property var iconImage
    property alias backgroundColor: background.color
    property int keyCode

    focus: true
    width: 100
    height: 50

    Rectangle {
        id: background
        anchors.fill: parent
    }

    Image {
        id: icon
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        source: iconImage
    }

    Keys.onPressed: {
        if (event.key === keyCode){
            background.opacity = 0.5;
        }
    }

    Keys.onReleased: {
        if (event.key === keyCode){
            background.opacity = 1;
        }
    }

    onPressed: {
        background.opacity = 0.5;
    }

    onReleased: {
        background.opacity = 1;
    }
}

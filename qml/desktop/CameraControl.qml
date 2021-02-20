import QtQuick 2.0

Rectangle {
    id: root
    property alias text: windowsText.text
    property alias fontSize: windowsText.font.pixelSize
    property alias textTopMargin: windowsText.anchors.topMargin
    property string backgroundColor: "#0F0F0F"
    property int iconSize: 50
    radius: 10
    color: "#212121"

    Text {
        id: windowsText
        horizontalAlignment: Text.AlignHCenter
        anchors {
            horizontalCenter: parent.horizontalCenter
            left: parent.left
            top: parent.top
            topMargin: 10
        }
        font {
            bold: true
            pixelSize: 15
        }
        text: qsTr("Управление камерой")
        color: "white"
    }

    IconButton {
        id: iconButtonLeft
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: parent.width*0.15
        width: iconSize
        height: iconSize
        iconImage: "qrc:/icons/arrow.svg"
        backgroundColor: root.backgroundColor
        iconRotation: 180
        reverseOpacity: true
    }

    IconButton {
        id: iconButtonUp
        anchors.left: iconButtonLeft.right
        anchors.bottom: iconButtonLeft.top
        width: iconSize
        height: iconSize
        iconImage: "qrc:/icons/arrow.svg"
        backgroundColor: root.backgroundColor
        iconRotation: 270
        reverseOpacity: true
    }

    IconButton {
        id: iconButtonRight
        anchors.left: iconButtonUp.right
        anchors.top: iconButtonUp.bottom
        width: iconSize
        height: iconSize
        iconImage: "qrc:/icons/arrow.svg"
        backgroundColor: root.backgroundColor
        iconRotation: 0
        reverseOpacity: true
    }

    IconButton {
        id: iconButtonDown
        anchors.left: iconButtonLeft.right
        anchors.top: iconButtonLeft.bottom
        width: iconSize
        height: iconSize
        iconImage: "qrc:/icons/arrow.svg"
        backgroundColor: root.backgroundColor
        iconRotation: 90
        reverseOpacity: true
    }

    IconButton {
        id: iconButtonZUp
        anchors.bottom: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: parent.width*0.15
        width: iconSize
        height: iconSize
        iconImage: "qrc:/icons/arrow.svg"
        backgroundColor: root.backgroundColor
        iconRotation: 270
        reverseOpacity: true
    }

    IconButton {
        id: iconButtonZDown
        anchors.horizontalCenter: iconButtonZUp.horizontalCenter
        anchors.top: iconButtonZUp.bottom
        width: iconSize
        height: iconSize
        iconImage: "qrc:/icons/arrow.svg"
        backgroundColor: root.backgroundColor
        iconRotation: 90
        reverseOpacity: true
    }
}

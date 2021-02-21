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

    function sendData(moveStr) {
        var http = new XMLHttpRequest()
        var url = "http://192.168.0.120:5000/move";
        var params = "move=" + moveStr;
        http.open("POST", url, true);
        http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        http.setRequestHeader("Content-length", params.length);
        http.setRequestHeader("Connection", "close");

        http.onreadystatechange = function() {
                    if (http.readyState == 4) {
                        if (http.status == 200) {
                            console.log("ok")
                        } else {
                            console.log("error: " + http.status)
                        }
                    }
                }
        http.send(params);
    }

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

        Connections {
            target: iconButtonLeft
            onClicked: sendData("-x")
        }
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

        Connections {
            target: iconButtonUp
            onClicked: sendData("+y")
        }
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

        Connections {
            target: iconButtonRight
            onClicked: sendData("+x")
        }
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

        Connections {
            target: iconButtonDown
            onClicked: sendData("-y")
        }
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

        Connections {
            target: iconButtonZUp
            onClicked: sendData("+z")
        }
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

        Connections {
            target: iconButtonZDown
            onClicked: sendData("-z")
        }
    }
}

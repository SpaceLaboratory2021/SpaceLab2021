import QtQuick 2.0
import QtQuick.Layouts 1.15


Rectangle {
    id: root
    property alias text: windowText.text
    property alias fontSize: windowText.font.pixelSize
    property alias textTopMargin: windowText.anchors.topMargin
    property string backgroundColor: "#0F0F0F"
    property int iconSize: 50
    radius: 10
    color: "#212121"

    function sendData(moveStr) {
        console.log(moveStr);
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
        id: windowText
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

    GridLayout {
        id: buttons
        anchors {
            top: windowText.bottom
            topMargin: 15
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        rows: 2
        columns: 2

        Item {
            id: yaw
            Layout.fillHeight: true
            Layout.fillWidth: true
            Text {
                id: yawText
                horizontalAlignment: Text.AlignHCenter
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                }
                font {
                    bold: true
                    pixelSize: 12
                }
                text: qsTr("Рыскание")
                color: "white"
            }
            Item {
                anchors {
                    top: yawText.bottom
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                IconButton {
                    id: addYaw

                    anchors {
                        left: parent.horizontalCenter
                        leftMargin: parent.width*0.1

                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 0
                    reverseOpacity: true

                    Connections {
                        target: iconButtonLeft
                        onClicked: sendData("+yaw")
                    }
                }

                IconButton {
                    id: subYaw

                    anchors {
                        right: parent.horizontalCenter
                        rightMargin: parent.width*0.1

                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 180
                    reverseOpacity: true

                    Connections {
                        target: iconButtonLeft
                        onClicked: sendData("-yaw")
                    }
                }
            }
        }

        Item {
            id: cameraPitch
            Layout.fillHeight: true
            Layout.fillWidth: true
            Text {
                id: cameraPitchText
                horizontalAlignment: Text.AlignHCenter
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                }
                font {
                    bold: true
                    pixelSize: 12
                }
                text: qsTr("Тангаж камеры")
                color: "white"
            }
            Item {
                anchors {
                    top: cameraPitchText.bottom
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                IconButton {
                    id: addcameraPitch

                    anchors {
                        left: parent.horizontalCenter
                        leftMargin: parent.width*0.1

                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 270
                    reverseOpacity: true

                    Connections {
                        target: iconButtonLeft
                        onClicked: sendData("+cameraPitch")
                    }
                }

                IconButton {
                    id: subcameraPitch

                    anchors {
                        right: parent.horizontalCenter
                        rightMargin: parent.width*0.1

                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 90
                    reverseOpacity: true

                    Connections {
                        target: iconButtonLeft
                        onClicked: sendData("-cameraPitch")
                    }
                }
            }
        }


        Item {
            id: pitch1
            Layout.fillHeight: true
            Layout.fillWidth: true
            Text {
                id: pitch1Text
                horizontalAlignment: Text.AlignHCenter
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                }
                font {
                    bold: true
                    pixelSize: 12
                }
                text: qsTr("Тангаж 1")
                color: "white"
            }
            Item {
                anchors {
                    top: pitch1Text.bottom
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                IconButton {
                    id: addpitch1

                    anchors {
                        left: parent.horizontalCenter
                        leftMargin: parent.width*0.1

                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 270
                    reverseOpacity: true

                    Connections {
                        target: iconButtonLeft
                        onClicked: sendData("+pitch1")
                    }
                }

                IconButton {
                    id: subpitch1

                    anchors {
                        right: parent.horizontalCenter
                        rightMargin: parent.width*0.1

                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 90
                    reverseOpacity: true

                    Connections {
                        target: iconButtonLeft
                        onClicked: sendData("-pitch1")
                    }
                }
            }
        }

        Item {
            id: pitch2
            Layout.fillHeight: true
            Layout.fillWidth: true
            Text {
                id: pitch2Text
                horizontalAlignment: Text.AlignHCenter
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                }
                font {
                    bold: true
                    pixelSize: 12
                }
                text: qsTr("Тангаж 2")
                color: "white"
            }
            Item {
                anchors {
                    top: pitch2Text.bottom
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                IconButton {
                    id: addpitch2

                    anchors {
                        left: parent.horizontalCenter
                        leftMargin: parent.width*0.1

                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 270
                    reverseOpacity: true

                    Connections {
                        target: iconButtonLeft
                        onClicked: sendData("+pitch2")
                    }
                }

                IconButton {
                    id: subpitch2

                    anchors {
                        right: parent.horizontalCenter
                        rightMargin: parent.width*0.1

                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 90
                    reverseOpacity: true

                    Connections {
                        target: iconButtonLeft
                        onClicked: sendData("-pitch2")
                    }
                }
            }
        }
    }
}

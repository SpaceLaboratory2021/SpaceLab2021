import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.12

Rectangle {
    id: root
    property alias text: windowText.text
    property alias fontSize: windowText.font.pixelSize
    property alias textTopMargin: windowText.anchors.topMargin
    property string backgroundColor: "#0F0F0F"
    property int iconSize: 50
    radius: 10
    color: "#212121"

    function sendData(params, node = "move") {
        var http = new XMLHttpRequest();
        var url = "http://192.168.0.120:5000/" + node;
        if (node == "move") {
            url += "/" + stepSelector.currentValue;
        }
        console.log(url);
        console.log(params);
        http.open("POST", url, true);
        http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        http.setRequestHeader("Content-length", params.length);
        http.setRequestHeader("Connection", "close");

        http.onreadystatechange = function() {
                    if (http.readyState == XMLHttpRequest.DONE) {
                        if (http.status == 200) {
                            console.log("ok");
                        } else {
                            console.log("error: " + http.status);
                        }
                    }
                }
        http.send(params);
    }

    FileDialog {
        id: fileDialog
        title: "Choose a file"
        nameFilters: [ "Command file (*.dude)", "All files (*)" ]
        selectedNameFilter: "Command file (*.dude)"
        onAccepted: {
            console.log("Accepted: " + fileUrls);
            var xhr = new XMLHttpRequest;
            xhr.open("GET", fileUrls);
            xhr.onreadystatechange = function() {
                if (xhr.readyState == XMLHttpRequest.DONE) {
                    var response = xhr.responseText;
                    sendData(response, "program");
                }
            };
            xhr.send();
        }
        onRejected: { console.log("Rejected"); }
    }

    Text {
        id: windowText
        horizontalAlignment: Text.AlignHCenter
        anchors {
            horizontalCenter: parent.horizontalCenter
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

    ComboBox {
        id: stepSelector
        height: windowText.height

        anchors {
            top: windowText.top
            right: parent.right
            left: windowText.right
            leftMargin: 30
            rightMargin: 10
        }

        model: [ "1", "2", "5", "10", "15", "30", "60"]
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
        columns: 3

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
                        verticalCenter: parent.verticalCenter
                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 0
                    reverseOpacity: true

                    Connections {
                        target: addYaw
                        onClicked: sendData("+yaw")
                    }
                }

                IconButton {
                    id: subYaw

                    anchors {
                        right: parent.horizontalCenter
                        rightMargin: parent.width*0.1
                        verticalCenter: parent.verticalCenter
                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 180
                    reverseOpacity: true

                    Connections {
                        target: subYaw
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
                        verticalCenter: parent.verticalCenter
                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 270
                    reverseOpacity: true

                    Connections {
                        target: addcameraPitch
                        onClicked: sendData("+cameraPitch")
                    }
                }

                IconButton {
                    id: subcameraPitch

                    anchors {
                        right: parent.horizontalCenter
                        rightMargin: parent.width*0.1
                        verticalCenter: parent.verticalCenter
                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 90
                    reverseOpacity: true

                    Connections {
                        target: subcameraPitch
                        onClicked: sendData("-cameraPitch")
                    }
                }
            }
        }

        Item {
            id: home
            Layout.fillHeight: true
            Layout.fillWidth: true
            Text {
                id: homeText
                horizontalAlignment: Text.AlignHCenter
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                }
                font {
                    bold: true
                    pixelSize: 12
                }
                text: qsTr("Домой")
                color: "white"
            }
            Item {
                anchors {
                    top: homeText.bottom
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                IconButton {
                    id: homeButton

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/home.svg"
                    backgroundColor: root.backgroundColor
                    reverseOpacity: true

                    Connections {
                        target: homeButton
                        onClicked: sendData("home")
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
                        verticalCenter: parent.verticalCenter
                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 270
                    reverseOpacity: true

                    Connections {
                        target: addpitch1
                        onClicked: sendData("+pitch1")
                    }
                }

                IconButton {
                    id: subpitch1

                    anchors {
                        right: parent.horizontalCenter
                        rightMargin: parent.width*0.1
                        verticalCenter: parent.verticalCenter
                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 90
                    reverseOpacity: true

                    Connections {
                        target: subpitch1
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
                        verticalCenter: parent.verticalCenter
                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 270
                    reverseOpacity: true

                    Connections {
                        target: addpitch2
                        onClicked: sendData("+pitch2")
                    }
                }

                IconButton {
                    id: subpitch2

                    anchors {
                        right: parent.horizontalCenter
                        rightMargin: parent.width*0.1
                        verticalCenter: parent.verticalCenter
                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/arrow.svg"
                    backgroundColor: root.backgroundColor
                    iconRotation: 90
                    reverseOpacity: true

                    Connections {
                        target: subpitch2
                        onClicked: sendData("-pitch2")
                    }
                }
            }
        }

        Item {
            id: upload
            Layout.fillHeight: true
            Layout.fillWidth: true
            Text {
                id: uploadText
                horizontalAlignment: Text.AlignHCenter
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                }
                font {
                    bold: true
                    pixelSize: 12
                }
                text: qsTr("Загрузить команды")
                color: "white"
            }
            Item {
                anchors {
                    top: uploadText.bottom
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                IconButton {
                    id: uploadButton

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }

                    width: iconSize * rootWindow.width / rootWindow.minimumWidth
                    height: iconSize * rootWindow.height / rootWindow.minimumHeight
                    iconImage: "qrc:/icons/upload.svg"
                    backgroundColor: root.backgroundColor
                    reverseOpacity: true

                    Connections {
                        target: uploadButton
                        onClicked: fileDialog.open()
                    }
                }
            }
        }
    }
}

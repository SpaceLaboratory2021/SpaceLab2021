import QtQuick 2.0
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    property alias text: windowText.text
    property alias fontSize: windowText.font.pixelSize
    radius: 10
    color: "#212121"    

    Text {
        id: windowText
        height: 20
        horizontalAlignment: Text.AlignHCenter
        anchors {
            horizontalCenter: parent.horizontalCenter
        }

        font {
            bold: true
            pixelSize: 15
        }
        text: qsTr("Управление светом")
        color: "white"
    }

    Colorpicker {
        id: colorpicker
        width: parent.width
        anchors {
            top: windowText.bottom
            bottom: button.top
        }
    }

    UniversalSlider {
        id: slider
        anchors {
            top: parent.top
            right: parent.right
        }

        Connections {
            target: slider
            onStateChanged1: {
                var http = new XMLHttpRequest()
                var url = "http://192.168.0.120:5000/led";
                var params = "color=" + colorpicker.colorValue;
                http.open("POST", url, true);
                http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                http.setRequestHeader("Content-length", params.length);
                http.setRequestHeader("Connection", "close");
                if (slider.state == "RightState") {
                    blocker.color = "#F0808080"
                    params = "color=#000000";
                } else {
                    blocker.color = "transparent"
                    params = "color=" + colorpicker.colorValue;
                }
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
        }

    }

    UniversalButton {
        id: button
        height: 30
        width: parent.width
        anchors {
            bottom: parent.bottom
        }

        Connections {
            target: button
            onClicked: {
                if (slider.state == "RightState") {
                    console.log(colorpicker.colorValue);
                    var http = new XMLHttpRequest()
                    var url = "http://192.168.0.120:5000/led";
                    var params = "color=" + colorpicker.colorValue;
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
            }
        }

        buttonText: "Применить"
    }

    Rectangle {
        id: blocker
        anchors {
            top: button.top
            bottom: button.bottom
            left: button.left
            right: button.right
        }
        color: "#F0808080"
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

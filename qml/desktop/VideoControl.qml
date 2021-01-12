import QtQuick 2.12

Rectangle {

    Rectangle {
        id: headerField
        height: 40
        anchors {
            top: parent.top
            right: parent.right
            left: parent.left
        }

        color: "#212121"

        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: qsTr("Управление видео")
            color: "white"
            font {
                pixelSize: 15
                bold: true
            }
        }
    }

    Rectangle {
        id: previewControl
        height: 50
        anchors {
            top: headerField.bottom
            right: parent.right
            left: parent.left
        }
        color: "yellow"

        VideoSwitch {
            anchors.fill: parent
        }
    }

    Rectangle {
        id: cameraPreview
        anchors {
            top: previewControl.bottom
            right: parent.right
            left: parent.left
            bottom: recordContol.top
        }
        color: "#212121"

        VideoPreview {
            id: videoPreview
            anchors.fill: parent
        }
    }

    Rectangle {
        id: recordContol
        height: 50
        anchors {
            right: parent.right
            left: parent.left
            bottom: parent.bottom
        }

        VideoControllerPanel {
            anchors.fill: parent
            backgroundColor: "#212121"
        }
    }
}

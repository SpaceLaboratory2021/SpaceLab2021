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

    VideoPreviewTab {
        id: cameraPreview
        anchors {
            top: headerField.bottom
            right: parent.right
            left: parent.left
            bottom: recordContol.top
        }
        color: "#212121"
        z: 1

        VideoPreview {
            property string title: "Подвижная камера"

            id: movingCameraPreview
            anchors.fill: parent
        }

        VideoPreview {
            property string title: "Стационарная камера"

            id: fixedCameraPreview
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

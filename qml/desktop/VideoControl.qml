import QtQuick 2.12

Item {
    Rectangle {
        radius: 10
        color: "#212121"
        width: parent.width
        anchors {
            top: parent.top
            bottom: recordContol.top
            bottomMargin: 5
        }

        Text {
            id: headerField
            width: parent.width
            height: 25
            anchors {
                top: parent.top
                topMargin: 10
            }
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("Управление установкой")
            color: "white"
            font {
                pixelSize: 15
                bold: true
            }
        }

        VideoPreviewTab {
            id: cameraPreview
            width: parent.width
            radius: parent.radius
            anchors {
                top: headerField.bottom
                bottom: parent.bottom
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
                fixed: true
                anchors.fill: parent
            }
        }
    }

    VideoControllerPanel {
        id: recordContol
        height: 50
        width: parent.width
        radius: 10
        backgroundColor: "#212121"
        anchors {
            right: parent.right
            left: parent.left
            bottom: parent.bottom
        }
    }
}

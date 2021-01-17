import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    id: root
    anchors.fill: parent
    color: "black"

    UniversalMenuBar {
        id: settingsSection
        width: parent.width
        colorBackground: root.color
    }

    Item {
        id: mainSection
        anchors {
            top: settingsSection.bottom
            bottom: parent.bottom
        }
        width: parent.width

        VideoControl {
            id: cameraSection
            height: parent.height
            width: parent.width * 0.5
            z: 1
        }

        LightControl {
            id: lightSection
            anchors {
                left: cameraSection.right
                right: mainSection.right
                top: parent.top
            }
            height: parent.height * 0.5
        }

        Item {
            id: movementSection
            anchors {
                left: cameraSection.right
                right: mainSection.right
                top: lightSection.bottom
                bottom: parent.bottom
            }

            /* Insert your code here */
        }
    }
}

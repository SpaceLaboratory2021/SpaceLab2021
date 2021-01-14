import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    anchors.fill: parent
    color: "black"

    Item {
        id: settingsSection
        height: 20
        width: parent.width

        /* Insert your code here */
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

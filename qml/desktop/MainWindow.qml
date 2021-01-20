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

    Row {
        id: controlRow
        spacing: 5
        height: parent.height - settingsSection.height
        anchors.top: settingsSection.bottom
        leftPadding: spacing
        rightPadding: spacing
        bottomPadding: spacing
        topPadding: spacing

        VideoControl {
            id: cameraSection
            height: parent.height - parent.spacing * 2
            width: root.width * 0.5 - controlRow.spacing * 1.5
            z: 1
        }

        Column {
            id: elementsControl
            height: parent.height - parent.spacing * 2
            width: root.width * 0.5 - controlRow.spacing * 1.5
            spacing: controlRow.spacing

            LightControl {
                id: lightSection
                width: parent.width
                height: parent.height / 2 - parent.spacing / 2
            }

            LightControl {
                id: movementSection
                width: parent.width
                height: parent.height / 2 - parent.spacing / 2
            }
        }
    }
}

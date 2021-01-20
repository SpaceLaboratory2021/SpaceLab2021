import QtQuick 2.0

Rectangle {
    property alias text: windowsText.text
    property alias fontSize: windowsText.font.pixelSize
    property alias textTopMargin: windowsText.anchors.topMargin
    radius: 10
    color: "#212121"

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
        text: qsTr("Управление светом")
        color: "white"
    }
}

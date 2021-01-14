import QtQuick 2.0

Rectangle {
    property alias text: windowsText.text
    property alias fontSize: windowsText.font.pixelSize
    property alias textTopMargin: windowsText.anchors.topMargin
    radius: 50
    color: "yellow"

    Text {
        id: windowsText
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 20
        font.pixelSize: 20
        text: qsTr("Управление светом")
    }
}

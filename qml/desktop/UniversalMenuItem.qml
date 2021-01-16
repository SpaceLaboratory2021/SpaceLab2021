import QtQuick 2.12
import QtQuick.Controls 2.12

MenuItem {
    contentItem: Text {
        text: parent.text
        font.bold: true
        color: parent.highlighted ? "black" : "white"
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: parent.width
        implicitHeight: parent.height
        opacity: enabled ? 1 : 0.3
        color: parent.highlighted ? "white" : "black"
    }
}

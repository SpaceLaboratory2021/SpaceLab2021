import QtQuick 2.12
import QtQuick.Window 2.14

Window {
    visible: true
    width: minimumWidth
    height: minimumHeight
    minimumWidth: 835
    minimumHeight: 480
    title: qsTr("SpaceLab")

    MainWindow {
        id: mainWindow
    }
}

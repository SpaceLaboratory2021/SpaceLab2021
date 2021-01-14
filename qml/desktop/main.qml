import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    QtObject {
        id: constants
        /* for future use */
    }

    MainWindow {
        id: mainWindow
    }

    visible: true
    width: minimumWidth
    height: minimumHeight
    minimumWidth: 886
    minimumHeight: 480
    title: qsTr("SpaceLab")
}

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
    width: 640
    height: 480
    title: qsTr("SpaceLab")
}

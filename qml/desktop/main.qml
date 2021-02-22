import QtQuick 2.12
import QtQuick.Window 2.14

Window {
    id: rootWindow
    visible: true
    width: minimumWidth
    height: minimumHeight
    minimumWidth: 835
    minimumHeight: 480
    title: qsTr("SpaceLab")

    QtObject {
        id: globals
        property string cameraId
        property string cameraIdFixed
        property int currentActiveCamera: 0
    }

    MainWindow {
        id: mainWindow
    }
}

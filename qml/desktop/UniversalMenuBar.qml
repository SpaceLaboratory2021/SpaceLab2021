import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import QtMultimedia 5.14

MenuBar {
    property string colorBackground: rectBackground.color
    property int itemHeight: 30
    property int itemWidth: 150

    id: menuBar
    height: itemHeight

    background: Rectangle {
        id: rectBackground
        anchors.fill: parent
        color: "black"
    }

    delegate: MenuBarItem {
        id: menuBarItem
        height: parent.height
        width: 100

        contentItem: Text {
            text: menuBarItem.text
            font.bold: true
            opacity: enabled ? 1.0 : 0.3
            color: menuBarItem.highlighted ? "black" : "white"
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: menuBarItem.width
            implicitHeight: menuBarItem.height
            opacity: enabled ? 1 : 0.3
            color: menuBarItem.highlighted ? "white" : "transparent"
        }
    }

    Menu {
        title: "Программа"
        width: itemWidth
        height: itemHeight * count
        delegate: UniversalMenuItem {
            height: itemHeight
            width: itemWidth
        }

        Action {
            id: exit
            text: "Выход"
            onTriggered: Qt.quit()
        }
    }

    Menu {
        title: "Устройства"
        width: itemWidth
        height: itemHeight * count
        delegate: UniversalMenuItem {
            height: itemHeight
            width: itemWidth
        }

        Menu {
            title: "Подвижная камера"
            Repeater {
                model: QtMultimedia.availableCameras
                CameraListButton {
                    width: parent.width
                    cameraName: modelData.displayName
                    cameraIndex: modelData.deviceId
                }
            }
        }

        Menu {
            title: "Стационарная камера"
            Repeater {
                model: QtMultimedia.availableCameras
                CameraListButton {
                    width: parent.width
                    cameraName: modelData.displayName
                    cameraIndex: modelData.deviceId
                    fixed: true
                }
            }
        }
    }

    Menu {
        title: "Помощь"
        width: itemWidth
        height: itemHeight * count
        delegate: UniversalMenuItem {
            height: itemHeight
            width: itemWidth
        }

        Action {
            text: "О проекте..."
            onTriggered: aboutProject.open()
        }
    }

    MessageDialog {
        id: aboutProject
        title: "About Text"
        text: "This project was developed:"
    }
}

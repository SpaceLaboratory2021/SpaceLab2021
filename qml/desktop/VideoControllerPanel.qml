import QtQuick 2.12

Rectangle {
    id: root
    property string backgroundColor: "transparent"
    property var icons: ["qrc:/icons/fullScreen.png", "qrc:/icons/round.png",
        "qrc:/icons/square_shape.png", "qrc:/icons/photo.png"]

    color: "transparent"

    Row {
        width: parent.width
        spacing: 5

        Repeater {
            model: icons
            delegate: IconButton {
                iconImage: icons[model.index]
                width: (parent.width - parent.spacing * (icons.length - 1)) / icons.length
                backgroundColor: root.backgroundColor
                onClicked: executeButtonEvent(model.index)
            }
        }
    }

    function executeButtonEvent(index) {
        switch (index) {
        case 0: // full screen mode button
            fixedCameraPreview.fullScreen()
            break
        case 1: // record button
            fixedCameraPreview.record()
            break
        case 2: // stop button
            fixedCameraPreview.stop()
            break
        case 3: // capture button
            fixedCameraPreview.capture()
            break
        }
    }
}

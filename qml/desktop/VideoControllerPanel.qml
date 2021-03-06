import QtQuick 2.12

Rectangle {
    id: rootVideo
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
                backgroundColor: rootVideo.backgroundColor
                onClicked: executeButtonEvent(model.index)
            }
        }
    }

    function executeButtonEvent(index) {
        switch (index) {
        case 0: // full screen mode button
            if (globals.currentActiveCamera) {
                fixedCameraPreview.fullScreen()
            } else {
                movingCameraPreview.fullScreen()
            }
            break
        case 1: // record button
            if (globals.currentActiveCamera) {
                fixedCameraPreview.record()
            } else {
                movingCameraPreview.record()
            }
            break
        case 2: // stop button
            if (globals.currentActiveCamera) {
                fixedCameraPreview.stop()
            } else {
                movingCameraPreview.stop()
            }
            break
        case 3: // capture button
            if (globals.currentActiveCamera) {
                fixedCameraPreview.capture()
            } else {
                movingCameraPreview.capture()
            }
            break
        }
    }
}

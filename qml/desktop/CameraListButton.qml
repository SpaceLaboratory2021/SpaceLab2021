import QtQuick 2.0

Item {
    id: button
    focus: true
    property alias cameraName : innerText.text
    property color color: "white"
    property color hoverColor: "gray"
    property color pressColor: "slategray"
    property int fontSize: 10
    property int borderWidth: 1
    property int borderRadius: 2
    property string cameraIndex
    property bool activated: false
    property var fixed: false

    scale: state === "Pressed" ? 0.96 : 1.0
    state: activated ? "Pressed" : ""
    signal clicked

    width: 100
    height: 30

    // Scale animation
    Behavior on scale {
        NumberAnimation {
            duration: 100
            easing.type: Easing.InOutQuad
        }
    }

    // Button rectangle
    Rectangle {
        id: rectangleButton
        anchors.fill: parent
        radius: borderRadius
        color: button.enabled ? button.color : "grey"
        border.width: borderWidth
        border.color: "black"

        Text {
            id: innerText
            font.pointSize: fontSize
            anchors.centerIn: parent
        }
    }

    // States for button
    states: [
        State {
            name: "Pressed"
            PropertyChanges {
                target: rectangleButton
                color: pressColor
            }
        },
        State {
            name: "Hovering"
            PropertyChanges {
                target: rectangleButton
                color: hoverColor
            }
        }
    ]

    // Mouse area for events
    MouseArea {
        hoverEnabled: true
        anchors.fill: button
        onEntered: {
            button.state = activated ? "Pressed" : "Hovering"
        }
        onExited: {
            button.state = activated ? "Pressed" : ""
        }
        onClicked: {
            button.clicked();
            if (fixed)
                globals.cameraIdFixed = cameraIndex
            else
                globals.cameraId = cameraIndex
        }
        onPressed: {
            button.state = "Pressed"
        }
        onReleased: {
            if (containsMouse)
              button.state = activated ? "Pressed" : "Hovering";
            else
              button.state = activated ? "Pressed" : "";
        }
    }
}

import QtQuick 2.12

Item {
    id: button
    focus: true
    property alias buttonText: innerText.text;
    property color color: "white"
    property color hoverColor: "gray"
    property color pressColor: "slategray"
    property int fontSize: 10
    property int borderWidth: 1
    property int borderRadius: 2
    property int keyCode

    scale: state === "Pressed" ? 0.96 : 1.0
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
            name: "Hovering"
            PropertyChanges {
                target: rectangleButton
                color: hoverColor
            }
        },
        State {
            name: "Pressed"
            PropertyChanges {
                target: rectangleButton
                color: pressColor
            }
        }
    ]

    // Mouse area for events
    MouseArea {
        hoverEnabled: true
        anchors.fill: button
        onEntered: {
            button.state = "Hovering"
        }
        onExited: {
            button.state = ""
        }
        onClicked: {
            button.clicked();
        }
        onPressed: {
            button.state = "Pressed"
        }
        onReleased: {
            if (containsMouse)
              button.state = "Hovering";
            else
              button.state = "";
        }
    }

    // Keys processing
    Keys.onPressed: {
        if (event.key === keyCode){
            button.state = "Pressed"
        }
    }

    Keys.onReleased: {
        if (event.key === keyCode){
            button.state = ""
            button.clicked();
        }
    }
}

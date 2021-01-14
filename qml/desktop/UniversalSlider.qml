import QtQuick 2.0

MouseArea {
    signal stateChanged1

    property string backgroundColor: circle.color
    property string colorBorder: rect.border.color
    property string colorCircle: circle.color
    property int widthBorder: 2

    id: mouseArea
    height: 20
    width: 40
    state: "LeftState"

    onClicked: {
        stateChanged1()
        state = state == "LeftState" ? "RightState" : "LeftState"
    }

    Rectangle {
        id: rect
        anchors.centerIn: parent
        height: mouseArea.height / 2
        width: mouseArea.width * 0.8
        radius: height / 2
        color: "gray"
        border {
            color: "black"
            width: widthBorder
        }
    }

    Rectangle {
        id: circle
        anchors.verticalCenter: parent.verticalCenter
        height: mouseArea.height / 1.5
        width: height
        radius: width / 2
        color: "gray"
        border {
            color: colorBorder
            width: widthBorder
        }
        z: 1
    }

    states: [
        State {
            name: "LeftState"
            PropertyChanges {
                target: circle
                x: circle.radius / 4
            }
        },
        State {
            name: "RightState"
            PropertyChanges {
                target: circle
                x: mouseArea.width - circle.radius / 4 - circle.width

            }
        }
    ]
    transitions: [
        Transition {
            from: "*"
            to: "*"
            PropertyAnimation {
                target: circle
                properties: "x"
                easing.type: Easing.InOutQuad
                duration: 500
            }
        }
    ]
}

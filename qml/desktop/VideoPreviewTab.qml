import QtQuick 2.0

Rectangle {
    id: videoPreviewTab

    default property alias content: storage.children

    property int current: 0

    Row {
        id: header

        Repeater {
            model: storage.children.length
            delegate: Rectangle {
                id: delegate
                width: videoPreviewTab.width / storage.children.length
                height: 36
                color: "#101010"

                BorderImage {
                    anchors {
                        fill: parent
                        leftMargin: 10
                        topMargin: 5
                        rightMargin: 10
                    }
                    border {
                        left: 7
                        right: 7
                    }
                    source: "qrc:/images/tab.png"
                    visible: videoPreviewTab.current == index
                }

                Text {
                    id: delegateText
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    anchors.fill: parent
                    text: storage.children[index].title
                    elide: Text.ElideRight
                    font {
                        pixelSize: 13
                        bold: videoPreviewTab.current == index
                    }
                    color: "white"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        videoPreviewTab.current = index
                        globals.currentActiveCamera = index
                    }
                }
            }
        }
    }

    Item {
        id: storage
        anchors {
            top: header.bottom
            bottom: parent.bottom
        }
        width: parent.width
    }

    onCurrentChanged: setOpacities()
    Component.onCompleted: setOpacities()

    function setOpacities() {
        for (var i = 0; i < storage.children.length; ++i) {
            storage.children[i].opacity = (i === current ? 1 : 0)
        }
    }
}

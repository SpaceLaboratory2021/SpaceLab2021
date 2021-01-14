import QtQuick 2.12

Row {
    width: parent.width

    UniversalButton {
        buttonText: "Стационарная камера"
        width: parent.width / 2
        height: parent.height
    }

    UniversalButton {
        buttonText: "Подвижная камера"
        width: parent.width / 2
        height: parent.height
    }
}

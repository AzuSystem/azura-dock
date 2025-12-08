import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    width: startmenu.width / 5 - 10
    height: startmenu.width / 5 - 10

    background: Rectangle {
        color: "#00ffffff"
        // border.width: 1
        // border.color: "#20ffffff"
        radius: width / 6

        MouseArea {
            width: parent.width
            height: parent.height
            hoverEnabled: true

            // onEntered: parent.color = "#0Fffffff"
            onEntered: parent.color = "#0Affffff"
            onExited: parent.color = "#00ffffff"
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 7
        Image {
            source: "../../assets/icons/dolphin.svg"
            width: 50
            height: 50
        }

        Text {
            text: "Dolphin"
            color: "#ffffff"
            font.pixelSize: 13
            font.weight: Font.Medium
        }
    }
}
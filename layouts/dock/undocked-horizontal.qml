import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12
import QtQuick.Window 2.15
import "../components"

Window {
    id: window
    visible: true
    width: screen.width * ( 80/100 )
    height: 50
    title: "AzuOS Dock"
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
    color: "transparent"
    x: ( screen.width / 2 ) - ( window.width / 2 )
    y: screen.height - window.height - 15

    Rectangle {
        id: dock
        width: parent.width
        // width: childrenRect.width + 12
        height: parent.height
        color: "#801E1122"
        border.width: 1
        border.color: "#20ffffff"
        radius: 12

        Item {
            width: window.width
            anchors.fill: parent
            Row {
                Button { // start button
                    width: window.height
                    height: window.height

                    background: Rectangle {
                        color: "#00000000"
                    }

                    Image {
                        anchors.centerIn: parent
                        width: parent.width - 20
                        height: parent.height - 20
                        source: "../../assets/logo.png"
                    }
                }

                DividerV { // more like MalodyV :speaking_head:
                    anchors.verticalCenter: parent.verticalCenter
                }

                AppIcon {
                    iconSource: "../assets/icons/dolphin.svg"
                }
            }
            Row {
                x: parent.width - width - 12
                spacing: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: dock.right

                Item {
                    // why must i suffer with my buns code, making hacky solutions....
                    DividerV {
                        x: -12
                        y: -5
                    }
                }

                Button {
                    width: 20
                    height: 20

                    background: Rectangle {
                        color: "#00000000"
                    }

                    Image {
                        anchors.centerIn: parent
                        width: parent.width + 2
                        height: parent.height + 2
                        source: "../../assets/icons/arrowup.svg"
                    }
                }
                Button {
                    width: 20
                    height: 20

                    background: Rectangle {
                        color: "#00000000"
                    }

                    Image {
                        anchors.centerIn: parent
                        width: parent.width
                        height: parent.height
                        source: "../../assets/icons/wifi/full.svg"
                    }
                }
                Button {
                    width: 20
                    height: 20

                    background: Rectangle {
                        color: "#00000000"
                    }

                    Image {
                        anchors.centerIn: parent
                        width: parent.width
                        height: parent.height
                        source: "../../assets/icons/config.svg"
                    }
                }

                Button {
                    width: 38
                    height: 20

                    background: Rectangle {
                        color: "#00000000"
                    }

                    Text {
                        id: time
                        anchors.centerIn: parent
                        text: "25:00"
                        // text: time.thetime
                        color: "#ffffff"
                        font.weight: Font.Medium
                    }
                }

                Button {
                    width: 20
                    height: 20

                    background: Rectangle {
                        color: "#00000000"
                    }

                    Image {
                        anchors.centerIn: parent
                        width: parent.width
                        height: parent.height
                        source: "../../assets/icons/config.svg"
                    }
                }
            }
        }
    }

    // width: dock.width
}
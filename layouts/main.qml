import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12
import "components"

ApplicationWindow {
    id: window
    visible: true
    width: 1280
    height: 50
    title: "AzuOS Dock"

    Rectangle {
        width: parent.width
        height: parent.height
        color: "#1E1122"

        Row {
            width: window.width
            spacing: 12
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
                        source: "../assets/logo.png"
                    }
                }

                DividerV { // more like MalodyV :speaking_head:
                    anchors.verticalCenter: parent.verticalCenter
                }

                AppIcon {
                    iconSource: "../assets/icons/dolphin.svg"
                }

            }
                DividerV { // more like MalodyV :speaking_head:
                    anchors.verticalCenter: parent.verticalCenter
                }

            Row {
                spacing: 10
                anchors.verticalCenter: parent.verticalCenter
                // anchors.right: parent.right

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
                        source: "../assets/icons/arrowup.svg"
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
                        source: "../assets/icons/wifi/full.svg"
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
                        source: "../assets/icons/config.svg"
                    }
                }

                Button {
                    width: 38
                    height: 20

                    background: Rectangle {
                        color: "#00000000"
                    }

                    Text {
                        anchors.centerIn: parent
                        text: "25:00"
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
                        source: "../assets/icons/config.svg"
                    }
                }
            }
        }
    }
}
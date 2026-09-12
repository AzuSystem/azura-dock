import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Window
import "../components"
    
Window {
    id: window
    visible: true
    width: screen.width * ( 80/100 )
    height: 50
    title: "Azura Dock"
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
    color: "transparent"
    x: ( screen.width / 2 ) - ( window.width / 2 )
    y: autoHidden ? screen.height + 2 : screen.height - window.height - 15
    opacity: autoHidden ? 0 : 1


    property date currentTime: new Date()
    property bool allowAutoHide: true
    property bool autoHidden: false // the visibility of the dock itself
    property bool modalOpen: false

    Behavior on y {
        NumberAnimation {
            duration: 650
            easing.type: Easing.InOutQuart
        }
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 450
            easing.type: Easing.InQuart
        }

    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: currentTime = new Date()
    }

    Timer {
        id: autoHide
        interval: 1500
        running: allowAutoHide
        repeat: false

        onTriggered: { if (!autoHideMouseArea.containsMouse && !modalOpen) { autoHidden = true } }
    }

    Rectangle {
        id: dock
        width: parent.width
        // width: contents.width + 12
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
                        MouseArea {
                            width: window.height
                            height: window.height
                            hoverEnabled: true
                            onEntered: parent.color = "#07ffffff"
                            onExited: parent.color = "#00000000"
                        }
                        radius: 12
                    }

                    
                    NumberAnimation { 
                        id: popupAnim;
                        property: "y";
                        duration: 500; 
                        easing.type: Easing.OutQuart 
                    }


                    onClicked: {
                        modalOpen = !modalOpen
                        startMenu.active = !startMenu.active;
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
                x: parent.width - width - 14
                spacing: 12
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
                        layer.effect: DropShadow {
                            anchors.centerIn: parent
                            color: "#60ffffff"
                            radius: 24
                            spread: 0.0
                            samples: 64
                            horizontalOffset: 0
                            verticalOffset: 0
                        }
                        MouseArea {
                            width: window.height
                            height: window.height
                            hoverEnabled: true
                            onEntered: parent.layer.enabled = true
                            onExited: parent.layer.enabled = false
                        }
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
                        source: "../../assets/icons/volume/high.svg"
                        layer.effect: DropShadow {
                            anchors.centerIn: parent
                            color: "#60ffffff"
                            radius: 24
                            spread: 0.0
                            samples: 64
                            horizontalOffset: 0
                            verticalOffset: 0
                        }
                        MouseArea {
                            width: window.height
                            height: window.height
                            hoverEnabled: true
                            onEntered: parent.layer.enabled = true
                            onExited: parent.layer.enabled = false
                        }
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
                        source: "../../assets/icons/wifi/four.svg"
                        layer.effect: DropShadow {
                            anchors.centerIn: parent
                            color: "#60ffffff"
                            radius: 24
                            spread: 0.0
                            samples: 64
                            horizontalOffset: 0
                            verticalOffset: 0
                        }
                        MouseArea {
                            width: window.height
                            height: window.height
                            hoverEnabled: true
                            onEntered: parent.layer.enabled = true
                            onExited: parent.layer.enabled = false
                        }
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
                        layer.effect: DropShadow {
                            anchors.centerIn: parent
                            color: "#60ffffff"
                            radius: 24
                            spread: 0.0
                            samples: 64
                            horizontalOffset: 0
                            verticalOffset: 0
                        }
                        MouseArea {
                            width: parent.width
                            height: parent.height
                            hoverEnabled: true
                            onEntered: parent.layer.enabled = true
                            onExited: parent.layer.enabled = false
                        }
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
                        // text: "25:00"
                        text: Qt.formatTime(currentTime, "hh:mm")
                        color: "#ffffff"
                        font.weight: Font.Medium
                        layer.effect: DropShadow {
                            anchors.centerIn: parent
                            color: "#60ffffff"
                            radius: 24
                            spread: 0.0
                            samples: 64
                            horizontalOffset: 0
                            verticalOffset: 0
                        }
                        MouseArea {
                            width: window.height
                            height: window.height
                            hoverEnabled: true
                            onEntered: parent.layer.enabled = true
                            onExited: parent.layer.enabled = false
                        }
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
                        source: "../../assets/icons/notification/read.svg"
                        layer.effect: DropShadow {
                            anchors.centerIn: parent
                            color: "#60ffffff"
                            radius: 24
                            spread: 0.0
                            samples: 64
                            horizontalOffset: 0
                            verticalOffset: 0
                        }
                        MouseArea {
                            width: window.height
                            height: window.height
                            hoverEnabled: true
                            onEntered: parent.layer.enabled = true
                            onExited: parent.layer.enabled = false
                        }
                    }
                }
            }
        }
    }

    MouseArea {
        width: parent.width
        height: parent.height
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        id: autoHideMouseArea
        enabled: allowAutoHide

        onEntered: { autoHidden = false ; autoHide.stop() }
        onExited: { autoHide.start() }
    }

    Loader {
        id: startMenu
        source: "../startmenu/window.qml"
        active: false
        asynchronous: false // Force synchronous loading so item properties exist immediately

        onLoaded: {
            // item.x = window.x;
            // startMenu.item.x = ( screen.width / 2 ) - ( startMenu.item.width / 2 )

            // item.y = window.y - item.height;

            popupAnim.target = item;
            popupAnim.to = window.y - item.height - 15;
            popupAnim.start();
        }
    }

    // width: dock.width
}

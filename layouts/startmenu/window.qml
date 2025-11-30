import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12
import QtQuick.Window 2.15
import "../components"

Window {
    // x: 0
    // y: 0
    width: 550
    height: 570
    visible: true
    color: "transparent"
    title: "Azura Start Menu"
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    Rectangle {
        color: "#801E1122"
        width: parent.width
        height: parent.height
        border.color: "#20ffffff"
        border.width: 1
        radius: 12

        Rectangle {
            // top bar
            color: "#33838383"
            width: parent.width
            height: 50

            Rectangle {
                // topbar outline fyi
                color: "#20ffffff"
                width: parent.width
                height: 1
                y: 49
            }

            Button {
                x: 16
                y: ( parent.height / 2 ) - ( height / 2 )
                width: 28
                height: 28

                background: Rectangle {
                    radius: width / 2
                    color: "#0Fffffff"
                    border.width: 1
                    border.color: "#26ffffff"
                }

                Image {
                    source: "../../assets/icons/account.svg"
                    width: 16
                    height: 16
                    anchors.centerIn: parent
                }
            }

            // Image {
            //     source: "../../assets/logo.png"
            //     width: 28
            //     height: 28
            //     x: 16
            //     y: ( parent.height / 2 ) - ( height / 2 )
            //     opacity: 0.2
            // }

            TextField {
                // the search bar
                width: 284
                height: 30
                color: "#ffffffff"
                x: ( parent.width / 2 ) - ( width / 2 )
                y: ( parent.height / 2 ) - ( height / 2 )
                leftPadding: 35
                placeholderText: "Search"

                background: Rectangle {
                    color: "#0Fffffff"
                    border.color: "#26ffffff"
                    border.width: 0.5
                    radius: 25
                }
                Image {
                    source: "../../assets/icons/search.svg"
                    width: 17
                    height: 17
                    anchors.verticalCenter: parent.verticalCenter
                    x: 12
                }
            }
            // Rectangle {
            //     // the search bar
            //     width: 284
            //     height: 30
            //     color: "#0Fffffff"
            //     border.color: "#26ffffff"
            //     border.width: 0.5
            //     radius: 25
            //     x: ( parent.width / 2 ) - ( width / 2 )
            //     y: ( parent.height / 2 ) - ( height / 2 )

            //     Image {
            //         source: "../../assets/icons/search.svg"
            //         width: 17
            //         height: 17
            //         anchors.verticalCenter: parent.verticalCenter
            //         x: 12
            //     }

            //     TextField {
            //         color: "#ffffffff"
            //         x: 35
            //         width: parent.width
            //         height: parent.height
            //         placeholderText: "Search"
            //     }
            // }

            Button {
                x: parent.width - width - 50
                y: ( parent.height / 2 ) - ( height / 2 )
                width: 28
                height: 28

                background: Rectangle {
                    radius: width / 2
                    // color: "#0Fffffff"
                    color: "#00ffffff"
                    border.width: 1
                    border.color: "#26ffffff"
                }

                Image {
                    source: "../../assets/icons/listview.svg"
                    width: 16
                    height: 16
                    anchors.centerIn: parent
                }
            }

            Button {
                x: parent.width - width - 16
                y: ( parent.height / 2 ) - ( height / 2 )
                width: 28
                height: 28

                background: Rectangle {
                    radius: width / 2
                    color: "#0Fffffff"
                    border.width: 1
                    border.color: "#26ffffff"
                }

                Image {
                    source: "../../assets/icons/gridview.svg"
                    width: 16
                    height: 16
                    anchors.centerIn: parent
                }
            }
        }
    }
}
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

    property int selectedCategoryX: 0

    Rectangle {
        id: startmenu
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

        Rectangle {
            width: 335
            height: 50
            color: "#0Affffff"
            x: ( parent.width / 2 ) - ( width / 2 )
            y: height + 12
            radius: 50

            Rectangle {
                // id: selectOverlay
                // width: 103
                height: appCategories.height - appCategories.bottomPadding * 2
                color: "#52686868"
                radius: appCategories.height / 2
                anchors.verticalCenter: parent.verticalCenter
                x: ( selectedCategoryX - 1 ) + 8
                // width: 103 + selectedCategoryX
                width: 103

                Behavior on x {
                    SequentialAnimation {
                        PauseAnimation { duration: 50 }
                        NumberAnimation { 
                            duration: 250; 
                            easing.type: Easing.OutQuart 
                        }
                    }
                }

            }

            Rectangle {
                id: selectOverlay
                // width: 103
                height: appCategories.height - appCategories.bottomPadding * 2
                color: "#26D463F6"
                radius: appCategories.height / 2
                anchors.verticalCenter: parent.verticalCenter
                x: ( selectedCategoryX - 1 ) + 8
                // width: 103 + selectedCategoryX
                width: 103

                Behavior on x {
                    NumberAnimation { duration: 250; easing.type: Easing.OutQuart }
                }

                // Behavior on x {
                //     SequentialAnimation {

                //         NumberAnimation { 
                //             duration: 250; 
                //             easing.type: Easing.OutQuart 
                //         }
                //     }
                // }
                // Behavior on width {
                //     NumberAnimation { 
                //         duration: 250
                //         easing.type: Easing.OutQuart
                //         onRunningChanged: if (!running) {
                //                 selectOverlay.width = selectOverlay.width -  103 // Snaps back to a base width
                //             }
                //         }
                // }

            }

            Row {
                id: appCategories
                anchors.centerIn: parent
                width: parent.width - ( 8 * 2 )

                padding: 0
                topPadding: 8
                bottomPadding: 8
                spacing: 5
                // width: childrenRect.width
                height: parent.height

                Button {
                    width: 103
                    height: parent.height - parent.bottomPadding * 2

                    background: Rectangle { color: "#00ffffff" }

                    Row {
                        anchors.centerIn: parent
                        spacing: 5

                        Image {
                            // color: "#ffffffff"
                            source: "../../assets/icons/pin.svg"
                            width: 20
                            height: 20
                        }

                        Text {
                            text: "Pinned"
                            color: "#ffffffff"
                            font.pixelSize: 15
                            font.weight: Font.Medium
                            anchors.verticalCenter: parent.verticalCenter

                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: selectedCategoryX = parent.x
                    }
                }
                Button {
                    width: 103
                    height: parent.height - parent.bottomPadding * 2

                    background: Rectangle { color: "#00ffffff" }

                    Row {
                        anchors.centerIn: parent
                        spacing: 5

                        Image {
                            // color: "#ffffffff"
                            source: "../../assets/icons/apps.svg"
                            width: 20
                            height: 20
                        }

                        Text {
                            text: "All Apps"
                            color: "#ffffffff"
                            font.pixelSize: 15
                            font.weight: Font.Medium
                            anchors.verticalCenter: parent.verticalCenter

                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: selectedCategoryX = parent.x
                    }
                }
                Button {
                    width: 103
                    height: parent.height - parent.bottomPadding * 2

                    background: Rectangle { color: "#00ffffff" }

                    Row {
                        anchors.centerIn: parent
                        spacing: 5

                        Image {
                            // color: "#ffffffff"
                            source: "../../assets/icons/refresh.svg"
                            width: 20
                            height: 20
                        }

                        Text {
                            text: "Recents"
                            color: "#ffffffff"
                            font.pixelSize: 15
                            font.weight: Font.Medium
                            anchors.verticalCenter: parent.verticalCenter

                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: selectedCategoryX = parent.x
                    }
                }
            }
        }

        // Just a mask for a neat fade effect on the scroll list
        Rectangle {
            id: fadeMask
            width: parent.width
            height: parent.height - 50
            y: 50
            visible: false
            
            gradient: Gradient {
                GradientStop { position: 0.00; color: "transparent" }
                GradientStop { position: 0.05; color: "black" }
                GradientStop { position: 0.95; color: "black" }
                GradientStop { position: 1.00; color: "transparent" }
            }
        }  
        Rectangle {
            // width: childrenRect.width
            width: ( startmenu.width / 5 - 8 ) * 5
            height: parent.height - 50 - 50 - 12
            y: 50 + 50 + 12 + 10
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#00ffffff"
            id: itemListContainer

            ListModel {
                id: pinned
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
                ListElement {}
            }

            GridView {
            // Row { // testing purposes
                // width: childrenRect.width
                width: ( startmenu.width / 5 - 8 ) * 5
                anchors.fill: parent
                // height: parent.height
                // spacing: 7
                cellWidth: startmenu.width / 5 - 8
                cellHeight: startmenu.width / 5 - 8
                anchors.horizontalCenter: parent.horizontalCenter
                clip: true


                model: pinned

                delegate: GridIcon {}

                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: fadeMask
                }
            }
        }
    }
}
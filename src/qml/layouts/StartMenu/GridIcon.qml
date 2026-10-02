import QtQuick
import QtQuick.Controls

Button {
    width: startmenu.width / 5 - 10
    height: startmenu.width / 5 - 10
    property int animDelay: 0
    property string appName
    property string iconPath

    id: gridIconBtn

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
            source: iconPath
            width: 50
            height: 50
            scale: 0
            anchors.horizontalCenter: parent.horizontalCenter



            Behavior on scale {
                SequentialAnimation {
                    PauseAnimation {
                        duration: animDelay
                    }  

                    NumberAnimation {
                        duration: 500
                        easing: Easing.OutCirc
                    } 
                }

            }
            Component.onCompleted: { scale = 1 }
        }

        Text {
            text: appName
            color: "#ffffff"
            font.pixelSize: 13
            font.weight: Font.Medium
            horizontalAlignment: Text.AlignHCenter
            width: gridIconBtn.width - 15
            elide: Text.ElideRight

        }
    }
}
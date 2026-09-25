import QtQuick
import QtQuick.Controls

Button {
    id: appicon
    width: window.height
    height: window.height

    hoverEnabled: true

    background: Rectangle {
        color: parent.pressed ? "#20000000" : parent.hovered ? "#07ffffff" : "#00ffffff"

        Behavior on color {
            ColorAnimation {
                duration: 100
                easing.type: Easing.InOutQuart
            }
        }
    }
    
    property string iconSource: "../assets/icons/unknown.svg"

    Image {
        anchors.centerIn: parent
        width: parent.width - 20
        height: parent.height - 20
        source: "../" + appicon.iconSource
        scale: parent.pressed ? 0.95 : parent.hovered ? 1.05 : 1.0


        Behavior on scale {
            NumberAnimation {
                duration: 150
                easing.type: Easing.OutCirc
            }
        }

    }

    Rectangle {
        color: "#ffffffff"
        width: 5 // 20 when open
        height: 5
        radius: 2.5

        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - ( height / 2 )



        Behavior on width {
            NumberAnimation {
                duration: 250
                easing.type: Easing.InOutCirc
            }
        }

        Behavior on y {
            NumberAnimation {
                duration: 250
                easing.type: Easing.InOutCirc
            }
        }        
    }
}
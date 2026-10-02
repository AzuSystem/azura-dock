import QtQuick
// import QtQuick.Controls
import QtQuick.Controls.Basic

Button {
	width: startmenu.width / 5 - 10
	height: startmenu.width / 5 - 10
	property int animDelay: 0
	property string appName
	property string iconPath

	id: gridIconBtn

	TapHandler {
		acceptedButtons: Qt.RightButton

		onTapped: {
			contextMenu.popup()
		}
	}

	Menu {
		id: contextMenu

		popupType: Popup.Window

		width: 180

		padding: 6

		background: Rectangle {
			color: "#801E1122"
			border.color: "#20ffffff"
			border.width: 1
			radius: 12        
		}

		delegate: MenuItem {

			implicitHeight: 36

			leftPadding: 12
			rightPadding: 12

			contentItem: Text {
				text: parent.text
				color: "#ffffff"
				verticalAlignment: Text.AlignVCenter
			}

			background: Rectangle {
				radius: 7
				color: parent.highlighted ? "0Affffff" : "#00ffffff"
			}
		}

		MenuItem {
			text: "Pin"
			onTriggered: {
				console.log("Pin")
			}
		}

		MenuItem {
			text: "Open"
			onTriggered: {
				console.log("Open")
			}
		}

		MenuSeparator {}

		MenuItem {
			text: "Properties"
		}
	}

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
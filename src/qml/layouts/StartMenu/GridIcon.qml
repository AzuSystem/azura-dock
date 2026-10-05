import QtQuick
// import QtQuick.Controls
import QtQuick.Controls.Basic

Button {
	width: startmenu.width / 5 - 10
	height: startmenu.width / 5 - 10
	property int animDelay: 0
	property string appName
	property string iconPath
	property string filePath

	id: gridIconBtn

	TapHandler {
		acceptedButtons: Qt.LeftButton
		onTapped: { backend.launchEntry(filePath) }
	}

	TapHandler {
		acceptedButtons: Qt.RightButton
		onTapped: { contextMenu.popup() }
	}

	Menu {
		id: contextMenu

		popupType: Popup.Window

		// width: 180

		padding: 6

		enter: Transition {
			NumberAnimation {
				property: "width"
				from: 0
				to: 180
				duration: 250
				easing.type: Easing.OutCubic
			}		

			NumberAnimation {
				property: "height"
				from: 0
				to: height + ( padding * 2 ) + padding
				duration: 200
				easing.type: Easing.OutBack
			}			

			NumberAnimation {
				property: "opacity"
				from: 0
				to: 1
				duration: 300
			}			
		}


		background: Rectangle {
			color: "#501E1122"
			border.color: "#20ffffff"
			border.width: 1
			radius: 12        
		}

		delegate: MenuItem {
			id: menuItem
			implicitHeight: 30

			contentItem: Text {
				text: parent.text
				color: "#ffffff"
				verticalAlignment: Text.AlignVCenter
			}

			background: Rectangle {
				radius: 6
				color: parent.highlighted ? "#0Affffff" : "#00ffffff"
			}
		}

		Action {
			text: "Pin to Launcher"
			onTriggered: {
				backend.pinLauncherEntry('{"name": "' + appName + '", "icon": "' + iconPath + '", "path": "' + filePath + '"}')
				// frontend.refreshModels()
			}
		}

		// Action {
		// 	text: "Pin to Dock"
		// 	onTriggered: {
		// 		console.log("Pin")
		// 	}
		// }		

		Action {
			text: "Open"
			onTriggered: {
				backend.launchEntry(filePath)
			}
		}

		MenuSeparator {}

		Action {
			text: "Properties"
		}

		// Text { text: appName }
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
			asynchronous: true
			cache: false
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
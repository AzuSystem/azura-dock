import QtQuick
import com.azusystem.azura

// Dummy Backend
// Item {
// 	property var pinnedModel: '
// 		[
// 			{
// 				"name": "Arcaea",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Higurashi no naku koro ni",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Arcaea",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Arcaea",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Arcaea",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Arcaea",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Arcaea",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			}
// 		]'

// 	property var allAppsModel: '
// 		[
// 			{
// 				"name": "Phigros",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Katawa Shoujo",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "yes",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Arcaea",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "JA Sensei",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Takoboto Dictionary",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Jisho",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Anki",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "yomu yomu",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "NicoDouga",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Higurashi Again",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			}

// 		]'

// 	property var recentsModel: '
// 		[
// 			{
// 				"name": "JA Sensei",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Takoboto Dictionary",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Jisho",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Anki",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "yomu yomu",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "NicoDouga",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			},
// 			{
// 				"name": "Higurashi Again",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"path": ""
// 			}

// 		]'

// 	onPinnedModelChanged: {
// 		console.log("changed: " + pinnedModel)
// 		console.trace()
// 	}

// 	function getPinnedModel() {
// 		return pinnedModel
// 	}

// 	function getAllAppsModel() {
// 		return allAppsModel
// 	}

// 	function getRecentsModel() {
// 		return recentsModel
// 	}

// 	function launchEntry(path) {
// 		console.log("Laucnh Entry: " + path)
// 	}

// 	function pinLauncherEntry(json) {
// 		console.log(json)

// 		let pinnedJSON = JSON.parse(pinnedModel)
// 		pinnedJSON.push(JSON.parse(json))

// 		pinnedModel = JSON.stringify(pinnedJSON, null, 4);

// 		// frontend.refreshModels()
// 		// console.log(pinnedModel)		
// 	}

// }


// Real Backend
Item {
	PinnedList {
		id: rustBackend
	}

	property var pinnedModel: rustBackend.fetchPinnedJSON()
	property var allAppsModel: rustBackend.fetchAllAppsJSON()
	property var recentsModel: rustBackend.fetchRecentsJSON()

	onPinnedModelChanged: {
		console.log("changed: " + pinnedModel)
		console.trace()
	}

	function getPinnedModel() {
		return pinnedModel
	}

	function getAllAppsModel() {
		return allAppsModel
	}

	function getRecentsModel() {
		return recentsModel
	}

	function launchEntry(path) {
		console.log("Launch Entry: " + path)
		rustBackend.launchEntry(path)
		window.modalOpen = false;
		frontend.visible = false;
	}

	function pinLauncherEntry(json) {
		console.log(json)

		let pinnedJSON = JSON.parse(pinnedModel)
		pinnedJSON.push(JSON.parse(json))

		pinnedModel = JSON.stringify(pinnedJSON, null, 4);

		rustBackend.writePinnedModel(pinnedModel)

		// frontend.refreshModels()
		// console.log(pinnedModel)		
	}

}

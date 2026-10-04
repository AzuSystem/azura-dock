import QtQuick
import com.azusystem.azura

// Dummy Backend
// Item {
// 	property var pinnedModel: '
// 		[
// 			{
// 				"name": "Arcaea",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Higurashi no naku koro ni",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Arcaea",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Arcaea",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Arcaea",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Arcaea",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Arcaea",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			}
// 		]'

// 	property var allAppsModel: '
// 		[
// 			{
// 				"name": "Phigros",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Katawa Shoujo",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "yes",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Arcaea",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "JA Sensei",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Takoboto Dictionary",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Jisho",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Anki",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "yomu yomu",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "NicoDouga",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Higurashi Again",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			}

// 		]'

// 	property var recentsModel: '
// 		[
// 			{
// 				"name": "JA Sensei",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Takoboto Dictionary",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Jisho",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Anki",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "yomu yomu",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "NicoDouga",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
// 			},
// 			{
// 				"name": "Higurashi Again",
// 				"icon": "../../assets/icons/dolphin.svg",
// 				"file": ""
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
	property var pinnedModel: rustBackend.fetchPinnedJSON()
	property var allAppsModel: rustBackend.fetchAllAppsModel()
	property var recentsModel: rustBackend.fetchRecentsModel()

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
		console.log("Laucnh Entry: " + path)
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
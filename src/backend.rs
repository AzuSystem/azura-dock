
/// The bridge definition for our QObject
#[cxx_qt::bridge]
pub mod qobject {

    unsafe extern "C++" {
        include!("cxx-qt-lib/qstring.h");
        /// An alias to the QString type
        type QString = cxx_qt_lib::QString;
    }

    extern "RustQt" {
        // The QObject definition
        // We tell CXX-Qt that we want a QObject class with the name MyObject
        // based on the Rust struct MyObjectRust.
        #[qobject]
        #[qml_element]
        type PinnedList = super::PinnedListRust;

        #[qinvokable]
        #[cxx_name = "fetchPinnedJSON"]
        fn fetch_pinned_json(self: &PinnedList) -> QString;

        #[qinvokable]
        #[cxx_name = "fetchAllAppsJSON"]
        fn fetch_all_apps_json(self: &PinnedList) -> QString;
        
        #[qinvokable]
        #[cxx_name = "fetchRecentsJSON"]
        fn fetch_recents_json(self: &PinnedList) -> QString;       
        
        #[qinvokable]
        #[cxx_name = "writePinnedModel"]
        fn write_pinned(self: &PinnedList, json_str: &QString);     
        
        #[qinvokable]
        #[cxx_name = "launchEntry"]
        fn launch_entry(self: &PinnedList, exec: &QString);       

    }
}

use core::pin::Pin;
use cxx_qt_lib::QString;
use directories::BaseDirs;
use std::fs;
use std::path::Path;
use freedesktop_icons;
use freedesktop_desktop_entry::DesktopEntry;
use serde::Serialize;

#[derive(Default)]
pub struct PinnedListRust;

/// The Rust struct for the QObject
#[derive(Clone, Serialize)]
struct AppIcon {
    name: String,
    icon: String,
    path: String,
}

impl qobject::PinnedList {
    pub fn fetch_pinned_json(&self) -> QString {
        let mut icons: Vec<AppIcon> = Vec::new();

        if let Some(config_dir) = BaseDirs::new().map(|dir| dir.config_dir().to_path_buf()) {
            let startmenu_dir = config_dir.join("AzuraDE/StartMenu");
            let pinned_dir = Path::new(&startmenu_dir);
            
                for entry in fs::read_dir(pinned_dir).unwrap() {
                    let entry = entry.unwrap();
                    if entry.path().extension().is_some_and(|ext|ext == "desktop") {
                        let file = DesktopEntry::from_path(entry.path(), None::<&[&str]>).unwrap();

                        let file_name = file.name(&["en"]).unwrap_or_default().to_string();
                        let file_icon = freedesktop_icons::lookup(file.icon().unwrap_or_default().to_string().as_str())
                            .with_size(64)
                            .find()
                            .map(|path|path.to_string_lossy().into_owned())
                            .unwrap_or_else(|| "qrc:/assets/unknown.svg".to_string());

                        let app = AppIcon {
                            name: file_name,
                            icon: "file://".to_string() + &file_icon,
                            path: entry.path().to_string_lossy().to_string(),
                        };

                        icons.push(app);
                    }
                }
        }

        QString::from(serde_json::to_string(&icons).unwrap())
    }

    pub fn fetch_all_apps_json(&self) -> QString {
        let mut icons: Vec<AppIcon> = Vec::new();
        let applications_dir = Path::new("/usr/share/applications");

                for entry in fs::read_dir(applications_dir).unwrap() {
                    let entry = entry.unwrap();
                    if entry.path().extension().is_some_and(|ext|ext == "desktop") {
                        let file = DesktopEntry::from_path(entry.path(), None::<&[&str]>).unwrap();

                        let file_name = file.name(&["en"]).unwrap_or_default().to_string();
                        let file_icon = freedesktop_icons::lookup(file.icon().unwrap_or_default().to_string().as_str())
                            .with_size(64)
                            .find()
                            .map(|path|path.to_string_lossy().into_owned())
                            .unwrap_or_else(|| "qrc:/assets/icons/exclamation.svg".to_string());

                        let app = AppIcon {
                            name: file_name,
                            icon: "file://".to_string() + &file_icon, // breaks the qrc thingy but will fix soon
                            path: entry.path().to_string_lossy().to_string(),
                        };

                        icons.push(app);
                    }
                }
        QString::from(serde_json::to_string(&icons).unwrap())

    }

    pub fn fetch_recents_json(&self) -> QString {
        let mut icons: Vec<AppIcon> = Vec::new();
        QString::from(serde_json::to_string(&icons).unwrap())
    }

    pub fn write_pinned(&self, json_str: &QString) {
        if let Some(config_dir) = BaseDirs::new().map(|dir| dir.config_dir().to_path_buf()) {
            let pinned_path = config_dir.join("AzuraDE/StartMenu");
            let pinned_dir = Path::new(&pinned_path);
            
            fs::write(pinned_dir.join("pinned.json"), json_str.to_string());
        }
    }

    pub fn launch_entry(&self, file: &QString) {
        std::process::Command::new("dex")
            .arg(file.to_string())
            .spawn()
            .unwrap();
    }    
}


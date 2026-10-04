use cxx_qt_lib::{QGuiApplication, QQmlApplicationEngine, QUrl};
use directories::BaseDirs;
use std::path::Path;
use std::fs;
mod backend;

fn main() {
    let mut app = QGuiApplication::new();
    let mut engine = QQmlApplicationEngine::new();

    if let Some(config_dir) = BaseDirs::new().map(|dir| dir.config_dir().to_path_buf()) { 
        let azura_path = config_dir.join("AzuraDE");
        let azura_dir = Path::new(&azura_path);

        if !azura_dir.is_dir() {
            fs::create_dir(azura_dir).unwrap();
        };

        let startmenu_path = azura_dir.join("StartMenu");
        let dock_path = azura_dir.join("Dock");

        let startmenu_dir = Path::new(&startmenu_path);
        let dock_dir = Path::new(&dock_path);

        if !startmenu_dir.is_dir() {
            fs::create_dir(startmenu_dir).unwrap();
        };

        if !dock_dir.is_dir() {
            fs::create_dir(dock_dir).unwrap();
        };
    }




    if let Some(engine) = engine.as_mut() {
        engine.load(&QUrl::from("qrc:/layouts/dock/undocked-horizontal.qml"));
    }

    if let Some(app) = app.as_mut() {
        app.exec();
    }
}
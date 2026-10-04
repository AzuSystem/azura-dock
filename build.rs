use cxx_qt_build::{CxxQtBuilder, QmlModule};

fn main() {
    CxxQtBuilder::new_qml_module(QmlModule::new("com.azusystem.azura"))
        .file("src/backend.rs")
        .qrc("src/qml/qml.qrc")
        .qrc("src/qml/assets.qrc")
        .build();
}
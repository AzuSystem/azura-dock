import sys
import os
import subprocess
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine

app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
engine.quit.connect(app.quit)
engine.load('layouts/main.qml')

root = engine.rootObjects()[0]

sys.exit(app.exec())

# okay but now how the heck do i talk to qml???
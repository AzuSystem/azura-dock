import sys
import os
import subprocess
import thetime
import json
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import Qt, QTime, QTimer, QObject
# from PyQt5.QtWidgets import QWidget i meant QObject im dumb

configPath = os.path.expanduser('~/.config/AzuOS/Dock')
taskbarContents = os.path.expanduser('~/.config/AzuOS/Dock/Contents')
startMenuContents = os.path.expanduser('~/.config/AzuOS/StartMenu/PinnedApps')

if not os.path.exists(configPath):
    print('"~/.config/AzuOS/Dock" Created')
    os.makedirs(configPath, exist_ok=True)

if not os.path.exists(taskbarContents):
    print('"~/.config/AzuOS/Dock/Contents" Created')
    os.makedirs(taskbarContents, exist_ok=True)

if not os.path.exists(startMenuContents):
    print('"~/.config/AzuOS/StartMenu/PinnedApps" Created')
    os.makedirs(pinnedAppsDirectory, exist_ok=True)

app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
engine.quit.connect(app.quit)


engine.load('layouts/dock/undocked-horizontal.qml')
# engine.load('layouts/startmenu/window.qml')

root = engine.rootObjects()[0]

# time shenanigens
time = thetime.Time()
engine.rootContext().setContextProperty("time", time)

# pinned apps!
# appIcon = engine.loadComponent('layouts/components/AppIcon.qml')
# this here reads a json and creates the icons and such
try:
	with open(taskbarContents + '/pinned.json', 'r') as pinned:
		data = json.load(pinned)
		# print(json.dumps(data, indent=4))
		for pos, name in data.items():
			print()
except json.JSONDecodeError:
	print("Failed to load pinned apps: Could not parse properly")


sys.exit(app.exec())
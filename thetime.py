from PyQt5.QtCore import Qt, QTime, QTimer, QObject, QDateTime, pyqtProperty
# from PyQt5.QtWidgets import QWidget i meant QObject im dumb

# thetime.py is a sick name i know :3

class Time(QObject):
	def _init_(self):
		self._time = QDateTime.currentDateTime().toString("HH:mm")
		self.timer = QTimer(self)
		self.timer.timeout.connect(self.update_time)
		self.timer.start(1000)
		print(self.timer)

	def update_time(self):
		current_time = QTime.currentTime().toString("hh:mm")
		self.timeText.setText(current_time)

	def fetch_time(self):
		return self._time

	thetime = pyqtProperty(str, fget=fetch_time)

# okay but now how the heck do i talk to qml???
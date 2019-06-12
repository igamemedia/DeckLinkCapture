
CONFIG(release,debug|release):TARGET = DeckLinkCapture
CONFIG(debug,debug|release):TARGET = DeckLinkCaptured
TEMPLATE = app
QT += core gui widgets opengl multimedia
CONFIG += c++11

DESTDIR = $$PWD/_bin

win32:INCLUDEPATH += C:\opencv\build\include

linux:LIBS += -ldl
win32:LIBS += -lole32 -loleaut32

win32 {
	INCLUDEPATH += C:/ffmpeg-4.1.3-win64-dev/include
	LIBS += -LC:/ffmpeg-4.1.3-win64-dev/lib
}

LIBS += -lavutil -lavcodec -lavformat -lswscale -lswresample

CONFIG += use_opencv
use_opencv {
	DEFINES += USE_OPENCV
	linux:LIBS += -lopencv_core -lopencv_highgui -lopencv_imgproc
#	win32:LIBS += -LC:\opencv\build\x64\vc12\lib -lopencv_core2412 -lopencv_highgui2412 -lopencv_imgproc2412
	CONFIG(release,debug|release):win32:LIBS += -LC:\opencv\build\x64\vc15\lib -lopencv_world410
	CONFIG(debug,debug|release):win32:LIBS += -LC:\opencv\build\x64\vc15\lib -lopencv_world410d
}

SOURCES += \
	AncillaryDataTable.cpp \
	DeckLinkCapture.cpp \
	DeckLinkDeviceDiscovery.cpp \
	DeckLinkInputDevice.cpp \
	ImageWidget.cpp \
	MainWindow.cpp \
	MotionJPEG.cpp \
	ProfileCallback.cpp \
	VideoEncoder.cpp \
	main.cpp \
	Deinterlace.cpp \
	StatusLabel.cpp

HEADERS += \
	AncillaryDataTable.h \
	DeckLinkAPI.h \
	DeckLinkCapture.h \
	DeckLinkDeviceDiscovery.h \
	DeckLinkInputDevice.h \
	ImageWidget.h \
	MainWindow.h \
	MotionJPEG.h \
	ProfileCallback.h \
	VideoEncoder.h \
	common.h \
	Deinterlace.h \
	StatusLabel.h

FORMS += \
    MainWindow.ui

win32:SOURCES += sdk/Win/DeckLinkAPI_i.c
win32:HEADERS += sdk/Win/DeckLinkAPI_h.h
linux:SOURCES += sdk/Linux/include/DeckLinkAPIDispatch.cpp

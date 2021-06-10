QT += quick

CONFIG += c++17

INCLUDEPATH += $$PWD/src/

HEADERS += \
        src/polygon.h

SOURCES += \
        src/main.cpp \
        src/polygon.cpp

RESOURCES += qml/qml.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

unix: CONFIG += link_pkgconfig
unix: PKGCONFIG += triangulation

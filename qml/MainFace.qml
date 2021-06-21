import QtQuick 2.10

Item {
    PolygonDrawingCanvas {
        id: canvas
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: buttons.top
        }
    }

    Item {
        id: buttons
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: 50

        Rectangle {
            id: clearButton
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }
            width: parent.width / 2
            color: "red"

            Text {
                anchors.centerIn: parent
                color: "white"
                text: qsTr("Clear")
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    polygon.clear()
                    canvas.requestPaint()
                }
            }
        }

        Rectangle {
            anchors {
                left: clearButton.right
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }
            color: "green"

            Text {
                anchors.centerIn: parent
                color: "white"
                text: qsTr("Triangulate")
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    polygon.triangulate()
                    canvas.requestPaint()
                }
            }
        }
    }
}

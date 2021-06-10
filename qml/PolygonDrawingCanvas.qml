import QtQuick 2.15

Canvas {
    onPaint: {
        var ctx = getContext("2d")
        ctx.reset();
        ctx.lineWidth = 1
        ctx.strokeStyle = "black"
        ctx.fillStyle = "black"
        for (var i = 0 ; i < polygon.polygonSize(); i++) {
            ctx.beginPath()
            ctx.ellipse(polygon.polygonPoints[i].x - 1, polygon.polygonPoints[i].y - 1, 3, 3)
            ctx.fill()
            ctx.stroke()
        }
        if (polygon.triangleNumber() > 0) {
            for (var j = 0 ; j < polygon.triangleNumber(); j += 2) {
                ctx.beginPath()
                ctx.moveTo(polygon.trianglesLines[j].x, polygon.trianglesLines[j].y)
                ctx.lineTo(polygon.trianglesLines[j+1].x, polygon.trianglesLines[j+1].y)
                ctx.stroke()
            }
            polygon.clear()
        } else if (polygon.polygonSize() > 0) {
            ctx.beginPath()
            ctx.moveTo(polygon.polygonPoints[0].x, polygon.polygonPoints[0].y)
            for (var k = 1 ; k < polygon.polygonSize(); k++) {
               ctx.lineTo(polygon.polygonPoints[k].x, polygon.polygonPoints[k].y)
            }
            if (polygon.polygonSize() > 2)
                ctx.closePath()
            ctx.stroke()
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            polygon.appendPoint(mouseX, mouseY)
            parent.requestPaint()
        }
    }
}

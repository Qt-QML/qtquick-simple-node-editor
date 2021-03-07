import QtQuick 2.0
import QtQuick.Shapes 1.15

Shape {
    id: root
    property IOPort from
    property IOPort to
    x: Math.min(from.globalX, to.globalX)
    y: Math.min(from.globalY, to.globalY)
    z: -1//Math.max(from.globalZ, to.globalZ) + 0.5
    width: Math.abs(from.globalX - to.globalX)
    height: Math.abs(from.globalY - to.globalY)
    property point start: from.globalX, from.globalY, x, y, mapFromItem(from, 0, 0)
    property point end: x, y, to.globalX, to.globalY, mapFromItem(to, 0, 0)
    property point mid: Qt.point((start.x + end.x) / 2, (start.y + end.y) / 2)

    // the connection line:
    ShapePath {
        strokeWidth: 4
        strokeColor: "black"
        startX: root.start.x
        startY: root.start.y
        PathLine {
            x: root.end.x
            y: root.end.y
        }
    }

    // remove connection button:
    Item {
        id: rm
        x: mid.x; y: mid.y
        property real size: 15

        Rectangle {
            id: rect
            x: -width/2
            y: -height/2
            width: rm.size
            height: rm.size
            color: rmma.containsMouse ? "red" : "transparent"

            MouseArea {
                id: rmma
                anchors.fill: parent
                hoverEnabled: true
                onClicked: root.destroy()
            }
        }
    }
}

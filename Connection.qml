import QtQuick 2.0
import QtQuick.Shapes 1.15

Shape {
    id: root
    property IOPort from
    property IOPort to
    x: Math.min(from.globalX, to.globalX)
    y: Math.min(from.globalY, to.globalY)
    z: Math.max(from.globalZ, to.globalZ) + 0.5
    width: Math.abs(from.globalX - to.globalX)
    height: Math.abs(from.globalY - to.globalY)
    property point start: from.globalX, from.globalY, to.globalX, to.globalY, mapFromItem(from, 0, 0)
    property point end: from.globalX, from.globalY, to.globalX, to.globalY, mapFromItem(to, 0, 0)

    Rectangle {
        visible: false
        anchors.fill: parent
        color: "transparent"
        border.color: "red"
    }

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

    Component.onCompleted: {
        //start = mapFromItem(from, 0, 0)
        //end = mapFromItem(to, 0, 0)
        //from.x = from.x+1
        //from.x = from.x-1
    }
}

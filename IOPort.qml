import QtQuick 2.0

Item {
    id: root
    property alias rect: rect
    property real size: 15
    property real globalX: x + parent.x
    property real globalY: y + parent.y
    property real globalZ: 1 + parent.z

    property Node node: root.parent
    property Item view: root.node.view

    Rectangle {
        id: rect
        x: -width/2
        y: -height/2
        width: root.size
        height: root.size
        border.color: "black"
        color: "gray"
    }
}

import QtQuick 2.0

IOPort {
    id: root

    Component {
        id: newConnection
        Connection {}
    }

    DropArea {
        id: dropArea
        anchors.fill: root.rect
        onDropped: {
            newConnection.createObject(root.parent.parent, {from: drop.source.sourcePort, to: root})
        }
    }

    Rectangle {
        visible: dropArea.containsDrag
        anchors.fill: root.rect
        color: "transparent"
        border.color: "red"
        border.width: 2
    }
}

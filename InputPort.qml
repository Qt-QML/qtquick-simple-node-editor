import QtQuick 2.0
import QtQuick.Window 2.15

IOPort {
    id: root

    DropArea {
        id: dropArea
        anchors.fill: root.rect
        onDropped: view.newConnection(drop.source.sourcePort, root)
    }

    Rectangle {
        visible: dropArea.containsDrag
        anchors.fill: root.rect
        color: "transparent"
        border.color: "red"
        border.width: 2
    }
}

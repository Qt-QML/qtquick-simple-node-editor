import QtQuick 2.0
import QtQuick.Shapes 1.15

IOPort {
    id: root

    Shape {
        ShapePath {
            strokeWidth: 2
            strokeStyle: ShapePath.DashLine
            strokeColor: "black"
            PathLine {
                x: connectionMakerDummy.x
                y: connectionMakerDummy.y
            }
        }
    }

    Item {
        id: connectionMakerDummy
        objectName: "connectionMakerDummy"
        Drag.active: mouseArea.drag.active
        property alias sourcePort: root

        function resetPosition() {
            x = y = 0
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: root.rect
        drag.target: connectionMakerDummy
        drag.threshold: 0
        onReleased: {
            connectionMakerDummy.Drag.drop()
            connectionMakerDummy.resetPosition()
        }
    }

    Rectangle {
        visible: mouseArea.drag.active
        anchors.fill: root.rect
        color: "transparent"
        border.color: "red"
        border.width: 2
    }
}

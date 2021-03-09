import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: mainWindow
    width: 420
    height: 280
    visible: true
    title: qsTr("Node editor")

    Item {
        id: view
        anchors.fill: parent
        property int maxZ: 1

        Component {
            id: connectionComp
            Connection {}
        }

        Component {
            id: nodeComp
            Node {
                width: 120
                height: 50

                InputPort {x: 0.0 * parent.width; y: 0}
                InputPort {x: 1.0 * parent.width; y: 0}
                OutputPort {x: 0.0 * parent.width; y: parent.height}
                OutputPort {x: 1.0 * parent.width; y: parent.height}
            }
        }

        function newNode(x, y) {
            nodeComp.createObject(view, {x: x - 60, y: y - 25})
        }

        function newConnection(from, to) {
            connectionComp.createObject(view, {from: from, to: to})
        }

        MouseArea {
            anchors.fill: parent
            propagateComposedEvents: true
            onClicked: mouse.accepted = false
            onDoubleClicked: view.newNode(mouse.x, mouse.y)
        }

        Node {
            x: 20
            y: 40
            width: 120
            height: 50

            OutputPort {id: o1; x: 0.0 * parent.width; y: parent.height}
            OutputPort {id: o2; x: 0.5 * parent.width; y: parent.height}
            OutputPort {id: o3; x: 1.0 * parent.width; y: parent.height}
        }

        Node {
            x: 260
            y: 140
            width: 120
            height: 50

            InputPort {id: i1; x: 0.0 * parent.width; y: 0}
            InputPort {id: i2; x: 1.0 * parent.width; y: 0}
        }

        Connection {
            from: o1; to: i1
        }
    }
}

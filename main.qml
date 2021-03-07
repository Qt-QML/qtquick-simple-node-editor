import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 420
    height: 280
    visible: true
    title: qsTr("Node editor")

    QtObject {
        id: maxZTracker
        property int maxZ: 1
    }

    Node {
        maxZTracker: maxZTracker
        x: 20
        y: 40
        width: 120
        height: 50

        OutputPort {id: o1; x: 0.0 * parent.width; y: parent.height}
        OutputPort {id: o2; x: 0.5 * parent.width; y: parent.height}
        OutputPort {id: o3; x: 1.0 * parent.width; y: parent.height}
    }

    Node {
        maxZTracker: maxZTracker
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

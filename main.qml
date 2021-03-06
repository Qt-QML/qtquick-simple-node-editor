import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 420
    height: 280
    visible: true
    title: qsTr("Node editor")

    QtObject {
        id: o
        property int maxZ: 1
        onMaxZChanged: console.log('maxZ', maxZ)
    }

    Node {
        tracker: o
        x: 20
        y: 40
        width: 120
        height: 50

        IOPort {id: o1; x: 0; y: parent.height}
    }

    Node {
        tracker: o
        x: 260
        y: 140
        width: 120
        height: 50

        IOPort {id: i1; x: 0; y: 0}
    }

    Connection {
        from: o1; to: i1
    }
}

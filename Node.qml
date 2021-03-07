import QtQuick 2.0

Rectangle {
    id: rect
    border.color: "black"
    border.width: 2
    color: "#eee"
    property QtObject maxZTracker

    MouseArea {
        anchors.fill: parent
        drag.target: rect
        onPressed: rect.z = maxZTracker.maxZ++
    }
}

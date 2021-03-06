import QtQuick 2.0

Rectangle {
    id: rect
    border.color: "black"
    border.width: 2
    color: "#eee"
    property QtObject tracker

    MouseArea {
        anchors.fill: parent
        drag.target: rect
        onPressed: {
            console.log("pressed", rect.parent)
            rect.z = tracker.maxZ++
        }
    }
}

import QtQuick 2.0

Rectangle {
    id: rect
    property Item view: rect.parent
    border.color: "black"
    border.width: 2
    color: "#eee"

    MouseArea {
        anchors.fill: parent
        drag.target: rect
        onPressed: rect.z = view.maxZ++
        onDoubleClicked: rect.destroy()
    }
}

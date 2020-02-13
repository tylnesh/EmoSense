import QtQuick 2.0

    Rectangle {
        id: root
        property color bgcolor: "white"
        property string text: "Button"
        property color txtcolor: "black"

        property int buttonWidth: text.length * 22
        signal clicked();

        radius: 90
        width: buttonWidth
        height: 60
        color: root.bgcolor
        border.color: "black"
        opacity:      enabled  &&  !mouseArea.pressed? 1: 0.3 // disabled/pressed state

        Text {
            anchors.centerIn: parent
            color: root.txtcolor
            font.pointSize: 24
            text: root.text
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                root.clicked()
            }
        }
    }




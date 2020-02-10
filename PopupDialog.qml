import QtQuick 2.0
import QtQuick.Layouts 1.3

import QtQuick.Window 2.3


    Window {
        id: root
        property color bgcolor: "white"
        property color txtcolor: "black"
        property string text: "loremIpsum"

        property int dialogWidth: 600
        property int dialogHeight: 200

        width: dialogWidth
        height: dialogHeight
        ColumnLayout{

            Rectangle{
                color: bgcolor
                width: dialogWidth
                height: dialogHeight/2

                Text{
                    anchors.centerIn: parent
                    text: root.text
                    font.pixelSize: 24
                    color: txtcolor
                }
            }

            Rectangle{
                id: buttonRect
                color: bgcolor
                width: dialogWidth
                height: dialogHeight / 2

                CustomButton {
                    id: loginButton
                    anchors.centerIn:  buttonRect
                    buttonWidth: 180
                    bgcolor: "green"
                    txtcolor: "white"
                    onClicked: {
                        root.close()
                    }
                    text: "Ok"
                }
            }
        }





}

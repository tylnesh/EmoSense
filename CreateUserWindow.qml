import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Window {
    id: createUserWindow
    width: 800
    height: 600
    visible: true

    GridLayout {
        id: grid
        columns: 2
        Text {
            text: "Prihlasovacie meno:"
            font.pointSize: 22
        }
        Rectangle {
            anchors.leftMargin: 10

            width: 500
            height: 40
            color: "#eaeaea"

            TextInput {
                id: username
                text: "Meno"
                width: usernameRect.width
                height: usernameRect.height
                font.pointSize: 22

                onFocusChanged: {
                    if (focus)
                        selectAll()
                }
            }
        }
        Text {
            text: "Heslo:"
            font.pointSize: 22
        }

        Rectangle {
            anchors.leftMargin: 10
            width: 500
            height: 40
            color: "#eaeaea"
            TextInput {
                id: password
                width: usernameRect.width
                height: usernameRect.height
                text: "Heslo"
                font.pointSize: 22
                echoMode: TextInput.Password

                onFocusChanged: {
                    if (focus)
                        selectAll()
                }
            }
        }

        Text {
            text: "Rok narodenia:"
            font.pointSize: 22
        }

        Rectangle {
            anchors.leftMargin: 10
            width: 500
            height: 40
            color: "#eaeaea"
            TextInput {
                id: yearOfBirth
                width: usernameRect.width
                height: usernameRect.height
                text: "YYYY"
                font.pointSize: 22
                onFocusChanged: {
                    if (focus)
                        selectAll()
                }
            }
        }

        Text {
            text: "Pohlavie:"
            font.pointSize: 22
        }

        Rectangle {
            anchors.leftMargin: 10
            width: 500
            height: 40
            color: "#eaeaea"
        ComboBox {
            width: parent.width
            id: subjectSex
            model: ["Muž", "Žena", "Iné"]
        }
        }

        Text {
            text: "Dosiahnuté vzdelanie:"
            font.pointSize: 22
        }

        Rectangle {
            anchors.leftMargin: 10
            width: 500
            height: 40
            color: "#eaeaea"
        ComboBox {
            width: parent.width
            id: education
            model: ["Stredná škola - výučný list", "Stredná škola - maturita", "1. stupeň vysokoškolského vzdelania", "2. stupeň vysokoškolského vzdelania", "3. stupeň vysokoškolského vzdelania"]
        }
        }
        CustomButton {
            id: submitButton
            buttonWidth: 180
            bgcolor: "green"
            txtcolor: "white"
            onClicked: db.submitRegistration()
            text: "OK"

        }

        CustomButton {
            id: cancelButton
            bgcolor: "red"
            txtcolor: "white"
            buttonWidth: 240
            onClicked: {
                createUserWindow.close()
            }
            text: "Zrušiť"
        }

    }


}
import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import com.tylnesh.userinfo 1.0

    Window {
        width: 800
        height: 600

        id: usermanagementdetail
        property string idUser: ""
        property string nick: ""
        property string year: ""
        property string gender: ""
        property string education: ""
        property bool isAdmin: false
        property bool isPassChanged: false

        UserInfo {
        id: info
        }

        onVisibleChanged: {

        }

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
                    text: usermanagementdetail.nick
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
                    text: "*****"
                    font.pointSize: 22
                    echoMode: TextInput.Password

                    onFocusChanged: {
                        if (focus)
                        {
                            selectAll()
                        }
                    }

                    onTextChanged: {
                    isPassChanged = true
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
                    text: usermanagementdetail.year
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
                id: gender
                currentIndex: find(usermanagementdetail.gender)
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
                currentIndex: find(usermanagementdetail.education)
                model: ["Stredná škola - výučný list", "Stredná škola - maturita", "1. stupeň vysokoškolského vzdelania", "2. stupeň vysokoškolského vzdelania", "3. stupeň vysokoškolského vzdelania"]
            }
            }

            Text {
                text: "Administrátor?"
                font.pointSize: 22
            }

            Rectangle {
                anchors.leftMargin: 10
                width: 500
                height: 40
                color: "#eaeaea"
            CheckBox {
                id: admin
            }
            }



            CustomButton {
                id: submitButton
                buttonWidth: 180
                bgcolor: "green"
                txtcolor: "white"
                onClicked: {
                    info.id = usermanagementdetail.idUser
                    info.username = username.text
                    if(isPassChanged) {
                        info.password = password.text
                    }   else    {
                        info.password = ""
                    }

                    info.yearOfBirth = yearOfBirth.text
                    info.gender = gender.currentText
                    info.education = education.currentText
                    info.isAdmin = admin.checked

                    if (!db.updateUser(info)) {
                        popup.visible = true
                    }
                    else {
                    createUserWindow.close()
                    }
                }
                text: "Upraviť"

            }

            CustomButton {
                id: cancelButton
                bgcolor: "red"
                txtcolor: "white"
                buttonWidth: 240
                onClicked: {
                    usermanagementdetail.close()
                }
                text: "Zrušiť"
            }

        }



    }




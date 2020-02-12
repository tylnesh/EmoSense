import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

    Window {
        width: 800
        height: 600

        id: questionnairemanagementdetail
        property string idQuestionnaire: ""
        property string nameQuestionnaire: ""

        onVisibleChanged: {

        }

        GridLayout {
            id: grid
            columns: 2
            Text {
                text: "Názov dotazníka:"
                font.pointSize: 22
            }
            Rectangle {
                anchors.leftMargin: 10
                id: questionnaireNameRect
                width: 500
                height: 40
                color: "#eaeaea"

                TextInput {
                    id: nameQuestionnaire
                    text: questionnairemanagementdetail.nick
                    width: questionnaireNameRect.width
                    height: questionnaireNameRect.height

                    font.pointSize: 22

                    onFocusChanged: {
                        if (focus)
                            selectAll()
                    }
                }
            }





            CustomButton {
                id: submitButton
                buttonWidth: 180
                bgcolor: "green"
                txtcolor: "white"
                onClicked: {
                    info.id = questionnairemanagementdetail.idquestionnaire
                    info.questionnairename = questionnairename.text
                    if(isPassChanged) {
                        info.password = password.text
                    }   else    {
                        info.password = ""
                    }



                    if (!db.updatequestionnaire(info)) {
                        popup.visible = true
                    }
                    else {
                        questionnaireModel.select()
                        createquestionnaireWindow.close()
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
                    questionnairemanagementdetail.close()
                }
                text: "Zrušiť"
            }

        }



    }




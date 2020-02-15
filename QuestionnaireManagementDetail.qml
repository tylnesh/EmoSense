import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

    Window {
        width: 800
        height: 600

        id: questionnairemanagementdetail
        property string id: ""
        property string name: ""

        QuestionnaireQuestionsWindow{
        id: questionnaireQuestionsWindow
        }
        GridLayout {
            id: grid
            columns: 3
            Text {
                text: "Názov dotazníka"
                font.pointSize: 22
            }

            Text {
                text: ":"
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
                    text: questionnairemanagementdetail.name
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
                bgcolor: "green"
                txtcolor: "white"
                onClicked: {
                        db.updateQuestionnaireName(id, nameQuestionnaire.text)
                        questionnaireModel.select()
                        questionnairemanagementdetail.close()
                    }

                text: "Uložiť zmeny"

            }

            CustomButton {
                id: questionsButton
                bgcolor: "yellow"
                txtcolor: "white"
                onClicked: {
                    questionnaireQuestionsWindow.visible = true

                }
                text: "Pridať / odobrať otázky"

            }




            CustomButton {
                id: cancelButton
                bgcolor: "red"
                txtcolor: "white"
                onClicked: {
                    questionnairemanagementdetail.close()
                }
                text: "Zrušiť"
            }

        }



    }




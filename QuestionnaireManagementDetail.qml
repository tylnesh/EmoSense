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

        onVisibleChanged: {

        }

        GridLayout {
            id: grid
            columns: 3
            Text {
                text: "Názov dotazníka:"
                font.pointSize: 22
            }

            Rectangle {}
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
                buttonWidth: 180
                bgcolor: "green"
                txtcolor: "white"
                onClicked: {
                        db.updateQuestionnaireName(nameQuestionnaire.text)
                        questionnaireModel.select()
                        questionnairemanagementdetail.close()
                    }

                text: "Uložiť zmeny"

            }

            CustomButton {
                id: questionsButton
                buttonWidth: 180
                bgcolor: "yellow"
                txtcolor: "white"
                onClicked: {

                }
                text: "Pridať / odobrať otázky"

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




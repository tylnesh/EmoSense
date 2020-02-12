import QtQuick 2.0

import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import com.tylnesh.databaseconnector 1.0

Window {
    id: createquestionnairewindow
    width: 800
    height: 600

    DatabaseConnector {
        id: db
    }

    PopupDialog {
        id: popup
        text: "Nesprávne vyplnené hodnoty"

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
            id:questionnaireRect

            width: 500
            height: 40
            color: "#eaeaea"

            TextInput {
                id: questionnaire
                text: "Nový dotazník"
                width: questionnaireRect.width
                height: questionnaireRect.height
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


                if (!db.createQuestionnaire(questionnaire.text)) {
                    popup.visible = true
                }
                else {
                    questionnaireModel.select()
                    createquestionnairewindow.close()
                }
            }
            text: "OK"

        }

        CustomButton {
            id: cancelButton
            bgcolor: "red"
            txtcolor: "white"
            buttonWidth: 240
            onClicked: {
                createquestionnairewindow.close()
            }
            text: "Zrušiť"
        }

    }


}

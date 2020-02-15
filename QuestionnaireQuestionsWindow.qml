import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as C1
import com.tylnesh.databaseconnector 1.0

Window {
  id: questionnaireQuestionsWindow
  minimumWidth: 1000
  minimumHeight: 600

  property int cRow : 0



  DatabaseConnector
  {
    id: db

  }

  Rectangle{
  id: placeholderRect
  color: "blue"
  height: questionnaireQuestionsWindow.height
  width: questionnaireQuestionsWindow.width * 3/4

  }

  Rectangle{
      color: "#eaeaea"
      width: questionnaireQuestionsWindow.width * 1/4
      height: questionnaireQuestionsWindow.height
      anchors.left: placeholderRect.right
    ColumnLayout {

        CustomButton {
            text: "Vytvoriť novú otázku"
            onClicked: {
                createQuestionWindow.visible = true
            }
        }


        CustomButton {
            text: "Upraviť otázku"
            onClicked: {
                //TODO

            }
        }

        CustomButton {
            text: "Vymazať otázku"
            onClicked: {
                //TODO

            }
        }
    }

  }
}


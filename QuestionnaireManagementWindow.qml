import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as C1
import com.tylnesh.databaseconnector 1.0

Window {
  id: questionnairemanagementwindow
  minimumWidth: 1000
  minimumHeight: 600

  property int cRow : 0



  DatabaseConnector
  {
    id: db
  }

  CreateQuestionnaireWindow {
      id: createquestionnairewindow
  }

  QuestionnaireManagementDetail{
  id: detail
  }

  C1.TableView{
    height: questionnairemanagementwindow.height
    width: questionnairemanagementwindow.width * 3/4
    id: tableview
    model: questionnaireModel
    onClicked: {
        cRow = row
    }
    onDoubleClicked: {
        cRow = row
        detail.idQuestionnaire = questionnaireModel.data(questionnaireModel.index(cRow,0),0)
        detail.nameQuestionnaire = questionnaireModel.data(questionnaireModel.index(cRow,1),0)
        detail.visible = true
    }


    C1.TableViewColumn{
        role: "idQuestionnaire"
        title: "ID"
        width: 100
    }

    C1.TableViewColumn{
        role: "Name"
        title: "Názov dotazníka"
        width: 300
        delegate: TextEdit
    }



    rowDelegate: Rectangle {
        height:30
        SystemPalette {
            id: myPalette
            colorGroup: SystemPalette.Active
        }
        color: {
            var baseColor = styleData.alternate ?
                        myPalette.alternateBase
                      : myPalette.base;
            return styleData.selected ?
                        myPalette.highlight
                      : baseColor;
            }
        }
    }

  Rectangle{
      color: "#eaeaea"
      width: questionnairemanagementwindow.width * 1/4
      height: questionnairemanagementwindow.height
      anchors.left: tableview.right
    ColumnLayout {

        CustomButton {
            text: "Nový"
            onClicked: {
                createquestionnairewindow.visible = true
            }
        }


        CustomButton {
            text: "Upraviť"
            onClicked: {
                detail.idQuestionnaire = questionnaireModel.data(questionnaireModel.index(cRow,0),0)
                detail.nameQuestionnaire = questionnaireModel.data(questionnaireModel.index(cRow,1),0)

                detail.visible = true
            }
        }

        CustomButton {
            text: "Vymazať"
            onClicked: {
                //TODO: implement deletequestionnaire method
                console.log(questionnaireModel.data(questionnaireModel.index(cRow,0),0))
                db.deleteQuestionnaire(questionnaireModel.data(questionnaireModel.index(cRow,0),0))
                questionnaireModel.select()
            }
        }





    }

  }

}


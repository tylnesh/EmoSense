import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as C1
import com.tylnesh.databaseconnector 1.0

Window {
  id: usermanagementwindow
  minimumWidth: 1000
  minimumHeight: 600

  property int cRow : 0



  DatabaseConnector
  {
    id: db
  }

  CreateUserWindow {
      id: createUserWindow
  }

  UserManagementDetail{
  id: detail
  }
      C1.TableView{
        height: usermanagementwindow.height
        width: usermanagementwindow.width * 3/4
        id: tableview
        model: userModel
        onClicked: {
            cRow = row
            console.log(userModel.data(userModel.index(row,0),0))
        }
        onDoubleClicked: {
            cRow = row
            detail.idUser = userModel.data(userModel.index(row,0),0)
            detail.nick = userModel.data(userModel.index(row,1),0)
            detail.year = userModel.data(userModel.index(row,3),0)
            detail.gender = userModel.data(userModel.index(row,4),0)
            detail.education = userModel.data(userModel.index(row,5),0)
            detail.isAdmin = userModel.data(userModel.index(row,6),0)
            detail.visible = true
        }


        C1.TableViewColumn{
            role: "Nick"
            title: "Prihlasovacie meno"
            width: 200
        }

        C1.TableViewColumn{
            role: "Year_of_birth"
            title: "Rok narodenia"
            width: 100
        }

        C1.TableViewColumn{
            role: "Gender"
            title: "Pohlavie"
            width: 100
        }

        C1.TableViewColumn{
            role: "Education"
            title: "Vzdelanie"
            width: 200
        }

        C1.TableViewColumn{
            role: "isAdmin"
            title: "Privilegia"
            width: 100
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
          width: usermanagementwindow.width * 1/4
          height: usermanagementwindow.height
          anchors.left: tableview.right
        ColumnLayout {

            CustomButton {
                text: "Nový"
                onClicked: {
                    createUserWindow.visible = true
                }
            }


            CustomButton {
                text: "Upraviť"
                onClicked: {
                    detail.idUser = userModel.data(userModel.index(cRow,0),0)
                    detail.nick = userModel.data(userModel.index(cRow,1),0)
                    detail.year = userModel.data(userModel.index(cRow,3),0)
                    detail.gender = userModel.data(userModel.index(cRow,4),0)
                    detail.education = userModel.data(userModel.index(cRow,5),0)
                    detail.isAdmin = userModel.data(userModel.index(cRow,6),0)
                    detail.visible = true
                }
            }

            CustomButton {
                text: "Vymazať"
                onClicked: {
                    //TODO: Add "Are you sure" popup
                    db.deleteUser(userModel.data(userModel.index(cRow,0),0))
                    userModel.refresh()
                    tableview.model = userModel
                }
            }





        }

      }

}


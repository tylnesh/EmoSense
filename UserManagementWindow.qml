import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as C1
import com.tylnesh.databaseconnector 1.0

Window {
  id: usermanagementwindow
  width: 1000
  height: 600


  DatabaseConnector
  {
    id: db
  }

  UserManagementDetail{
  id: detail
  }

  RowLayout {

      anchors.fill: usermanagementwindow

      C1.TableView{
        height: 600
        width: 800
        id: tableview
        model: userModel
        onClicked: {
            console.log(userModel.data(userModel.index(row,0),0))
        }
        onDoubleClicked: {

            detail.id = userModel.data(userModel.index(row,0),0)
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
  }
}


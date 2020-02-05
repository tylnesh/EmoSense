import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
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

  CustomButton{
  onClicked: {


  }
  }




  C1.TableView{
    anchors.fill: parent
    id: tableview
    model: userModel
    onClicked: {
        console.log("row: " + row);
        console.log("valueof" +  tableview.getColumn(currentRow))

    }
    C1.TableViewColumn{
        role: "idUser"
        title: "ID"
        width: 50
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


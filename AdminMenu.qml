import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3

Window {
    id: adminmenu
    minimumWidth: 1000
    minimumHeight: 600

    UserManagementWindow{
        id:umw

    }

    GridLayout {

        id: grid
        columns: 3
        rowSpacing: 20
        columnSpacing: 20


        CustomButton {
            text: "Spravovať dotazniky"
            bgcolor: "yellow"
            txtcolor: "black"
        }

        CustomButton {
            text: "Spravovať testy"
            bgcolor: "yellow"
            txtcolor: "black"
        }

        CustomButton {
            text: "Spravovať používateľov"
            bgcolor: "yellow"
            txtcolor: "black"
            onClicked: {
                umw.visible = true
            }

        }


    }

}





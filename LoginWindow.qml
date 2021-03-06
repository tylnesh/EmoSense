import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import com.tylnesh.databaseconnector 1.0
import QtQuick.Window 2.3


Item {
    id: loginContainer
    width:  loginButton.width + registerButton.width + 40
    height:  480


    Component.onCompleted: {

        //db.establishConnection()
    }

    //Loader {
    //id: pageLoader
    //source : "CreateUserWindow.qml"
    //active : false
    //}

    CreateUserWindow {
        id: createUserWindow
    }

    MainMenu {
    id: mainmenu
    }

    AdminMenu {
    id: adminmenu
    }

    PopupDialog {
        id: popup
        text: "Nesprávne prihlasovacie meno alebo heslo"

    }


    DatabaseConnector {
        id: db
    }

    ColumnLayout{
        anchors.centerIn: loginContainer

    Rectangle {
        id: usernameRect
        width: loginContainer.width - 20
        height: 40
        color: "#eaeaea"
        TextInput {
            id: username
            text: "Meno"
            width: usernameRect.width
            height: usernameRect.height
            font.pointSize: 22

            onFocusChanged:{
                       if(focus)
                           selectAll()
                  }


        }
    }

    Rectangle {
        id: passwordRect
        width: usernameRect.width
        height: 40
        color: "#eaeaea"
        TextInput {
            id: password
            width: usernameRect.width
            height: usernameRect.height
            text: "Heslo"
            font.pointSize: 22
            echoMode: TextInput.Password

            onFocusChanged:{
                       if(focus)
                           selectAll()
                  }

        }
    }

    Rectangle{
        id: buttonRect
        anchors.top: passwordRect.bottom
        anchors.horizontalCenter: passwordRect.Center
        anchors.topMargin: 10
        height: loginButton.height
        width: passwordRect.width



    CustomButton {
        id: loginButton
        anchors.left: buttonRect.left
        //buttonWidth: 180
        bgcolor: "green"
        txtcolor: "white"
        onClicked: {
            db.inputPassword = password.text
            db.inputUsername = username.text

            if (db.login() == -1) {
                popup.visible = true
            }

            if (db.login() == 0) {
                mainmenu.visible = true
            }

            if (db.login() == 1) {
                adminmenu.visible = true
            }
        }
        text: "Prihlásiť sa"

    }

    CustomButton {
        id: registerButton
        anchors.right: buttonRect.right
        bgcolor: "yellow"
        txtcolor: "black"
        //buttonWidth: 240
        onClicked: {
            createUserWindow.visible = true
        }
        text: "Registrovať sa"
    }
    }
    }



}

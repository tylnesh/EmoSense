import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

import com.tylnesh.databaseconnector 1.0


Window {
    visible: true
    minimumWidth:  login.width
    minimumHeight:  login.height
    title: qsTr("EmoSense")

    id: mainWindow

    LoginWindow{
        id :login
        anchors.centerIn: parent
    }

}

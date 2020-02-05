import QtQuick 2.0

Item {
    id: delegate
    width: delegate.ListView.view.width;
    height: 100
    clip: true
    anchors.margins: 4
    Row {
        anchors.margins: 4
        anchors.fill: parent
        spacing: 4;
        Text {
            text: idUser
            width: 150
        }
        Text {
            text: nick
            width: 300;
        }
        Text {
            text: Password
            width: 50;
        }

        Text {
            text: Year_of_birth
            width: 150
        }
        Text {
            text: Gender
            width: 300;
        }
        Text {
            text: Education
            width: 50;
        }
        Text {
            text: isAdmin
            width: 50;
        }


    }
}

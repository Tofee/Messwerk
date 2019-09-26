import QtQuick 2.12
import QtQuick.Controls 2.12

import "../Theme.js" as Theme

Dialog {
    id: dialog
    header: Label {
        text: qsTr("Settings")
        horizontalAlignment: Text.AlignHCenter
    }
    footer: Item {
        Button {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Back"
            onClicked: page.StackView.view.pop();
        }
    }

    onAccepted: {
        settings.loggingPath = loggingPath.text;
        settings.preventDisplayBlanking = preventDisplayBlanking.checked;
    }


    Column {
        id: column

        width: dialog.width
        spacing: Theme.paddingLarge

        Button {
            text: qsTr("Save")
            onClicked: dialog.accept();
        }

        GroupBox {
            title: qsTr("Logging")
            width: parent.width
            TextField {
                id: loggingPath
                width: parent.width
                inputMethodHints: Qt.ImhNoAutoUppercase
                text: settings.loggingPath
              //  label: qsTr("Path for sensor logs")
            }
        }

        Switch {
            id: preventDisplayBlanking
            text: qsTr("Prevent display blanking")
            //description: qsTr("Prevents display blanking on sensor plotting pages")
            checked: settings.preventDisplayBlanking
            enabled: !settings.isHarbourVersion
        }
    }
}

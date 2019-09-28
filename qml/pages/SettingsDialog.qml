import QtQuick 2.9
import QtQuick.Controls 2.9
import QtQuick.Controls.LuneOS 2.0

import LunaNext.Common 0.1

import "CustomTheme"

BasePage {
    id: dialog

    headerText: "Settings"

    Column {
        id: column

        width: dialog.width
        spacing: Theme.paddingLarge

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
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Prevent display blanking")
            //description: qsTr("Prevents display blanking on sensor plotting pages")
            checked: settings.preventDisplayBlanking
        }

        Button {
            text: qsTr("Save")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                settings.loggingPath = loggingPath.text;
                settings.preventDisplayBlanking = preventDisplayBlanking.checked;
                swipeView.currentIndex = 0;
            }
            LuneOSButton.mainColor: LuneOSButton.affirmativeColor
        }
    }
}

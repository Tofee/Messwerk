import QtQuick 2.9
import QtQuick.Controls 2.9

import "CustomTheme"

BasePage {
    id: page
    headerText: "About"

    Flickable {
        anchors.fill: parent

        contentHeight: column.height
        // cut out-of-bound graphics
        clip: true

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Created by bytewerk™ Software Inc.")
                color: Theme.highlightColor
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Send beer, pizza and Club Mate to")
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "http://www.bytewerk.org"
                onClicked: Qt.openUrlExternally("http://www.bytewerk.org")
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("source code")
                onClicked: Qt.openUrlExternally("https://github.com/Tofee/Messwerk")
            }
            GroupBox {
                title: qsTr("Credits")
                width: parent.width
                Column {
                    width: parent.width
                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Coding: ") + "cfr34k"
                    }
                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("LuneOS port: ") + "Tofe"
                    }
                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Quality assurance: ") + "sqozz"
                    }
                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Art & Design: ") + "sqozz, cfr34k"
                    }
                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Translations: ") + "sqozz, cfr34k"
                    }
                }
            }
        }
    }
}

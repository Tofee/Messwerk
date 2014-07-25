import QtQuick 2.0
import Sailfish.Silica 1.0

import "../Constants.js" as Constants

Page {
    id: page

    property bool useRad: false;

    function formatNumber(n) {
        var unit;

        if(useRad) {
            n *= 0.017453; // *pi/180
            unit = 'rad/s';
        } else {
            unit = '°/s'
        }

        return '<b>' + n.toFixed(3) + ' ' + unit + '</b>';
    }

    Component.onCompleted: gyroscope.activate(Constants.PART_PAGE)
    Component.onDestruction: gyroscope.deactivate(Constants.PART_PAGE)

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                function toggleUnit() {
                    useRad = !useRad;
                }

                text: qsTr("Change unit to " + (useRad ? '°/s' : 'rad/s'))
                onClicked: toggleUnit()
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: qsTr("Gyroscope")
            }
            Label {
                id: xlabel
                font.pixelSize: Theme.fontSizeLarge
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge
                text: 'X: ' + page.formatNumber(gyroscope.rx)
            }
            Label {
                id: ylabel
                font.pixelSize: Theme.fontSizeLarge
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge
                text: 'Y: ' + page.formatNumber(gyroscope.ry)
            }
            Label {
                id: zlabel
                font.pixelSize: Theme.fontSizeLarge
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge
                text: 'Z: ' + page.formatNumber(gyroscope.rz)
            }
        }
    }
}


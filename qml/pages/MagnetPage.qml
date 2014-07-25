import QtQuick 2.0
import Sailfish.Silica 1.0

import "../Constants.js" as Constants

Page {
    id: page

    function formatNumber(n) {
        n *= 1e3;

        return '<b>' + n.toFixed(4) + ' mT</b>';
    }

    function formatPercentage(n) {
        n *= 100;

        return '<b>' + n.toFixed(0) + ' %</b>';
    }

    Component.onCompleted: magnetometer.activate(Constants.PART_PAGE)
    Component.onDestruction: magnetometer.deactivate(Constants.PART_PAGE)

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: qsTr("Magnetometer")
            }
            Label {
                id: xlabel
                font.pixelSize: Theme.fontSizeLarge
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge
                text: 'X: ' + page.formatNumber(magnetometer.mx)
            }
            Label {
                id: ylabel
                font.pixelSize: Theme.fontSizeLarge
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge
                text: 'Y: ' + page.formatNumber(magnetometer.my)
            }
            Label {
                id: zlabel
                font.pixelSize: Theme.fontSizeLarge
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge
                text: 'Z: ' + page.formatNumber(magnetometer.mz)
            }
            Label {
                id: precisionlabel
                font.pixelSize: Theme.fontSizeLarge
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge
                text: 'Precision: ' + page.formatPercentage(magnetometer.precision)
            }
        }
    }
}


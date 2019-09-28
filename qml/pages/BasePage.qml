import QtQuick 2.9
import QtQuick.Controls 2.9

import LunaNext.Common 0.1

Page {
    property SwipeView swipeView: SwipeView.view;
    property string headerText: ""

    header: Label {
        text: qsTr(headerText)
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: FontUtils.sizeToPixels("x-large")
    }

}

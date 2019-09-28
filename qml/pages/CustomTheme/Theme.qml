pragma Singleton

import QtQuick 2.9
import LunaNext.Common 0.1

QtObject {
    property real paddingSmall: Units.gu(1.0)
    property real paddingLarge: Units.gu(2.0)

    property real fontSizeLarge: FontUtils.sizeToPixels("large")

    property color primaryColor: "black"
    property color highlightColor: "red"
    property color secondaryColor: "gray"
    property color secondaryHighlightColor: "blue"
}

import QtQuick
import QtQuick.Controls

Item {
    id: sessionRoot
    width: sessionLabel.implicitWidth + 20
    height: 24

    property bool menuOpen: false
    property int selectedIndex: 0
    property string selectedText: "Session"

    Component.onCompleted: {
            sessionRoot.selectedIndex = (typeof sessionModel !== "undefined" && sessionModel && sessionModel.lastIndex >= 0)
                                    ? sessionModel.lastIndex
                                    : 0
        }

    Rectangle {
        id: currentSessionBox
        anchors.fill: parent
        color: "#80000000"
        radius: 4

        Text {
            id: sessionLabel
            anchors.centerIn: parent
            text: (typeof sessionModel !== "undefined" && sessionModel && sessionModel.rowCount() > 0)
                  ? (sessionModel.data(sessionModel.index(sessionRoot.selectedIndex, 0), Qt.UserRole + 4) || "Session")
                  : "Session"
            color: "#e8e8e8"
            font.pixelSize: 10
            font.weight: Font.Medium
            font.capitalization: Font.AllUppercase
            font.letterSpacing: 1
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: sessionRoot.menuOpen = !sessionRoot.menuOpen
        }
    }

    Rectangle {
        id: menuPopup
        width: 190

        height: (typeof sessionModel !== "undefined" && sessionModel && sessionModel.rowCount() > 0)
                        ? (sessionModel.rowCount() <= 3 ? (sessionModel.rowCount() * 28) + 4 : 88)
                        : 88

        anchors.top: parent.bottom
        anchors.topMargin: 6
        anchors.left: parent.left
        color: "#F2101010"
        radius: 4
        border.color: "#80000000"
        border.width: 1
        visible: sessionRoot.menuOpen && height > 0
        clip: true
        z: 999

        ListView {
            anchors.fill: parent
            anchors.margins: 2
            model: sessionModel

            delegate: Rectangle {
                width: ListView.view.width
                height: 28
                color: itemMouse.containsMouse ? "#15ffffff" : "transparent"
                radius: 2
            
                Text {
                    anchors.fill: parent
                    leftPadding: 10
                    text: model.name
                    color: index === sessionRoot.selectedIndex ? "#e8e8e8" : "#555555"
                    font.pixelSize: 11
                    font.capitalization: Font.AllUppercase
                    font.letterSpacing: 1
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
            
                MouseArea {
                    id: itemMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        sessionRoot.selectedIndex = index
                        sessionRoot.menuOpen = false
                    }
                }
            }
        }
    }
}

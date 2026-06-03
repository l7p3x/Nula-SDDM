import QtQuick

Text {
    id: userName

    property string nameText: ""

    text: nameText
    color: "white"
    font.pixelSize: 16
    opacity: 1.0

    Behavior on opacity {
        NumberAnimation { duration: 150; easing.type: Easing.OutQuad }
    }

    onTextChanged: {
        opacity = 0
        nameTimer.restart()
    }

    Timer {
        id: nameTimer
        interval: 100
        onTriggered: userName.opacity = 1.0
    }
}

import QtQuick
import QtQuick.Controls

Rectangle {
    id: passwordContainer
    width: 240
    height: 35
    color: "transparent"

    signal loginRequested(string password)

    function clearAndFocus() {
        passwordInput.clear()
        passwordInput.forceActiveFocus()
    }

    function shake() {
        shakeAnimation.start()
    }

    SequentialAnimation {
        id: shakeAnimation
        NumberAnimation { target: shakeTransform; property: "x"; to: -10; duration: 50 }
        NumberAnimation { target: shakeTransform; property: "x"; to: 10; duration: 50 }
        NumberAnimation { target: shakeTransform; property: "x"; to: -10; duration: 50 }
        NumberAnimation { target: shakeTransform; property: "x"; to: 10; duration: 50 }
        NumberAnimation { target: shakeTransform; property: "x"; to: 0; duration: 50 }
    }

    transform: Translate {
        id: shakeTransform
        x: 0
    }

    TextField {
        id: passwordInput
        anchors.fill: parent
        placeholderText: "Password"
        echoMode: TextInput.Password
        font.pixelSize: 14
        leftPadding: 12
        palette.text: "#e8e8e8"
        palette.placeholderText: "#e8e8e8"

        background: Rectangle {
            color: "#80000000"
            radius: 4
        }

        onAccepted: passwordContainer.loginRequested(text)
    }
}

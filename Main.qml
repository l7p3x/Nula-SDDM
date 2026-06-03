import QtQuick
import "components"

Rectangle {
    id: root
    width: 1920
    height: 1080

    property int selectedIndex: userModel.lastIndex
    property int centerSize: parseInt(config.AvatarSize)
    property int sideSize: Math.round(centerSize * 0.58)
    property int gap: 28
    property string currentUserName: userModel.data(userModel.index(selectedIndex, 0), 257) || ""

    Component.onCompleted: passwordField.clearAndFocus()

    Image {
        anchors.fill: parent
        source: "assets/background.png"
        fillMode: Image.PreserveAspectCrop
    }

    Connections {
        target: sddm

        function onLoginFailed() {
            errorMessage.opacity = 0
            errorMessage.text = "Incorrect password. Try again."
            passwordField.clearAndFocus()
            passwordField.shake()
            errorRevealTimer.restart()
        }

        function onLoginSucceeded() {
            errorRevealTimer.stop()
            errorMessage.opacity = 0
            errorMessage.text = ""
        }
    }

    Timer {
        id: errorRevealTimer
        interval: 300
        repeat: false
        onTriggered: errorMessage.opacity = 1
    }

    SystemButtons {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 40
        z: 100
    }

    Column {
        id: loginColumn
        anchors.centerIn: parent
        spacing: 16
        z: 1

        UserCarousel {
            anchors.horizontalCenter: parent.horizontalCenter
            selectedIndex: root.selectedIndex
            centerSize: root.centerSize
            sideSize: root.sideSize
            gap: root.gap
            defaultAvatarPath: Qt.resolvedUrl(config.AvatarPath)
            onUserSelected: function(index) { root.selectedIndex = index }
        }

        PasswordField {
            id: passwordField
            anchors.horizontalCenter: parent.horizontalCenter
            onLoginRequested: function(password) {
                sddm.login(root.currentUserName, password, sessionSelector.selectedIndex)
            }
            onTypingStarted: {
                errorRevealTimer.stop()
                errorMessage.opacity = 0
            }
        }

        Item {
            width: 1
            height: 12
        }

        Text {
            id: errorMessage
            text: ""
            opacity: 0
            color: "#c8922a"
            font.pixelSize: 12
            font.weight: Font.Medium
            anchors.horizontalCenter: parent.horizontalCenter
            Behavior on opacity { NumberAnimation { duration: 200 } }
        }
    }

    // ── SESSION SELECTOR ──────────────────────────
    SessionSelector {
        id: sessionSelector
        x: loginColumn.x + passwordField.x
        y: loginColumn.y + passwordField.y + passwordField.height + 4
        z: 10
    }

    MouseArea {
        anchors.fill: parent
        z: 0
        enabled: sessionSelector.menuOpen
        onClicked: sessionSelector.menuOpen = false
    }

    onSelectedIndexChanged: {
        errorRevealTimer.stop()
        errorMessage.opacity = 0
        errorMessage.text = ""
        passwordField.clearAndFocus()
    }
}

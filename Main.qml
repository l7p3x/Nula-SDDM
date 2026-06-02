import QtQuick 2.15
import "components/"

Rectangle {
    id: root
    width: 1920
    height: 1080

    property int selectedIndex: userModel.lastIndex
    property int centerSize: parseInt(config.AvatarSize)
    property int sideSize: Math.round(centerSize * 0.58)
    property int gap: 28
    property string currentUserName: userModel.data(userModel.index(selectedIndex, 0), Qt.DisplayRole) || ""

    Component.onCompleted: passwordField.clearAndFocus()

    Image {
        anchors.fill: parent
        source: "assets/background.png"
        fillMode: Image.PreserveAspectCrop
    }

    Connections {
        target: sddm
        function onLoginFailed() {
            errorMessage.text = "Login failed. Please try again."
            passwordField.clearAndFocus()
            passwordField.shake()
        }
        function onLoginSucceeded() { errorMessage.text = "" }
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
        }

        Text {
            id: errorMessage
            text: ""
            color: "#c8922a"
            font.pixelSize: 12
            font.weight: Font.Medium
            anchors.horizontalCenter: parent.horizontalCenter
            Behavior on opacity { NumberAnimation { duration: 150 } }
        }
    }

    // ── SESSION SELECTOR ──────────────────────────
    SessionSelector {
        id: sessionSelector
        x: loginColumn.x + passwordField.x
        y: loginColumn.y + passwordField.y + passwordField.height + 4
        z: 10
    }

    // ── Fecha menu ao clicar fora ──────────────────────────
    MouseArea {
        anchors.fill: parent
        z: 0
        enabled: sessionSelector.menuOpen
        onClicked: sessionSelector.menuOpen = false
    }

    onSelectedIndexChanged: {
        errorMessage.text = ""
        passwordField.clearAndFocus()
    }
}

import QtQuick
import QtQuick.Controls

Row {
    spacing: 6

    // System Suspend
    Button {
        id: suspendBtn
        display: AbstractButton.IconOnly
        width: 34
        height: 34
        icon.source: "../assets/suspend.svg"
        icon.color: "white"
        icon.width: 24
        icon.height: 24
        flat: true
        onClicked: sddm.suspend()
        hoverEnabled: true
        ToolTip.visible: hovered
        ToolTip.text: "Suspend"
        background: Rectangle {
            color: suspendBtn.hovered ? "#20ffffff" : "transparent"
            radius: 8
            Behavior on color { ColorAnimation { duration: 120 } }
        }
    }

    // System Reboot
    Button {
        id: rebootBtn
        display: AbstractButton.IconOnly
        width: 34
        height: 34
        icon.source: "../assets/reboot.svg"
        icon.color: "white"
        icon.width: 24
        icon.height: 24
        flat: true
        onClicked: sddm.reboot()
        hoverEnabled: true
        ToolTip.visible: hovered
        ToolTip.text: "Reboot"
        background: Rectangle {
            color: rebootBtn.hovered ? "#20ffffff" : "transparent"
            radius: 8
            Behavior on color { ColorAnimation { duration: 120 } }
        }
    }

    // System Shutdown
    Button {
        id: shutdownBtn
        display: AbstractButton.IconOnly
        width: 34
        height: 34
        icon.source: "../assets/shutdown.svg"
        icon.color: "white"
        icon.width: 24
        icon.height: 24
        flat: true
        onClicked: sddm.powerOff()
        hoverEnabled: true
        ToolTip.visible: hovered
        ToolTip.text: "Shut Down"
        background: Rectangle {
            color: shutdownBtn.hovered ? "#20ffffff" : "transparent"
            radius: 8
            Behavior on color { ColorAnimation { duration: 120 } }
        }
    }
}

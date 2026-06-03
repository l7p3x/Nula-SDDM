import QtQuick
import QtQuick.Controls

Row {
    spacing: 10

    // System Suspend
    Button {
        display: AbstractButton.IconOnly
        icon.source: "../assets/suspend.svg"
        icon.color: "white"
        flat: true
        onClicked: sddm.suspend()
        hoverEnabled: true
        ToolTip.visible: hovered
        ToolTip.text: "Suspend"
        background: Rectangle { color: "transparent" }
    }

    // System Reboot
    Button {
        display: AbstractButton.IconOnly
        icon.source: "../assets/reboot.svg"
        icon.color: "white"
        flat: true
        onClicked: sddm.reboot()
        hoverEnabled: true
        ToolTip.visible: hovered
        ToolTip.text: "Reboot"
        background: Rectangle { color: "transparent" }
    }

    // System Shutdown
    Button {
        display: AbstractButton.IconOnly
        icon.source: "../assets/shutdown.svg"
        icon.color: "white"
        flat: true
        onClicked: sddm.powerOff()
        hoverEnabled: true
        ToolTip.visible: hovered
        ToolTip.text: "Shut Down"
        background: Rectangle { color: "transparent" }
    }
}

import QtQuick 2.15
import QtQuick.Controls 2.15

Row {
    spacing: 10

    // System Suspend
    Button {
        display: AbstractButton.IconOnly
        icon.name: "system-suspend"
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
        icon.name: "system-reboot"
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
        icon.name: "system-shutdown"
        icon.color: "white"
        flat: true
        onClicked: sddm.powerOff()
        hoverEnabled: true
        ToolTip.visible: hovered
        ToolTip.text: "Shut Down"
        background: Rectangle { color: "transparent" }
    }
}

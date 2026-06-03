import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: carousel

    property int selectedIndex: 0
    property int centerSize: 100
    property int sideSize: 58
    property int gap: 28

    width: sideSize + gap + centerSize + gap + sideSize
    height: centerSize + 30

    signal userSelected(int index)

    property url defaultAvatarPath: ""

    Repeater {
        model: userModel
        delegate: Item {
            property int dist: index - carousel.selectedIndex
            visible: Math.abs(dist) <= 2

            property int sz: dist === 0 ? carousel.centerSize : carousel.sideSize

            width: sz
            height: sz
            opacity: {
                if (dist === 0) return 1.0
                if (Math.abs(dist) === 1) return 0.4
                return 0.0
            }

            x: {
                if (dist < 0) {
                    return (dist + 1) * (carousel.sideSize + carousel.gap)
                } else if (dist === 0) {
                    return carousel.sideSize + carousel.gap
                } else {
                    return carousel.sideSize + carousel.gap + carousel.centerSize + carousel.gap + (dist - 1) * (carousel.sideSize + carousel.gap)
                }
            }

            y: (carousel.centerSize - sz) / 2

            Behavior on x { NumberAnimation { duration: 300; easing.type: Easing.OutCubic } }
            Behavior on y { NumberAnimation { duration: 300; easing.type: Easing.OutCubic } }
            Behavior on width { NumberAnimation { duration: 300; easing.type: Easing.OutCubic } }
            Behavior on height { NumberAnimation { duration: 300; easing.type: Easing.OutCubic } }
            Behavior on opacity { NumberAnimation { duration: 300; easing.type: Easing.OutCubic } }

            Image {
                id: avatarImg
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                smooth: true
                mipmap: true
                visible: false
                source: (model.icon && model.icon.indexOf("AccountsService") !== -1)
                        ? model.icon
                        : carousel.defaultAvatarPath
                onStatusChanged: {
                    if (status === Image.Error)
                        source = carousel.defaultAvatarPath
                }
            }

            Rectangle {
                id: circleMask
                anchors.fill: parent
                radius: width / 2
                antialiasing: true
                layer.enabled: true
                visible: false
            }

            Text {
                id: userNameText
                text: model.name
                color: "white"
                font.pixelSize: 14
                font.weight: Font.Medium
                anchors.top: circleMask.bottom
                anchors.topMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter

                opacity: dist === 0 ? 1.0 : 0.0
                Behavior on opacity { NumberAnimation { duration: 250 } }
            }

            OpacityMask {
            	anchors.fill: parent
                source: avatarImg
                maskSource: circleMask
            }

            Rectangle {
                anchors.fill: parent
                radius: width / 2
                color: "transparent"
                antialiasing: true
                border.color: dist === 0 ? config.BorderColor : "transparent"
                border.width: dist === 0 ? parseInt(config.BorderWidth) : 0

                Behavior on border.width {
                    NumberAnimation { duration: 200; easing.type: Easing.OutQuad }
                }
            }

            MouseArea {
                anchors.fill: parent
                enabled: dist !== 0
                cursorShape: dist !== 0 ? Qt.PointingHandCursor : Qt.ArrowCursor
                onClicked: carousel.userSelected(index)
            }
        }
    }
}

import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

import Example 1.0

Shape{
    id: card
    radius: medium

    property alias imageSource: imagenes.source


    Image{
        id: imagenes
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: parent.height
        fillMode: Image.PreserveAspectFit
    }

    Flipable{
        id: flipable

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: parent.height

        property bool flipped: false

        front: Rectangle {
            color: "yellow"
            anchors.fill: parent
        }
        back: imagenes

//        front: Image { source: "../assets/sheep.svg" ; anchors.centerIn: parent }
//        back: Image { source: "../assets/cow.svg"; anchors.centerIn: parent }

        transform: Rotation {
            id: rotation
            origin.x: flipable.width/2
            origin.y: flipable.height/2
            axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
            angle: 0    // the default angle
        }

       states: State {
            name: "back"
            PropertyChanges { target: rotation; angle: 180 }
            when: flipable.flipped
        }

        transitions: Transition {
            NumberAnimation { target: rotation; property: "angle"; duration: 1000 }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: flipable.flipped = !flipable.flipped
        }

    }
}

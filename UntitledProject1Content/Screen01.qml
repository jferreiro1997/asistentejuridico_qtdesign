

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import UntitledProject1

Rectangle {
    id: rectangle
    width: 281
    height: 500
    color: "#001e3d"
    radius: 0
    border.color: "#ffffff"
    border.width: 0
    property bool isDialogEmpty: true



    Text {
        id: titulo
        x: 16
        y: 479
        color: "#d6eaff"
        text: qsTr("To Do's")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.topMargin: 24
        font.letterSpacing: 1.5
        font.pixelSize: 32
        verticalAlignment: Text.AlignTop
        font.weight: Font.Black
        font.family: "Verdana"
    }


    Column {
        id: column
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.topMargin: 80
        anchors.bottomMargin: 50


        Repeater {
            id: repeater
            anchors.fill: parent

            Rectangle {
                id: todo_item
                x: 8
                y: 85
                height: 45
                color: "#779dc5"
                radius: 5
                border.color: "#ffffff"
                border.width: 2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 85
                CheckBox {
                    id: checkBox
                    text: qsTr("")
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    tristate: false
                    display: AbstractButton.IconOnly
                    checkable: true
                    checkState: Qt.Unchecked
                }
            }
        }
    }


    Rectangle {
        id: input_container
        y: 455
        width: 201
        height: 35
        color: "#ffffff"
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 8
        anchors.bottomMargin: 10

        TextField {
            id: textField
            anchors.fill: parent
            anchors.leftMargin: 3
            anchors.rightMargin: 3
            anchors.topMargin: 1
            anchors.bottomMargin: 1
            placeholderText: qsTr("Text Field")
        }
    }






    Button {
        id: new_btn
        x: 215
        y: 455
        width: 54
        height: 35
        text: qsTr("➡️")
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 12
        anchors.bottomMargin: 10
        font.pointSize: 18
        display: AbstractButton.TextOnly
        highlighted: false
    }


    Connections {
        target: rectangle
        onActiveFocusChanged: console.log("clicked")
    }


}

import QtQuick
import QtQuick.Controls
import UntitledProject1
import QtQuick.Studio.DesignEffects

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
        spacing: 8


        Repeater {
            id: repeater
            anchors.fill: parent
            model: ListModel{
                id: myListModel

                ListElement{
                    name:"Prueba"
                }

                function createListElement(){
                    return {
                        "name": textField.text,
                    }
                }
                function destroyListElement(nombre){
                    for (let i = 0; i < myListModel.count; i++) {
                        if (myListModel.get(i).name === itemName) {
                            myListModel.remove(i);  // Remove the item at index i
                            break;  // Exit the loop once the item is found
                        }
                    }
                }
            }

            Rectangle {
                id: todo_item
                height: 44
                visible: true
                width: parent.width
                color: "#779dc5"
                radius: 5
                border.color: "#ffffff"
                border.width: 2
                CheckBox {
                    id: pendiente_check
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

                Text {
                    id: pendiente_texto
                    text: name
                    anchors.left: parent.left
                    anchors.fill: parent
                    anchors.leftMargin: 33
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.DemiBold
                }

                Button {
                    id: button
                    x: 8
                    y: 12
                    width: 20
                    height: 20
                    text: "X"
                    font.weight: Font.Bold
                    font.bold: true
                    display: AbstractButton.TextOnly
                    background: Rectangle{
                        color:"red"
                    }
                    contentItem: Text{
                        text: "X"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Bold
                        color: "white"
                    }

                    Connections {
                        target: button
                        onClicked: console.log(pendiente_texto.text);
                    }
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

        Connections {
            target: new_btn
            onClicked: if (textField.text !== "") {
                           myListModel.append(myListModel.createListElement())
                           textField.text = ""
                       } else {
                           console.log("Nuevo Pendiente Vacío")
                       }
        }
    }



}

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import MyModule 1.0

ApplicationWindow {
    visible: true
    width: 600
    height: 400
    title: "Онлайн Кинотеатр"
    color: "black"
    visibility: Window.FullScreen
    property bool fullscreen: true

    BackEnd{
        id: backEnd
    }
    Button {
            text: "Вихід"
            Material.foreground: "red"
            anchors {
                top: parent.top
                right: parent.right
                margins: 1
            }
            onClicked: Qt.quit()
            z: 99
    }
    Button {
            text: "Профіль"
            Material.foreground: "red"
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: 100
            onClicked: stackView.push(user)
            z: 99
    }
    Rectangle {
        width: parent.width
        height: 50
        color: "#ff6400"
        Text {
            text: "Онлайн Кінотеатр"
            font.family: "Times New Roman"
            font.pixelSize: 28
            color: "#FFFFFF"
        }
        anchors {
            top: parent.top
        }
        z: 98
    }

    // Стек для управления страницами
    StackView {
        id: stackView
        anchors.fill: parent
        anchors.topMargin: 50
        initialItem: mainPage
    }
    // Основная страница с сеансами
    Item {
        id: mainPage
        visible: false
        ListView {
            width: parent.width
            height: parent.height
            model: backEnd.getMovisListModel()
            delegate: Item {
                width: parent.width
                height: 50
                Rectangle {
                    border.color: "black"
                    border.width: 1
                    anchors {
                        left: parent.left
                        margins: 1
                    }
                    id: listMovie
                    width: parent.width / 3
                    height: 50
                    color: "Red"
                    Text {
                        anchors.centerIn: listMovie
                        text: model.itemName
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("onClicked")
                            stackView.push(movieDetailsPage)
                        }
                    }
                }
            }
        }
    }
    // Страница с подробной информацией о фильме
    Item {
        id: movieDetailsPage
        visible: false
        ListModel{
            id:session

        }

        ListModel{
            id:reviews

        }

        Rectangle {
            width: parent.width
            height: parent.height
            color: "#000000"
            Text {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 20
                font.family: "Times New Roman"
                font.pixelSize: 46
                text: "Сеанси"
                color: "#FFFFFF"
                z: 96
            }
            Rectangle{//список сеансов
                anchors.topMargin: 40
                anchors.right: parent.right
                width: parent.width / 2
                height: parent.height
                color: "#AAAAAA"
                //mode :
                ListView {

                }
            }
            Rectangle{//отзывы
                color: "#BBBBBB"
                anchors.topMargin: 40
                width: parent.width / 2
                height: parent.height
                anchors.left: parent.left
                ListView {

                }
            }
        }
        Button {
            anchors {
                top: parent.top
                right: parent.right
                margins: 20
            }
            text: "Назад"
            onClicked: stackView.push()
        }
    }
    //страница пользывателя
    Item {
        id: user
        visible: false
        Rectangle {
            width: parent.width
            height: parent.height
            color: "#000000"
            Text {
                id: textButt
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 90
                color: "#FFFFFF"
            }
            Rectangle {
                anchors{
                    centerIn: parent
                }
                TextField {
                    id:nameUsr
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 10
                    width: 200
                    background: Rectangle {
                        color: "#FFFFFF"
                        radius: 5
                    }
                    placeholderText: qsTr("Ваше Ім'я")
                    onTextChanged: console.log("Введен текст:", text)
                }
                TextField {
                    id:email
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 90
                    width: 200
                    background: Rectangle {
                        color: "#FFFFFF"
                        radius: 5
                    }
                    placeholderText: qsTr("Ваша пошта")
                }
                Row {
                    anchors {
                        bottom: parent.bottom
                        horizontalCenter: parent.horizontalCenter
                        margins: 20
                    }
                    Button {
                        text: "Вхід"
                        anchors.bottomMargin: 20;
                        onClicked:{
                            nameUsr.text = ""
                            email.text = ""
                            if(backEnd.sendFindUsr(nameUsr.text, email.text))
                            {
                                textButt.text = "Вхід"
                            }
                            else
                            {
                                textButt.text = "профіль не знайдено"
                            }
                        }
                    }
                    Button {
                        text: "Реєстрація"
                        anchors.bottomMargin: 20;
                        onClicked: {
                                backEnd.sendRedUsr(nameUsr.text, email.text)
                                nameUsr.text = ""
                                email.text = ""
                                textButt.text = "Реєстрація"
                        }
                    }
                }
            }
        }
        Button {
            anchors {
                top: parent.top
                right: parent.right
                rightMargin: 120
            }
            text: "Вихід з ак."
            onClicked: {
                textButt.text = "Вихід з ак."
            }
        }
        Button {
            anchors {
                top: parent.top
                right: parent.right
                rightMargin: 250
            }
            text: "Адмін панель"
            onClicked: {
                stackView.push(admin)
            }
        }
        Button {
            anchors {
                top: parent.top
                right: parent.right
                rightMargin: 20
            }
            text: "Назад"
            onClicked: stackView.pop()
        }
    }
    //страница админ панели
    Item {
        id: admin
        visible: false
        Rectangle {
            anchors{
                left: parent.left
                leftMargin: 100
            }
            TextField {
                id: name
                anchors.top: parent.top
                anchors.topMargin: 10
                width: 200
                background: Rectangle {
                    color: "#FFFFFF"
                    radius: 5
                }
                placeholderText: qsTr("Назва фільму")
                onTextChanged: console.log("Введен текст:", text)
            }
            TextField {
                id: release
                anchors.top: parent.top
                anchors.topMargin: 90
                width: 200
                background: Rectangle {
                    color: "#FFFFFF"
                    radius: 5
                }
                placeholderText: qsTr("Рік релізу фільма")
                onTextChanged: console.log("Введен текст:", text)
            }
            TextField {
                id: genre
                anchors.top: parent.top
                anchors.topMargin: 180
                width: 200
                background: Rectangle {
                    color: "#FFFFFF"
                    radius: 5
                }
                placeholderText: qsTr("Жанр фільма")
                onTextChanged: console.log("Введен текст:", text)
            }
            TextField {
                id: director
                anchors.top: parent.top
                anchors.topMargin: 270
                width: 200
                background: Rectangle {
                    color: "#FFFFFF"
                    radius: 5
                }
                placeholderText: qsTr("Режисер фільмі")
                onTextChanged: console.log("Введен текст:", text)
            }
            Button {
                anchors {
                    top: parent.top
                    left: parent.left
                    topMargin: 360
                }
                text: "Додати фільм до бд"
                onClicked: {
                    backEnd.sendRedMov(name.text, release.text, genre.text, director.text)
                    name.text = ""
                    release.text = ""
                    genre.text = ""
                    director.text = ""
                }
            }
        }
        Button {
            anchors {
                top: parent.top
                right: parent.right
                margins: 20
            }
            text: "Назад"
            onClicked: stackView.push(mainPage)
        }
    }
}

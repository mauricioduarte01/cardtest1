import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

import Example 1.0

////CPP Implementation
//void MemoryGame::start(){

//	while (true) {
//		    srand((unsigned int) time(nullptr));
//	    //Number of columns and rows
//	    for (int row = 0; row < 4; row++) {
//		for (int column = 0; column < 4; column++) {
//		    //Initialize a random matrix
//		    matrix[row][column] = rand() % 8 + 1;
//		    matrix2[row][column] = false;


MainView {
    id: cards_game
    objectName: 'mainView'
    applicationName: 'apptest.md'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)


    Component.onCompleted: start()

    //2D Array
    property var cards: [cow, cow2, sheep, sheep2]
    property var colors: ["red", "green"]
    var cards = cards_game.cards
    
    //La funcion shuffle recive un "value" como parametro
    //typical swap function
    function shuffle (value) {
        var i = value.length, j, temp
        if (i === 0)
            return false
        while (--i) {
            j = Math.floor (Math.random() * (i + 1))
            temp = value[i]
            value[i] = value[j]
            value[j] = temp
        }
    }

    function start() {
        var cards = cards_game
        shuffle (cards)
        for (var i = 0; i < cards.length; i++) {
            cards[i].color = cards_game.colors[Math.floor (i / 2)]
        }
    }


    Grid{
        id: grilla
        anchors.fill: parent
        height: 5; width: 10
        rows: 2; columns: 2

        spacing: 2

        Card{
            id: cow
            height: 100
            width: 100
            imageSource: "../assets/cow.svg"
            color: "green"

        }
        Card{
            id: sheep
            height: 100
            width: 100
            imageSource: "../assets/sheep.svg"
            color: "red"

        }
        Card{
            id: cow2
            height: 100
            width: 100
            imageSource: "../assets/cow.svg"
            color: "green"
        }
        Card{
            id: sheep2
            height: 100
            width: 100
            imageSource: "../assets/sheep.svg"
            color: "red"

        }

    }
}

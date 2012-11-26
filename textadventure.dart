import 'dart:io';

/**
 * ROOMS
 */

/**
 * base room
 */
abstract class Room {
  String description;
  Room match(String direction);
}


class RoomStore extends Room implements Room {
  RoomStore() {
    this.description = 'Store Room';
  }

  Room match(String direction) {
    switch (direction) {
      case 'west':
      case 'door':
      case 'closet':
        return new RoomHide();

      case 'east':
      case 'kitchen':
        return new RoomKitchen();

      case 'south':
      case 'hall':
        return new RoomHall();
    }

    return null;
  }
}


class RoomHide extends Room implements Room {
  RoomHide() {
    this.description = 'Hidden Room';
  }

  Room match(String direction) {

  }
}


class RoomKitchen extends Room implements Room {
  RoomKitchen() {
    this.description = 'Kitchen';
  }

  Room match(String direction) {

  }
}


class RoomHall extends Room implements Room {
  RoomHall() {
    this.description = 'Hall';
  }

  Room match(String direction) {

  }
}


class RoomStudy extends Room implements Room {
  RoomStudy() {
    this.description = 'Study Room';
  }

  Room match(String direction) {

  }
}


class RoomCloset extends Room implements Room {
  RoomCloset() {
    this.description = 'Closet';
  }

  Room match(String direction) {

  }
}


/**
 * PLAYER
 */
class Player {
  Room location;

  Player() {
    this.location= new RoomStore();
  }

  go(direction) {
    Room newRoom = location.match(direction);
    if (newRoom != null) {
      this.location = newRoom;
      print('you are now in ${this.location.description}');
    }
  }
}



void main() {
  Player player = new Player();
  StringInputStream input = new StringInputStream(stdin);

  input.onLine = () {
    String line = input.readLine();
    if (line.startsWith('go')) {
      player.go(line.substring(line.indexOf('go ')+3));
    }
  };
}

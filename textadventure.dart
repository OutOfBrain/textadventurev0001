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
  var description = 'Store Room';

  RoomStore() {
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
  var description = 'Hidden Room';

  Room match(String direction) {

  }
}


class RoomKitchen extends Room implements Room {
  var description = 'Kitchen';

  Room match(String direction) {

  }
}


class RoomHall extends Room implements Room {
  var description = 'Hall';

  Room match(String direction) {

  }
}


class RoomStudy extends Room implements Room {
  var description = 'Study Room';

  Room match(String direction) {

  }
}


class RoomCloset extends Room implements Room {
  var description = 'Closet';

  Room match(String direction) {

  }
}


/**
 * PLAYER
 */
class Player {
  Room location;

  Player() {
    this.location = new RoomStore();
  }

  go(direction) {
    Room newRoom = location.match(direction[0]);
    if (newRoom != null) {
      this.location = newRoom;
      print('you are now in ${this.location.description}');
    }
    else {
      print('you did not move');
    }
  }
}


/**
 * GAME
 */
class Game {
  Player player = new Player();

  Game() {

  }


  /**
   * dispatches commands from the player to actions fo change the game world
   */
  dispatch(var cmd) {
    var function = (parameter) => print('no valid action');

    // find base command and call accourding action
    cmd = cmd.split(' ');

    switch (cmd[0]) {
      case 'go':
      case 'move':
        function = this.go;
        break;

      case 'look':
      case 'desc':
      case 'describe':
        function = this.look;
        break;
    }

    // remove cmd do the params are left over
    cmd.removeAt(0);
    var params = cmd;

    // call found action
    function(params);
  }


  // move to another room
  go(params) {
    player.go(params);
  }

  // look at, in something or around
  look(params) {
    print(params);
  }
}


void main() {
  Game game = new Game();
  StringInputStream input = new StringInputStream(stdin);

  input.onLine = () {
    String line = input.readLine();
    game.dispatch(line);
  };
}

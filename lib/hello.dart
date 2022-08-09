import 'dart:math';
import 'dart:io';

import 'game.dart'; //import มา

void main(){
  var game = Game();
  int result = 0;

  do {
    stdout.write('Please guess the number between 1 and 100 : '); //เหมือน print()
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);

    if(guess == null){
      print('Please enter number only');
      continue;
    }

    result = game.doGuess(guess);
    while(result == 1){
      stdout.write('Do you want to play again? (Y/N) : ');
      String? ans = stdin.readLineSync();

        if (ans == 'Y') {
          game = Game(); //สุ่มเลขใหม่
          result = 0;

        } else if (ans == 'N') {
          break;
        } else {
          print('Please enter (Y/N) only');
          result = 1;
        }
    }
  }while(result != 1);
}

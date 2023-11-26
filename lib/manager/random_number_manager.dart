import 'dart:math';

class RandomNumber {
  late int _randomNumber;
  bool found = false;

  int get randomNumber => _randomNumber;

  RandomNumber() {
    resetNumber();
    found = false;
  }

  void resetNumber() {
    _randomNumber = Random().nextInt(100) + 1;
    print(_randomNumber);
  }

  Order guessNumber(int guess) {
    if (guess > _randomNumber) {
      return Order.greater;
    } else if (guess < _randomNumber) {
      return Order.lower;
    }
    found = true;
    return Order.equal;
  }
}

enum Order { lower, equal, greater }

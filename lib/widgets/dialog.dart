import 'package:atelier_digital_tema2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.callbackOnPressed1,
    required this.callbackOnPressed2,
    required this.number,
  });

  final void Function() callbackOnPressed1;
  final void Function() callbackOnPressed2;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const TextWidget(
            message: 'You guessed it right!',
            size: 28,
          ),
          const SizedBox(height: 15),
          TextWidget(
            message: 'It was $number',
            size: 20,
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: callbackOnPressed1,
                child: const Text(
                  'Try again!',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: callbackOnPressed2,
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

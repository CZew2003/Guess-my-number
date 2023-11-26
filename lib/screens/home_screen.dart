import 'package:atelier_digital_tema2/manager/random_number_manager.dart';
import 'package:atelier_digital_tema2/widgets/card_widget.dart';
import 'package:atelier_digital_tema2/widgets/dialog.dart';
import 'package:atelier_digital_tema2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  bool showError = false;
  final RandomNumber randomNumber = RandomNumber();
  Order order = Order.equal;
  bool textFieldEnabled = true;
  int? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Guess my number',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 4.0,
        shadowColor: Theme.of(context).shadowColor,
      ),
      body: ListView(
        children: [
          const TextWidget(
            message: 'I am thinking of a number between from 1 to 100.',
            size: 24,
            paddingHorizontal: 20,
            paddingVertical: 10,
          ),
          const TextWidget(
            message: 'It\'s your turn to guess my number!',
            size: 24,
            paddingVertical: 10,
          ),
          if (order != Order.equal && value != null) ...[
            TextWidget(
              message:
                  'You tried $value \n Try ${order == Order.greater ? 'lower' : 'greater'}',
              size: 32,
              color: Colors.black54,
            ),
          ],
          CardWidget(
            controller: _controller,
            showError: showError,
            callbackOnPress: () {
              if (!textFieldEnabled) {
                setState(() {
                  textFieldEnabled = true;
                });
                randomNumber.resetNumber();
                return;
              }
              value = int.tryParse(_controller.text);
              setState(() {
                _controller.clear();
                if (value == null) {
                  showError = true;
                  return;
                }
                showError = false;
                order = randomNumber.guessNumber(value!);
              });
              if (order != Order.equal || value == null) {
                return;
              }
              showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                    child: DialogWidget(
                  callbackOnPressed1: () {
                    setState(() {
                      textFieldEnabled = true;
                    });
                    randomNumber.resetNumber();
                    Navigator.pop(context);
                  },
                  callbackOnPressed2: () {
                    setState(() {
                      textFieldEnabled = false;
                    });
                    Navigator.pop(context);
                  },
                  number: randomNumber.randomNumber,
                )),
              );
            },
            enabled: textFieldEnabled,
          ),
        ],
      ),
    );
  }
}

import 'package:atelier_digital_tema2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool showError;
  final Function() callbackOnPress;
  final bool enabled;

  const CardWidget({
    super.key,
    required this.controller,
    required this.showError,
    required this.callbackOnPress,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        shadowColor: Theme.of(context).colorScheme.shadow,
        elevation: 8,
        surfaceTintColor: Colors.white,
        shape: const RoundedRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TextWidget(
                message: 'Try a number!',
                color: Colors.black54,
                size: 32,
              ),
              TextField(
                autofocus: enabled,
                enabled: enabled,
                controller: controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  errorText: showError ? 'Invalid input' : null,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      width: 2,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FilledButton(
                onPressed: callbackOnPress,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: TextWidget(
                  message: enabled ? 'Guess' : 'Reset',
                  color: Colors.white,
                  size: 18,
                  paddingVertical: 10,
                  paddingHorizontal: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

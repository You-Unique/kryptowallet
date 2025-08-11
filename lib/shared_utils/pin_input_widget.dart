import 'package:flutter/material.dart';
import 'package:kryptowallet/shared_utils/primary_colour.dart';

class PinInputWidget extends StatefulWidget {
  const PinInputWidget({super.key});

  @override
  State<PinInputWidget> createState() => _PinInputWidgetState();
}

class _PinInputWidgetState extends State<PinInputWidget> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (i) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (i) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleTextChange(int index, String value) {
    // Allow only 1 digit (0-9)
    if (value.isNotEmpty && !RegExp(r'^[0-9]$').hasMatch(value)) {
      _controllers[index].clear();
      return;
    }

    // Auto-focus next field if a digit is entered
    if (value.length == 1 && index < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
    // Optional: Unfocus if last field is filled
    else if (value.length == 1 && index == 3) {
      _focusNodes[index].unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        4,
        (index) => SizedBox(
          width: 50,
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold, // Optional: Bold text
            ), // Ensures only 1 character
            decoration: InputDecoration(
              counterText: '', // Hides the character counter
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: KryptoWalletColor2.primaryColor,
                  width: 8,
                ),
              ),
            ),
            onChanged: (value) {
              if (value.length == 4 && RegExp(r'^[0-9]{4}$').hasMatch(value)) {
                for (int i = 0; i < 4; i++) {
                  _controllers[i].text = value[i];
                }
                _focusNodes.last.unfocus();
              } else {
                _handleTextChange(index, value);
              }
            },
          ),
        ),
      ),
    );
  }
}

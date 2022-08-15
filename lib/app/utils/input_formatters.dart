// A Phone Number Formater that formats the phone number to the format XX-XXXXXXX

import 'package:flutter/services.dart';

class PakistanPhoneNumberFormatter extends TextInputFormatter {
  PakistanPhoneNumberFormatter({required this.smaple, required this.separator});

  final String smaple;
  final String separator;
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newValueString = newValue.text;
    if (newValueString.length > 2 && newValueString[2] != separator) {
      // create 2 subsrtings from the newValueString
      final opCode = newValueString.substring(0, 2);
      final number = newValueString.substring(2);
      return TextEditingValue(
        text: '$opCode-$number',
        selection: TextSelection.collapsed(
          offset: newValueString.length + 1,
        ),
      );
    }
    return newValue;
  }
}

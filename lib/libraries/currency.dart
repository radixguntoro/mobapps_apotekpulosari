import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(Object oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    double val = double.parse(newValue.text);
    final newText = NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(val);
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: newText.length
      )
    );
  }
}

class DecimalFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(Object oldValue, TextEditingValue newValue) {
    // if (newValue.selection.baseOffset == 0) {
    //   return newValue;
    // }
    double val = double.parse(newValue.text);
    final newText = NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(val);
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: newText.length
      )
    );
  }
}

class MoneyFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(Object oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    double val = double.parse(newValue.text);
    final newText = NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 1).format(val);
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: newText.length
      )
    );
  }
}
library colorcheck;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class ColorCheckButtonState {
  String color;

  ColorCheckButtonState(String color) {
    this.color = color;
  }

  static int r, g, b;
  static Color currentColor;

  void init() {
    r = int.parse(color.substring(1, 3), radix: 16);
    g = int.parse(color.substring(3, 5), radix: 16);
    b = int.parse(color.substring(5, 7), radix: 16);
    currentColor = Color.fromRGBO(r, g, b, 1);
  }

}

Color getCurrentColor() {
  return ColorCheckButtonState.currentColor;
}

void changeColor() {
  ColorCheckButtonState.b = ColorCheckButtonState.b - 5;
  print(ColorCheckButtonState.currentColor.toString());
  ColorCheckButtonState.currentColor = Color.fromRGBO(ColorCheckButtonState.r,
      ColorCheckButtonState.g, ColorCheckButtonState.b, 1);
}


int getColorHexFromStr(String colorStr) {
  colorStr = "FF" + colorStr;
  colorStr = colorStr.replaceAll("#", "");
  int val = 0;
  int len = colorStr.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = colorStr.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw new FormatException("An error occurred when converting a color");
    }
  }
  return val;
}

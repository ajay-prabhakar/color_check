library colorcheck;

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ColorCheck {
  String color;

  ColorCheck(String color) {
    this.color = color;
  }

  static int r, g, b;
  static Color currentColor;
  static int colorNum;

  void init() {
    color = "FF" + color;
    color = color.replaceAll("#", "");
    int val = 0;
    int len = color.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = color.codeUnitAt(i);
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
    colorNum = val;
    currentColor = Color(colorNum);
    print("hello: " + val.toString());
  }
}

Color getCurrentColor() {
  return ColorCheck.currentColor;
}

void changeColor(int strength) {
  if (strength > 10) {
    print("strength value should be from 1 to 10");
    return;
  }
  if (ColorCheck.colorNum < pow(10, 10)) {
    ColorCheck.colorNum = ColorCheck.colorNum + _getRandomNum(strength);
  } else if (ColorCheck.colorNum <= 0) {
    ColorCheck.colorNum = ColorCheck.colorNum - _getRandomNum(strength);
  }
  print(ColorCheck.colorNum.toString());
  ColorCheck.currentColor = Color(ColorCheck.colorNum);
}

int _getRandomNum(int digitCount) {
  var rnd = new Random();
  var next = rnd.nextDouble() * pow(10, digitCount);
  while (next < pow(10, digitCount-10)) {
    next *= 10;
  }
  return next.toInt();
}

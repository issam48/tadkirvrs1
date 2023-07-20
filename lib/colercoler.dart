import 'package:flutter/material.dart';
hexStringToColor(String hexColor){
  hexColor = hexColor.toLowerCase().replaceAll("#", "");
  hexColor = "ff"+hexColor;
  return Color(int.parse(hexColor,radix:16));
}
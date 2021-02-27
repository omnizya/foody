import 'package:flutter/material.dart';
import 'package:foody/Theme/Color.dart';

String toUpper(String text) => text.toUpperCase();

TextStyle resturantListSwitchText(bool active) => TextStyle(
      color: active ? primaryColor : greyColor,
      fontSize: normalText - 2,
    );

TextStyle resturantListButton() => TextStyle(
      color: primaryColor,
      fontSize: normalText - 2,
    );

TextStyle resturantListTileText() => TextStyle(
      color: Colors.black,
      fontSize: normalText - 2,
      fontWeight: FontWeight.bold,
    );

TextStyle resturantListSubTitleText() => TextStyle(
      color: greyColor,
      fontSize: normalText - 4,
    );

TextStyle detailsTabTitle() => TextStyle(
      fontSize: normalText - 4,
      fontWeight: FontWeight.w500,
    );

import 'package:flutter/material.dart';
import 'package:tazkarti/core/colors/colors.dart';

abstract class FontManeger {
  static const TextStyle smallTitle = TextStyle(
    color: ColorsManeger.gray,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle drawerTitles = TextStyle(
    color: ColorsManeger.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle register = TextStyle(
    color: ColorsManeger.green,
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle bigTitle = TextStyle(
    color: ColorsManeger.black,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle tazkartiIdPass = TextStyle(
    color: Color.fromARGB(255, 116, 115, 115),
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle forget = TextStyle(
    color: ColorsManeger.blue,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle notHaveAcc = TextStyle(
    color: ColorsManeger.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle botton = TextStyle(
    color: ColorsManeger.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle hintStyle = TextStyle(
    color: ColorsManeger.gray,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    
  );
}

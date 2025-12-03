import 'package:flutter/material.dart';
import 'package:tazkarti/core/colors/colors.dart';

abstract class FontManeger {
  static const TextStyle eventName = TextStyle(
    color: ColorsManeger.black,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle eventdetails = TextStyle(
    color: ColorsManeger.black,
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle eventBuy = TextStyle(
    color: ColorsManeger.green,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle bigTitle = TextStyle(
    color: ColorsManeger.black,
    fontSize: 20,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle bottomLinks = TextStyle(
    color: ColorsManeger.white,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle eventTitle = TextStyle(
    color: ColorsManeger.gray,
    fontSize: 18,
    fontWeight: FontWeight.w200,
  );
  static const TextStyle searchBottom = TextStyle(
    color: ColorsManeger.white,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle tazkartiName = TextStyle(
    color: ColorsManeger.black,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle tazkartiId = TextStyle(
    color: ColorsManeger.black,
    fontSize: 12,
    fontWeight: FontWeight.w200,
  );
}

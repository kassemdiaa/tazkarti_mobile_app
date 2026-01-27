import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/colors/colors.dart';

abstract class FontManeger {
  static  TextStyle smallTitle = TextStyle(
    color: ColorsManeger.gray,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
  static  TextStyle drawerTitles = TextStyle(
    color: ColorsManeger.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );
  static  TextStyle register = TextStyle(
    color: ColorsManeger.green,
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
  );
  static  TextStyle bigTitle = TextStyle(
    color: ColorsManeger.black,
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
  );
  static  TextStyle tazkartiIdPass = TextStyle(
    color: Color.fromARGB(255, 116, 115, 115),
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static  TextStyle forget = TextStyle(
    color: ColorsManeger.blue,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );
  static  TextStyle notHaveAcc = TextStyle(
    color: ColorsManeger.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static  TextStyle botton = TextStyle(
    color: ColorsManeger.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );
  static  TextStyle hintStyle = TextStyle(
    color: ColorsManeger.gray,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    
  );
  static  TextStyle name = TextStyle(
    color: ColorsManeger.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    
  );
  static  TextStyle eventDetails = TextStyle(
    color: ColorsManeger.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w300,
    
  );
  static  TextStyle eventlocation = TextStyle(
    color: ColorsManeger.blue,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
    decorationColor: ColorsManeger.blue,
  );
  static  TextStyle homeLinks = TextStyle(
    color: ColorsManeger.blue,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    
  );
static  TextStyle eventBuy = TextStyle(
    color: ColorsManeger.green,
    fontSize: 23.sp,
    fontWeight: FontWeight.w500,
    
  );
  static  TextStyle categoryTitle = TextStyle(
    color: ColorsManeger.gray,
    fontSize: 25.sp,
    fontWeight: FontWeight.w300,
    
  );
  static  TextStyle faqTitle = TextStyle(
    color: ColorsManeger.black,
    fontSize: 28.sp,
    fontWeight: FontWeight.w300,
    
  );
  static  TextStyle aboutTitle = TextStyle(
    color: ColorsManeger.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    
  );
  
  static  TextStyle aboutFooter = TextStyle(
    color: ColorsManeger.black,
    fontSize: 19.sp,
    fontWeight: FontWeight.w500,
    
  );
  static  TextStyle footer = TextStyle(
    color: ColorsManeger.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    
  );
}

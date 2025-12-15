import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';

class FaqHeader extends StatefulWidget {
  const FaqHeader({super.key, required this.headerTitle});
final String headerTitle;
  @override
  State<FaqHeader> createState() => _FaqHeaderState();
}

class _FaqHeaderState extends State<FaqHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.headerTitle, style: FontManeger.faqTitle),
                Divider(color: ColorsManeger.black),
              ],
            ),
          );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/assets/assets.dart';
import 'package:tazkarti/core/colors/colors.dart';

// ignore: must_be_immutable
class ClickedImage extends StatelessWidget {
  bool isSelected;
  String text;
  void Function() onTap;
  ClickedImage({
    super.key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 110.h,
            width: 110.w,
            decoration: BoxDecoration(
              color: ColorsManeger.white,
              borderRadius: BorderRadius.all(Radius.circular(1000.r)),
              border: Border.all(
                color: isSelected ? ColorsManeger.green : Colors.transparent,
                width: 2.w,
              ),
            ),
            child: Image.asset(AssetsManeger.catImage),
          ),
          SizedBox(height: 10.h),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? ColorsManeger.green : ColorsManeger.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

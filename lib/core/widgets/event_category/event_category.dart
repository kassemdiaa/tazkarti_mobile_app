import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/assets/assets.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';

class EventCategory extends StatefulWidget {
  const EventCategory({super.key, required this.categoryName, required this.picPath});
  final String picPath;
final String categoryName;
  @override
  State<EventCategory> createState() => _EventCategoryState();
}

class _EventCategoryState extends State<EventCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color.fromARGB(39, 202, 201, 201), width: 1.5),
      ),
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(widget.picPath),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(widget.categoryName, style: FontManeger.categoryTitle),
          ),
        ],
      ),
    );
  }
}

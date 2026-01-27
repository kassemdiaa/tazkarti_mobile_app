import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/routes/routes.dart';

class EventCategory extends StatefulWidget {
  const EventCategory({
    super.key,
    required this.categoryName,
    required this.picPath,
  });
  final String picPath;
  final String categoryName;
  @override
  State<EventCategory> createState() => _EventCategoryState();
}

class _EventCategoryState extends State<EventCategory> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManeger.categoryScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: const Color.fromARGB(39, 202, 201, 201),
            width: 1.5,
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              child: Image.asset(widget.picPath),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                widget.categoryName,
                style: FontManeger.categoryTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

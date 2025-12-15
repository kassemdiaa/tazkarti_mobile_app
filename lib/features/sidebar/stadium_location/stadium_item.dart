import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/colors/colors.dart';

class StadiumItem extends StatefulWidget {
  const StadiumItem({
    super.key,
    required this.stadiumName,
    required this.stadiumLocation,
    required this.stadiumCity,
  });
  final String stadiumName;
  final String stadiumLocation;
  final String stadiumCity;
  @override
  State<StadiumItem> createState() => _StadiumItemState();
}

class _StadiumItemState extends State<StadiumItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      color: const Color.fromARGB(30, 190, 190, 190),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Text(
              widget.stadiumName,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.stadiumCity,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.location_on,
                      color: ColorsManeger.red,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

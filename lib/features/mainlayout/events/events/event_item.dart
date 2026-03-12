import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
    required this.picPath,
    required this.title,
    required this.numOfShows,
    required this.location,
    required this.day,
    required this.month,
    required this.year,
    required this.price,
  });
  final String picPath;
  final String title;
  final String numOfShows;
  final String location;
  final String day;
  final String month;
  final String year;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 160.h,
            child: Image.asset(picPath,fit: BoxFit.fill,),
          ),
          SizedBox(height: 6.h),
          Text(title, style: FontManeger.name),
          SizedBox(height: 6.h),
          Row(
            children: [
              Text('No. of shows: ', style: FontManeger.eventDetails),
              Text(numOfShows, style: FontManeger.eventDetails),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(Icons.location_on, color: ColorsManeger.red),
              Text(location, style: FontManeger.eventlocation),
            ],
          ),
          SizedBox(height: 6.h),
          Text('$day $month $year', style: FontManeger.eventDetails),
          SizedBox(height: 6.h),
          Row(
            children: [
              Text('Prices From: ', style: FontManeger.eventDetails),
              Text(price, style: FontManeger.eventDetails),
              Text(' EGP', style: FontManeger.eventDetails),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Buy Tickets', style: FontManeger.eventBuy),
              SizedBox(width: 10.w),
            ],
          ),
        ],
      ),
    );
  }
}

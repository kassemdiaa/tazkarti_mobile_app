import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';

class EventItem extends StatefulWidget {
  const EventItem({
    super.key,
    required this.picPath,
    required this.title,
    required this.numOfShows,
    required this.location,
    required this.date,
    required this.price,
  });
  final String picPath;
  final String title;
  final String numOfShows;
  final String location;
  final String date;
  final String price;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(widget.picPath),
          SizedBox(height: 6.h,),
          Text(widget.title, style: FontManeger.name),
          SizedBox(height: 6.h,),
          Row(
            children: [
              Text('No. of shows: ', style: FontManeger.eventDetails),
              Text(widget.numOfShows, style: FontManeger.eventDetails),
            ],
          ),
          SizedBox(height: 6.h,),
          Row(
            children: [
              Icon(Icons.location_on, color: ColorsManeger.red),
              Text(widget.location, style: FontManeger.eventlocation),
            ],
          ),
          SizedBox(height: 6.h,),
          Text(widget.date, style: FontManeger.eventDetails),
          SizedBox(height: 6.h,),
          Row(
            children: [
              Text('Prices From: ', style: FontManeger.eventDetails),
              Text(widget.price, style: FontManeger.eventDetails),
              Text(' EGP', style: FontManeger.eventDetails),
            ],
          ),
          SizedBox(height: 6.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text('Buy Tickets', style: FontManeger.eventBuy),SizedBox(width: 10.w,)],
          ),
          
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/assets/assets.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/widgets/event_category/event_category.dart';
import 'package:tazkarti/core/widgets/event_item/event_item.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(height: 14.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Event Categories', style: FontManeger.bigTitle),
            ],
          ),
        ),
          SizedBox(height: 20.h),
        EventCategory(categoryName: 'categoryName', picPath: AssetsManeger.aliElhagar)
      ],
    );
  }
}

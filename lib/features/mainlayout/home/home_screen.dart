import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/routes/routes.dart';
import 'package:tazkarti/data/models/events_data/event_category_model.dart';
import 'package:tazkarti/data/models/events_data/event_model.dart';
import 'package:tazkarti/data/models/matches_data/match_model.dart';
import 'package:tazkarti/features/mainlayout/events/events/event_item.dart';
import 'package:tazkarti/features/mainlayout/matches/match_item.dart';
import 'package:tazkarti/providers/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:tazkarti/providers/selected_even_provider.dart/selected_event_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<EventModel> _randomEvents;
  late List<MatchModel> _randomMatches;

  @override
  void initState() {
    super.initState();
    _randomEvents = _getRandomEvents();
    _randomMatches = _getRandomMatches();
  }

  List<EventModel> _getRandomEvents() {
    final allEvents = EventCategoryModel.categories
        .expand((category) => category.events)
        .toList();
    allEvents.shuffle(Random());
    return allEvents.take(2).toList();
  }

  List<MatchModel> _getRandomMatches() {
    final allMatches = List<MatchModel>.from(MatchModel.matches);
    allMatches.shuffle(Random());
    return allMatches.take(2).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('Events', style: FontManeger.bigTitle)],
          ),
        ),
        Column(
          children: _randomEvents.map((event) => Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InkWell(
              onTap: () {
                context.read<SelectedEventProvider>().selectEvent(event);
                Navigator.pushNamed(context, RoutesManeger.eventsDeitailsScreen);
              },
              child: EventItem(
                picPath: event.imagePath,
                title: event.name,
                numOfShows: event.numOfShows,
                location: event.location,
                day: event.day,
                month: event.month,
                year: event.year,
                price: event.seating.prices[0].toString(),
              ),
            ),
          )).toList(),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: InkWell(
            onTap: () {
              context.read<BottomNavProvider>().changeIndex(2);
            },
            child: Text('View All Events', style: FontManeger.homeLinks),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('Matches', style: FontManeger.bigTitle)],
          ),
        ),
        SizedBox(height: 8.h),
        Column(
          children: _randomMatches.map((match) => Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: MatchItem(match: match),
          )).toList(),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: InkWell(
            onTap: () {
              context.read<BottomNavProvider>().changeIndex(1);
            },
            child: Text('View All Matches', style: FontManeger.homeLinks),
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
          width: double.infinity,
          color: ColorsManeger.darkGray,
          child: Column(
            children: [
              Wrap(
                spacing: 16.w,
                runSpacing: 8.h,
                children: [
                  Text('Home', style: FontManeger.footer),
                  Text('Stadium Locations', style: FontManeger.footer),
                  Text('Our Stores', style: FontManeger.footer),
                  Text('FAQ', style: FontManeger.footer),
                  Text('About Tazkarti', style: FontManeger.footer),
                  Text('Contact Us', style: FontManeger.footer),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                '© 2023 Tazkarti. All rights reserved.',
                style: TextStyle(color: ColorsManeger.white, fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/providers/bottom_nav_provider/bottom_nav_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('Events', style: FontManeger.bigTitle)],
          ),
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: InkWell(
            onTap: () {
              context.read<BottomNavProvider>().changeIndex(1);
            },
            child: Text('View All Matches', style: FontManeger.homeLinks),
          ),
        ),
        SizedBox(height: 16,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
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
              SizedBox(height: 12.h,),
              Text('© 2023 Tazkarti. All rights reserved.',style: TextStyle(color: ColorsManeger.white,fontSize: 13),)
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/icons/Icons_maneger.dart';
import 'package:tazkarti/core/widgets/header_info/header_info.dart';
import 'package:tazkarti/features/sidebar/drawer.dart';
import 'package:tazkarti/features/sidebar/stadium_location/stadium_item.dart';

class StadiumLocationScreen extends StatefulWidget {
  const StadiumLocationScreen({super.key});

  @override
  State<StadiumLocationScreen> createState() => _StadiumLocationScreenState();
}

class _StadiumLocationScreenState extends State<StadiumLocationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorsManeger.black,
        title: SvgPicture.asset(SvgManeger.logo, width: 70),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Icon(
              CupertinoIcons.globe,
              color: ColorsManeger.white,
              size: 28,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(
            CupertinoIcons.line_horizontal_3,
            color: ColorsManeger.white,
            size: 28,
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          HeaderInfo(),
          SizedBox(height: 16.h),
          Text('Stadiums', style: FontManeger.bigTitle),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            color: const Color.fromARGB(30, 190, 190, 190),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    'Stadium Name',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'City',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          StadiumItem(
            stadiumName: 'Cairo Stadium Sports Hall',
            stadiumLocation: 'loc',
            stadiumCity: 'Cairo',
          ),
          SizedBox(height: 4.h),
          StadiumItem(
            stadiumName: 'New Captial Sports Hall',
            stadiumLocation: 'loc',
            stadiumCity: 'Cairo',
          ),
          SizedBox(height: 4.h),
          StadiumItem(
            stadiumName: 'Hassan Mostafa Sports Hall (6th of October City)',
            stadiumLocation: 'loc',
            stadiumCity: 'Giza',
          ),
          SizedBox(height: 4.h),
          StadiumItem(
            stadiumName: 'Borg Al Arab Sports Hall',
            stadiumLocation: 'loc',
            stadiumCity: 'Alexandria',
          ),
        ],
      ),
    );
  }
}

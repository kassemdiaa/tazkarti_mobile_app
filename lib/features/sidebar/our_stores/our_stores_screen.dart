import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/icons/Icons_maneger.dart';
import 'package:tazkarti/core/widgets/header_info/header_info.dart';
import 'package:tazkarti/features/sidebar/drawer.dart';
import 'package:tazkarti/features/sidebar/our_stores/outlet_item.dart';

class OurStoresScreen extends StatefulWidget {
  const OurStoresScreen({super.key});

  @override
  State<OurStoresScreen> createState() => _OurStoresScreenState();
}

class _OurStoresScreenState extends State<OurStoresScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isExpanded = false;
  bool isExpandedSport = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorsManeger.black,
        title: SvgPicture.asset(SvgManeger.logo, width: 70.w),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Icon(
              CupertinoIcons.globe,
              color: ColorsManeger.white,
              size: 28.sp,
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
            size: 28.sp,
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          HeaderInfo(),
          Text('Our Stores', style: FontManeger.bigTitle),
          SizedBox(height: 20.h),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: isExpanded ? Colors.transparent : ColorsManeger.gray,
                width: 1.5.w,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔒 FIXED HEADER (never moves)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Container(
                    color: isExpanded
                        ? ColorsManeger.green
                        : ColorsManeger.white,
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Entertainment ",
                          style: TextStyle(
                            color: isExpanded
                                ? ColorsManeger.white
                                : ColorsManeger.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: isExpanded
                                ? ColorsManeger.white
                                : ColorsManeger.gray,
                            size: 30.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 👇 ONLY THIS PART EXPANDS
                ClipRect(
                  child: AnimatedAlign(
                    alignment: Alignment.topLeft,
                    heightFactor: isExpanded ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorsManeger.white,
                        border: Border.all(color: ColorsManeger.gray, width: 1.w),
                      ),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 12.h,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    'Dedicated To',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Outlet',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'City',
                                          style: TextStyle(
                                            fontSize: 15.sp,
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
                          //outlets here
                          OutletItem(outletName: 'Orange', city: 'Cairo', dedicatedTo: 'Entertament', distrect: ' Fifth Settlement ', address: ' Down town mall ')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: isExpandedSport
                    ? Colors.transparent
                    : ColorsManeger.gray,
                width: 1.5.w,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔒 FIXED HEADER (never moves)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpandedSport = !isExpandedSport;
                    });
                  },
                  child: Container(
                    color: isExpandedSport
                        ? ColorsManeger.green
                        : ColorsManeger.white,
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Sports ",
                          style: TextStyle(
                            color: isExpandedSport
                                ? ColorsManeger.white
                                : ColorsManeger.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: isExpandedSport
                                ? ColorsManeger.white
                                : ColorsManeger.gray,
                            size: 30.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 👇 ONLY THIS PART EXPANDS
                ClipRect(
                  child: AnimatedAlign(
                    alignment: Alignment.topLeft,
                    heightFactor: isExpandedSport ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorsManeger.white,
                        border: Border.all(color: ColorsManeger.gray, width: 1.w),
                      ),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 12.h,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    'Dedicated To',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Outlet',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'City',
                                          style: TextStyle(
                                            fontSize: 15.sp,
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
                          //outlets here
                          OutletItem(outletName: 'Orange', city: 'Cairo', dedicatedTo: 'Sports', distrect: ' Fifth Settlement ', address: ' Down town mall ')
                        ],
                      ),
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

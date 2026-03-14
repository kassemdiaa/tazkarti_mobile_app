import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/icons/Icons_maneger.dart';
import 'package:tazkarti/features/mainlayout/events/event_deitails/book_ticket_item.dart';
import 'package:tazkarti/data/models/events_data/event_model.dart';
import 'package:tazkarti/features/mainlayout/events/event_deitails/prices_table_widget.dart';
import 'package:tazkarti/features/sidebar/drawer.dart';
import 'package:tazkarti/providers/selected_even_provider.dart/selected_event_provider.dart';

class EventDeitailsScreen extends StatefulWidget {
  const EventDeitailsScreen({super.key});

  @override
  State<EventDeitailsScreen> createState() => _EventDeitailsScreenState();
}

class _EventDeitailsScreenState extends State<EventDeitailsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isExpanded = false;
  bool isExpandedTerms = false;
  @override
  Widget build(BuildContext context) {
    EventModel event = context.read<SelectedEventProvider>().event;
    return Scaffold(
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  width: double.infinity,
                  height: 160.h,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10.r),
                    child: Image.asset(event.imagePath, fit: BoxFit.fill),
                  ),
                ),
                SizedBox(height: 14.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    event.name,
                    style: TextStyle(
                      color: ColorsManeger.black,
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    event.location,
                    style: TextStyle(
                      color: ColorsManeger.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: ColorsManeger.blue,
                        size: 16.sp,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        event.location,
                        style: TextStyle(
                          color: ColorsManeger.blue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    '${event.day} ${event.month} ${event.year}',
                    style: TextStyle(
                      color: ColorsManeger.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                // first expanded
                Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: ColorsManeger.gray),
                      bottom: BorderSide(color: ColorsManeger.gray),
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
                              : Colors.transparent,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                          child: Row(
                            children: [
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
                              SizedBox(width: 4.w),
                              Text(
                                "Ticket Prices",
                                style: TextStyle(
                                  color: isExpanded
                                      ? ColorsManeger.white
                                      : ColorsManeger.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w300,
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
                            margin: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.w,
                            ),
                            child: PricesTableWidget(
                              categories: event.seating.categories,
                              prices: event.seating.prices,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.h),
                // second expanded
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: ColorsManeger.gray),
                      bottom: BorderSide(color: ColorsManeger.gray),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🔒 FIXED HEADER (never moves)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpandedTerms = !isExpandedTerms;
                          });
                        },
                        child: Container(
                          color: isExpandedTerms
                              ? ColorsManeger.green
                              : Colors.transparent,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                          child: Row(
                            children: [
                              AnimatedRotation(
                                turns: isExpandedTerms ? 0.5 : 0.0,
                                duration: const Duration(milliseconds: 200),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: isExpandedTerms
                                      ? ColorsManeger.white
                                      : ColorsManeger.gray,
                                  size: 30.sp,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "Terms of entry",
                                style: TextStyle(
                                  color: isExpandedTerms
                                      ? ColorsManeger.white
                                      : ColorsManeger.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w300,
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
                          heightFactor: isExpandedTerms ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text(event.termsOfEntry)],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),

                BookTicketItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

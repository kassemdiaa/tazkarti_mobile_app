import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/icons/Icons_maneger.dart';
import 'package:tazkarti/core/widgets/header_info/header_info.dart';
import 'package:tazkarti/features/mainlayout/dependents/dependents_screen.dart';
import 'package:tazkarti/features/mainlayout/events/events_screen.dart';
import 'package:tazkarti/features/mainlayout/home/home_screen.dart';
import 'package:tazkarti/features/mainlayout/matches/matches_screen.dart';
import 'package:tazkarti/features/mainlayout/my_tickets/my_tickets_screen.dart';
import 'package:tazkarti/features/sidebar/drawer.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int tapindex = 0;
  List<Widget> taps = [
    const HomeScreen(),
    const MatchesScreen(),
    const EventsScreen(),
    const MyTicketsScreen(),
    const DependentsScreen(),
  ];
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
      body: Column(
        children: [
          const HeaderInfo(),
          Expanded(child: taps[tapindex]),
        ],
      ),
      drawer: CustomDrawer(),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (selectedIndex) {
          tapindex = selectedIndex;
          setState(() {});
        },
        currentIndex: tapindex,
        items: [
          BottomNavigationBarItem(
            icon: tapindex == 0
                ? Column(
                  children: [
                    SvgPicture.asset(
                        SvgManeger.home,
                        width: 30,
                        color: ColorsManeger.black,
                      ),
                      SizedBox(height: 4.h,),
                      Text('Home',style: TextStyle(color: ColorsManeger.black,fontSize: 12.sp),)
                  ],
                )
                : Column(
                  children: [
                    SvgPicture.asset(
                        SvgManeger.home,
                        width: 30,
                        color: ColorsManeger.gray,
                      ),
                      SizedBox(height: 4.h,),
                      Text('Home',style: TextStyle(color: ColorsManeger.gray,fontSize: 12.sp),)
                  ],
                ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: tapindex == 1
                ? Column(
                  children: [
                    SvgPicture.asset(
                        SvgManeger.matches,
                        width: 30,
                        color: ColorsManeger.black,
                      ),
                      SizedBox(height: 4.h,),
                      Text('Matches',style: TextStyle(color: ColorsManeger.black,fontSize: 12.sp),)
                  ],
                )
                : Column(
                  children: [
                    SvgPicture.asset(
                        SvgManeger.matches,
                        width: 30,
                        color: ColorsManeger.gray,
                      ),
                      SizedBox(height: 4.h,),
                      Text('Matches',style: TextStyle(color: ColorsManeger.gray,fontSize: 12.sp),)
                  ],
                ),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: tapindex == 2
                ? Column(
                  children: [
                    SvgPicture.asset(
                        SvgManeger.event,
                        width: 30,
                        color: ColorsManeger.black,
                      ),
                      SizedBox(height: 4.h,),
                      Text('Events',style: TextStyle(color: ColorsManeger.black,fontSize: 12.sp),)
                  ],
                )
                : Column(
                  children: [
                    SvgPicture.asset(
                        SvgManeger.event,
                        width: 30,
                        color: ColorsManeger.gray,
                      ),
                      SizedBox(height: 4.h,),
                      Text('Events',style: TextStyle(color: ColorsManeger.gray,fontSize: 12.sp),)
                  ],
                ),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: tapindex == 3
                ? Column(
                  children: [
                    SvgPicture.asset(
                        SvgManeger.mytickets,
                        width: 30,
                        color: ColorsManeger.black,
                      ),
                      SizedBox(height: 4.h,),
                      Text('My Tickets',style: TextStyle(color: ColorsManeger.black,fontSize: 12.sp),)
                  ],
                )
                : Column(
                  children: [
                    SvgPicture.asset(
                        SvgManeger.mytickets,
                        width: 30,
                        color: ColorsManeger.gray,
                      ),
                      SizedBox(height: 4.h,),
                      Text('My Tickets',style: TextStyle(color: ColorsManeger.gray,fontSize: 12.sp),)
                  ],
                ),
            label: 'My Tickets',
          ),
          BottomNavigationBarItem(
            icon: tapindex == 4
                ? Column(
                  children: [
                    SvgPicture.asset(
                        SvgManeger.dependents,
                        width: 30,
                        color: ColorsManeger.black,
                      ),
                      SizedBox(height: 4.h,),
                      Text('Dependents',style: TextStyle(color: ColorsManeger.black,fontSize: 12.sp),)
                  ],
                )
                : Column(
                  children: [
                    SvgPicture.asset(
                        SvgManeger.dependents,
                        width: 30,
                        color: ColorsManeger.gray,
                      ),
                      SizedBox(height: 4.h,),
                      Text('Dependents',style: TextStyle(color: ColorsManeger.gray,fontSize: 12.sp),)
                  ],
                ),
            label: 'Dependents',
          ),
        ],
      ),
    );
  }
}

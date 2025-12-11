import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/features/mainlayout/dependents/dependents_screen.dart';
import 'package:tazkarti/features/mainlayout/events/events_screen.dart';
import 'package:tazkarti/features/mainlayout/home/home_screen.dart';
import 'package:tazkarti/features/mainlayout/matches/matches_screen.dart';
import 'package:tazkarti/features/mainlayout/my_tickets/my_tickets_screen.dart';

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
      appBar: AppBar(
        backgroundColor: ColorsManeger.black,
        title: SvgPicture.asset('assets/logo1.svg', width: 70),
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
      body: taps[tapindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (selectedIndex) {
          tapindex = selectedIndex;
          setState(() {});
        },
        currentIndex: tapindex,
        items: [
          BottomNavigationBarItem(
            icon: tapindex == 0
                ? const Icon(CupertinoIcons.home, color: ColorsManeger.black)
                : const Icon(CupertinoIcons.home, color: ColorsManeger.gray),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: tapindex == 1
                ? const Icon(CupertinoIcons.home, color: ColorsManeger.black)
                : const Icon(CupertinoIcons.home, color: ColorsManeger.gray),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: tapindex == 2
                ? const Icon(CupertinoIcons.home, color: ColorsManeger.black)
                : const Icon(CupertinoIcons.home, color: ColorsManeger.gray),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: tapindex == 3
                ? const Icon(CupertinoIcons.home, color: ColorsManeger.black)
                : const Icon(CupertinoIcons.home, color: ColorsManeger.gray),
            label: 'My Tickets',
          ),
          BottomNavigationBarItem(
            icon: tapindex == 4
                ? const Icon(CupertinoIcons.home, color: ColorsManeger.black)
                : const Icon(CupertinoIcons.home, color: ColorsManeger.gray),
            label: 'Dependents',
          ),
        ],
      ),
    );
  }
}

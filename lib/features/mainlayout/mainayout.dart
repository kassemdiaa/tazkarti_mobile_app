import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/icons/Icons_maneger.dart';
import 'package:tazkarti/core/widgets/header_info/header_info.dart';
import 'package:tazkarti/features/mainlayout/dependents/dependents_screen.dart';
import 'package:tazkarti/features/mainlayout/events/events_screen.dart';
import 'package:tazkarti/features/mainlayout/home/home_screen.dart';
import 'package:tazkarti/features/mainlayout/matches/matches_screen.dart';
import 'package:tazkarti/features/mainlayout/my_tickets/my_tickets_screen.dart';
import 'package:tazkarti/features/sidebar/drawer.dart';
import 'package:tazkarti/providers/bottom_nav_provider/bottom_nav_provider.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> taps = [
    const HomeScreen(),
    const MatchesScreen(),
    const EventsScreen(),
    const MyTicketsScreen(),
    const DependentsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final bottomNav = context.watch<BottomNavProvider>();
    BottomNavigationBarItem _buildItem(
      int index,
      String icon,
      String label,
      int currentIndex,
    ) {
      final isSelected = index == currentIndex;

      return BottomNavigationBarItem(
        icon: Column(
          children: [
            SvgPicture.asset(
              icon,
              width: 30,
              color: isSelected ? ColorsManeger.black : ColorsManeger.gray,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? ColorsManeger.black : ColorsManeger.gray,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        label: label,
      );
    }

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
          Expanded(child: taps[bottomNav.currentIndex]),
        ],
      ),
      drawer: CustomDrawer(),

      bottomNavigationBar: BottomNavigationBar(
        onTap: bottomNav.changeIndex,
        currentIndex: bottomNav.currentIndex,
        items: [
          _buildItem(0, SvgManeger.home, 'Home', bottomNav.currentIndex),
          _buildItem(1, SvgManeger.matches, 'Matches', bottomNav.currentIndex),
          _buildItem(2, SvgManeger.event, 'Events', bottomNav.currentIndex),
          _buildItem(
            3,
            SvgManeger.mytickets,
            'My Tickets',
            bottomNav.currentIndex,
          ),
          _buildItem(
            4,
            SvgManeger.dependents,
            'Dependents',
            bottomNav.currentIndex,
          ),
        ],
      ),
    );
  }
}

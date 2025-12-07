import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/routes/routes.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManeger.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  Icons.navigate_before_outlined,
                  color: ColorsManeger.white,
                  size: 40.r,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesManeger.mainlayout);
                },
                child: Text('HOME', style: FontManeger.eventdetails),
              ),
              SizedBox(height: 10),
              Container(color: ColorsManeger.white, width: 270, height: 1),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesManeger.stadiumLocationsScreen,
                  );
                },
                child: Text(
                  'STADIUM LOCATIONS',
                  style: FontManeger.eventdetails,
                ),
              ),
              SizedBox(height: 10),
              Container(color: ColorsManeger.white, width: 270, height: 1),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesManeger.ourStoresScreen);
                },
                child: Text('OUR STORES', style: FontManeger.eventdetails),
              ),
              SizedBox(height: 10),
              Container(color: ColorsManeger.white, width: 270, height: 1),
              SizedBox(height: 10),
              InkWell(onTap: () {
                Navigator.pushNamed(context, RoutesManeger.faqScreen);
              },child: Text('FAQ', style: FontManeger.eventdetails)),
              SizedBox(height: 10),
              Container(color: ColorsManeger.white, width: 270, height: 1),
              SizedBox(height: 10),
              InkWell(onTap: () {
                Navigator.pushNamed(context, RoutesManeger.aboutScreen);
              },child: Text('ABOUT TAZKARTI', style: FontManeger.eventdetails)),
              SizedBox(height: 10),
              Container(color: ColorsManeger.white, width: 270, height: 1),
              SizedBox(height: 10),
              InkWell(onTap: () {
                Navigator.pushNamed(context, RoutesManeger.contactUsScreen);
              },child: Text('CONTACT US', style: FontManeger.eventdetails)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.facebook, color: ColorsManeger.gray),
              Icon(Icons.facebook, color: ColorsManeger.gray),
              Icon(Icons.facebook, color: ColorsManeger.gray),
            ],
          ),
        ],
      ),
    );
  }
}

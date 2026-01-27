import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/routes/routes.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  size: 40.sp,
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
                child: Text('HOME', style: FontManeger.drawerTitles),
              ),
              SizedBox(height: 10.h),
              Container(color: ColorsManeger.white, width: 270.w, height: 1.h),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesManeger.stadiumLocationsScreen,
                  );
                },
                child: Text(
                  'STADIUM LOCATIONS',
                  style: FontManeger.drawerTitles,
                ),
              ),
              SizedBox(height: 10.h),
              Container(color: ColorsManeger.white, width: 270.w, height: 1.h),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesManeger.ourStoresScreen);
                },
                child: Text('OUR STORES', style: FontManeger.drawerTitles),
              ),
              SizedBox(height: 10.h),
              Container(color: ColorsManeger.white, width: 270.w, height: 1.h),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesManeger.faqScreen);
                },
                child: Text('FAQ', style: FontManeger.drawerTitles),
              ),
              SizedBox(height: 10.h),
              Container(color: ColorsManeger.white, width: 270.w, height: 1.h),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesManeger.aboutScreen);
                },
                child: Text('ABOUT TAZKARTI', style: FontManeger.drawerTitles),
              ),
              SizedBox(height: 10.h),
              Container(color: ColorsManeger.white, width: 270.w, height: 1.h),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesManeger.contactUsScreen);
                },
                child: Text('CONTACT US', style: FontManeger.drawerTitles),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () async {
                  final url = Uri.parse("https://www.facebook.com/tazkarti");

                  await launchUrl(url, mode: LaunchMode.inAppBrowserView);
                },
                icon: Icon(Icons.facebook, color: ColorsManeger.gray,size: 30.sp,),
              ),
              IconButton(
                onPressed: () async {
                  final url = Uri.parse("https://x.com/Tazkarti");

                  await launchUrl(url, mode: LaunchMode.externalApplication);
                },
                icon: Icon(FontAwesomeIcons.twitter, color: ColorsManeger.gray,size: 30.sp,),
              ),
              IconButton(
                onPressed: () async {
                  final url = Uri.parse("https://www.instagram.com/tazkarti");

                  await launchUrl(url, mode: LaunchMode.externalApplication);
                },
                icon: Icon(
                  FontAwesomeIcons.instagram,
                  color: ColorsManeger.gray,
                  size: 30.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

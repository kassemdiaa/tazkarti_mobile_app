import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/icons/Icons_maneger.dart';
import 'package:tazkarti/core/widgets/header_info/header_info.dart';
import 'package:tazkarti/features/sidebar/drawer.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              HeaderInfo(),
              Text('About Tazkarti', style: FontManeger.bigTitle),
              SizedBox(height: 20.h),
              Text(
                'Tazkarti is the creator of the first fan identification card in Egypt under the trademark Tazkarti ID . Tazkarti is also a ticketing provider for different kinds of events all around Egypt as well as an event organizer that plans and hosts its own events.',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20.h),
              Text(
                'We offer a ticket marketplace for any and all types of events anywhere in Egypt. By using new and high-tech systems, we guarantee authorized and original tickets, accurate delivery time, as well as safety and convenience for our customers.',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text('Vision', style: FontManeger.aboutTitle)],
              ),
              SizedBox(height: 6.h),
              Text(
                'Leadership in the field of sports and entertainment—being the top recognized company with both ticketing and organizing arms.',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text('Mission', style: FontManeger.aboutTitle)],
              ),
              SizedBox(height: 6.h),
              Text(
                'Providing a safe and convenient marketplace for ticket buyers in different types of events using the latest booking technologies.',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text('Our Values', style: FontManeger.aboutTitle)],
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_right_rounded),
                  Expanded(
                    child: Text(
                      'Equal opportunities in booking tickets based on a first-come first-serve basis.',
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_right_rounded),
                  Expanded(
                    child: Text(
                      'Original and legitimate tickets not subject to forgery.',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_right_rounded),
                  Text(
                    'Latest technologies in booking tickets.',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_right_rounded),
                  Expanded(
                    child: Text(
                      'Convenience in guaranteeing access to fans for any sports and entertainment events.',
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'Tazkarti is your way to enjoy your favorite matches and events. Through our portal, fans are allowed to register themselves to get a Tazkarti Fan ID and/or Tazkarti ID by which they can book tickets and attend both sports and entertainment events.',
                style: FontManeger.aboutFooter,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

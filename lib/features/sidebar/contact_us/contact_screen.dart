import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/icons/Icons_maneger.dart';
import 'package:tazkarti/core/routes/routes.dart';
import 'package:tazkarti/core/widgets/header_info/header_info.dart';
import 'package:tazkarti/features/sidebar/drawer.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isExpanded = false;
  String selected = '-- Select --';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManeger.white,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              HeaderInfo(),
              Text('Contact Us', style: FontManeger.bigTitle),
              SizedBox(height: 16.h),
              Text(
                'For inquiries, suggestions, or complaints,',
                style: TextStyle(
                  color: ColorsManeger.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'contact us at',
                style: TextStyle(
                  color: ColorsManeger.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call, color: ColorsManeger.green, size: 50),
                  SizedBox(width: 10.w),
                  Text(
                    '15355',
                    style: TextStyle(
                      color: ColorsManeger.green,
                      fontWeight: FontWeight.w900,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
              Text(
                'Or fill in this form and we will get back to you.',
                style: FontManeger.smallTitle,
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Text(
                    'Subject*',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 116, 116, 116),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Container(
                width: double.infinity,

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
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selected,
                              style: TextStyle(
                                color: ColorsManeger.gray,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            AnimatedRotation(
                              turns: isExpanded ? 0.5 : 0.0,
                              duration: const Duration(milliseconds: 200),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: ColorsManeger.gray,
                                size: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // 👇 ONLY THIS PART EXPANDS
                    ClipRect(
                      child: AnimatedAlign(
                        alignment: Alignment.topCenter,
                        heightFactor: isExpanded ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: ColorsManeger.black,
                              width: 1,
                            ),
                          ),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    selected = '-- Select --';
                                    isExpanded = false;
                                    setState(() {});
                                  },
                                  child: Container(
                                    color: selected == '-- Select --'
                                        ? const Color.fromARGB(
                                            184,
                                            119,
                                            194,
                                            234,
                                          )
                                        : Colors.transparent,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 14.w),
                                        Text(
                                          '-- Select --',
                                          style: TextStyle(
                                            color: selected == '-- Select --'
                                                ? ColorsManeger.black
                                                : ColorsManeger.gray,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    selected = 'Technical Support';
                                    isExpanded = false;
                                    setState(() {});
                                  },
                                  child: Container(
                                    color: selected == 'Technical Support'
                                        ? const Color.fromARGB(
                                            184,
                                            119,
                                            194,
                                            234,
                                          )
                                        : Colors.transparent,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 14.w),
                                        Text(
                                          'Technical Support',
                                          style: TextStyle(
                                            color:
                                                selected == 'Technical Support'
                                                ? ColorsManeger.black
                                                : ColorsManeger.gray,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    selected = 'Suggestion';
                                    isExpanded = false;
                                    setState(() {});
                                  },
                                  child: Container(
                                    color: selected == 'Suggestion'
                                        ? const Color.fromARGB(
                                            184,
                                            119,
                                            194,
                                            234,
                                          )
                                        : Colors.transparent,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 14.w),
                                        Text(
                                          'Suggestion',
                                          style: TextStyle(
                                            color: selected == 'Suggestion'
                                                ? ColorsManeger.black
                                                : ColorsManeger.gray,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    selected = 'Complaint';
                                    isExpanded = false;
                                    setState(() {});
                                  },
                                  child: Container(
                                    color: selected == 'Complaint'
                                        ? const Color.fromARGB(
                                            184,
                                            119,
                                            194,
                                            234,
                                          )
                                        : Colors.transparent,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 14.w),
                                        Text(
                                          'Complaint',
                                          style: TextStyle(
                                            color: selected == 'Complaint'
                                                ? ColorsManeger.black
                                                : ColorsManeger.gray,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //outlets here
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Name*',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 116, 116, 116),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Container(
                color: Colors.white,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Email*',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 116, 116, 116),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Container(
                color: Colors.white,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Mobile Number',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 116, 116, 116),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Container(
                color: Colors.white,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Tazkarti ID',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 116, 116, 116),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Container(
                color: Colors.white,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Message*',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 116, 116, 116),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Container(
                color: Colors.white,
                child: TextFormField(
                  maxLines: 7,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 26.h),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManeger.green,
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                    vertical: 10.h,
                  ),
                ),
                child: Text(' Send ', style: FontManeger.botton),
              ),
              SizedBox(height: 26.h,),
            ],
          ),
        ),
      ),
    );
  }
}

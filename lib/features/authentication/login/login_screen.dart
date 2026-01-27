import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/routes/routes.dart';
import 'package:tazkarti/features/sidebar/drawer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorsManeger.black,
        title: SvgPicture.asset('assets/logo1.svg', width: 70.w),
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
          SizedBox(height: 26),
          Text('Sign in to your account', style: FontManeger.bigTitle),
          SizedBox(height: 4),
          Text(
            'Fill in all the required fields marked by (*).',
            style: FontManeger.smallTitle,
          ),
          SizedBox(height: 26.h),
          Opacity(
            opacity: 0.5,
            child: Container(
              color: ColorsManeger.gray,
              width: double.infinity,
              height: 1,
            ),
          ),
          SizedBox(height: 36.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              children: [
                Text('Tazkarti ID *', style: FontManeger.tazkartiIdPass),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.w),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                prefixIcon: Opacity(
                  opacity: 0.5,
                  child: Icon(Icons.person, size: 32.sp, color: ColorsManeger.gray),
                ),
                hint: Opacity(
                  opacity: 0.5,
                  child: Text('12345678901234', style: FontManeger.hintStyle),
                ),
              ),
            ),
          ),
          SizedBox(height: 26.h),
          Padding(
            padding: EdgeInsets.only(left: 14.w),
            child: Row(
              children: [
                Text('Password *', style: FontManeger.tazkartiIdPass),
                SizedBox(width: 14.w),
                InkWell(
                  onTap: () {},
                  child: Text('Forgot Tazkarti ID?', style: FontManeger.forget),
                ),
                SizedBox(width: 14),
                InkWell(
                  onTap: () {},
                  child: Text('Forgot Password?', style: FontManeger.forget),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.w),
            child: TextFormField(
              
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                prefixIcon: Opacity(
                  opacity: 0.5,
                  child: Icon(
                    Icons.lock_open_rounded,
                    size: 32.sp,
                    color: ColorsManeger.gray,
                  ),
                ),
                hint: Opacity(
                  opacity: 0.5,
                  child: Text('Password', style: FontManeger.hintStyle),
                ),
              ),
            ),
          ),
          SizedBox(height: 26.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Do not have an account?', style: FontManeger.notHaveAcc),
              SizedBox(width: 10.w),
              InkWell(
                onTap: () {Navigator.pushReplacementNamed(context, RoutesManeger.registerScreen);},
                child: Row(
                  children: [
                    Icon(
                      Icons.person_add_alt_outlined,
                      color: ColorsManeger.green,
                      size: 30.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text('Register Now!', style: FontManeger.register),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 26.h),
          ElevatedButton(
            onPressed: () {Navigator.pushReplacementNamed(context, RoutesManeger.mainlayout);},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManeger.green,
              shape: RoundedRectangleBorder(),
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 10.h),
            ),
            child: Text(' Sign in ', style: FontManeger.botton),
          ),
        ],
      ),
    );
  }
}

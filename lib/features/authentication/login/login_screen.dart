import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
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
        title: Text('TAZKARTI',style: TextStyle(color: ColorsManeger.green,fontWeight: FontWeight.w700),),
        actions: [Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.w),
          child: Icon(CupertinoIcons.globe,color: ColorsManeger.white,size: 28,),
        )],
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(CupertinoIcons.line_horizontal_3,color: ColorsManeger.white,size: 26),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}

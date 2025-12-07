import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/routes/routes.dart';

void main() {
  runApp(const TazkartiApp());
}

class TazkartiApp extends StatelessWidget {
  const TazkartiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

      designSize: const Size(416, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner:false ,
      onGenerateRoute: RoutesManeger.getRoute,
      initialRoute: RoutesManeger.loginScreen,
      locale:Locale('en') ,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tazkarti/core/routes/routes.dart';
import 'package:tazkarti/providers/bottom_nav_provider/bottom_nav_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
      ],
      child: const TazkartiApp(),
    ),
  );
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
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManeger.getRoute,
        initialRoute: RoutesManeger.loginScreen,
        locale: Locale('en'),
      ),
    );
  }
}

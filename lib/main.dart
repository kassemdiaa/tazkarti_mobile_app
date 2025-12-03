import 'package:flutter/material.dart';
import 'package:tazkarti/core/routes/routes.dart';

void main() {
  runApp(const TazkartiApp());
}

class TazkartiApp extends StatelessWidget {
  const TazkartiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner:false ,
    onGenerateRoute: RoutesManeger.getRoute,
    initialRoute: RoutesManeger.loginScreen,
    locale:Locale('en') ,
    );
  }
}
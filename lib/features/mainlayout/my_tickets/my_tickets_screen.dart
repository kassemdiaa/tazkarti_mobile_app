import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/features/mainlayout/my_tickets/my_tickets_item.dart';

class MyTicketsScreen extends StatefulWidget {
  const MyTicketsScreen({super.key});

  @override
  State<MyTicketsScreen> createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40.h,),
          MyTicketsItem(title: 'Entertament Tickets',),
          SizedBox(height: 18.h,),
          MyTicketsItem(title: 'Sports Tickets',),
          SizedBox(height: 18.h,),
          MyTicketsItem(title: 'Payment History',),
        ],
      ),
    );
  }
}
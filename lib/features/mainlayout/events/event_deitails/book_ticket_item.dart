import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/routes/routes.dart';

class BookTicketItem extends StatelessWidget {
  const BookTicketItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {Navigator.pushNamed(context, RoutesManeger.bookSeatingSceen);},
        style: ElevatedButton.styleFrom(backgroundColor: ColorsManeger.green,shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10.r))),
        child: Text(
          'Book Ticket',
          style: TextStyle(
            color: ColorsManeger.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

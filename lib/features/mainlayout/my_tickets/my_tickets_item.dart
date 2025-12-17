import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/colors/colors.dart';

class MyTicketsItem extends StatefulWidget {
  const MyTicketsItem({super.key, required this.title});
  final String title;
  @override
  State<MyTicketsItem> createState() => _MyTicketsItemState();
}

class _MyTicketsItemState extends State<MyTicketsItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isExpanded ? Colors.transparent : ColorsManeger.gray,
          width: 1.5,
        ),
      ),
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
              color: isExpanded ? ColorsManeger.green : ColorsManeger.white,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: isExpanded
                          ? ColorsManeger.white
                          : ColorsManeger.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: isExpanded
                          ? ColorsManeger.white
                          : ColorsManeger.gray,
                      size: 30,
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
                  color: ColorsManeger.white,
                  border: Border.all(color: ColorsManeger.gray, width: 1),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 4.h),
                    
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(100),
                      margin: EdgeInsets.all(10),
                      child: Opacity(
                        opacity: 0.3,
                        child: Column(
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              size: 55,
                              color: ColorsManeger.gray,
                            ),
                            SizedBox(height: 10.h,),
                            Text('No data to display.',style:TextStyle(color: ColorsManeger.gray,fontWeight: FontWeight.bold,fontSize: 18))
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
        ],
      ),
    );
  }
}

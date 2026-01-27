import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/colors/colors.dart';

class OutletItem extends StatefulWidget {
  const OutletItem({
    super.key,
    required this.outletName,
    required this.city,
    required this.dedicatedTo,
    required this.distrect,
    required this.address,
  });
  final String outletName;
  final String city;
  final String dedicatedTo;
  final String distrect;
  final String address;
  @override
  State<OutletItem> createState() => _OutletItemState();
}

class _OutletItemState extends State<OutletItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Row(
                      children: [
                        isExpanded
                            ? Icon(Icons.remove, color: ColorsManeger.green)
                            : Icon(Icons.add, color: ColorsManeger.green),
                        Text(
                          widget.dedicatedTo,
                          style: TextStyle(
                            color: ColorsManeger.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.outletName,
                            style: TextStyle(
                              color: ColorsManeger.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.city,
                            style: TextStyle(
                              color: ColorsManeger.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 👇 ONLY THIS PART EXPANDS
          ClipRect(
            child: AnimatedAlign(
              alignment: Alignment.topLeft,
              heightFactor: isExpanded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Container(
                
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                            decoration: BoxDecoration(
                              border: Border(right: BorderSide(width: 1.w,color: ColorsManeger.gray))
                            ),
                            child: Text('District',style: TextStyle(
                              color: ColorsManeger.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                            decoration: BoxDecoration(
                              
                            ),
                            child: Text(widget.distrect),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                            decoration: BoxDecoration(
                              border: Border(right: BorderSide(color: ColorsManeger.gray,width: 1.w))
                            ),
                            child: Text('Address',style: TextStyle(
                              color: ColorsManeger.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                            decoration: BoxDecoration(
                              
                            ),
                            child: Text(widget.address),
                          ),
                        ),
                      ],
                    ),
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

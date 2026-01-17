import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/colors/colors.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({super.key});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                  color: ColorsManeger.blue,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.filter_list_alt, color: ColorsManeger.white),
                        SizedBox(width: 5.w),
                        Text(
                          "Search",
                          style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16.sp,color: ColorsManeger.white),
                          ),
                        
                      ],
                    ),
                  ),
                );
  }
}
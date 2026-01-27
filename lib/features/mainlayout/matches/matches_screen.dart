import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/widgets/clickedImage/clickedImage.dart';
import 'package:tazkarti/core/widgets/search_button/search_button.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorsManeger.bgColor),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: ColorsManeger.white),
            padding: REdgeInsets.only(left: 100.w, right: 15.w),
            width: double.infinity.w,
            height: 50.h,
            child: Marquee(
              text:
                  '                              Tazkarti ID is your pass to stadiums.                                                                      It is an effective method to achieve the safety of fans Allowing identifying them in the stadium   Tazkarti is also a ticketing provider and event organizer that plans and hosts its own events all around Egypt.',
              velocity: 50.0,
              blankSpace: 10,
              style: FontManeger.smallTitle.copyWith(
                color: ColorsManeger.darkGray,
              ),
              scrollAxis: Axis.horizontal,
            ),
          ),
          SizedBox(width: double.infinity, height: 40.h),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Text(
                  "Matches",
                  style: FontManeger.botton.copyWith(
                    color: ColorsManeger.black,
                  ),
                ),
                Spacer(),
                SearchButton()
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                ClickedImage(
                  isSelected: isSelected,
                  text: "All Tournaments",
                  onTap: _OnClickedImageTab,
                ),
                Spacer(),
                ClickedImage(
                  isSelected: !isSelected,
                  text: "EPL Cup 2025/2026",
                  onTap: _OnClickedImageTab,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _OnClickedImageTab() {
    isSelected = !isSelected;
    setState(() {});
  }
}

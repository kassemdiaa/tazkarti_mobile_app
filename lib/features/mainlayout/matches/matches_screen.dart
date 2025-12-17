import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/widgets/clickedImage/clickedImage.dart';

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
            padding: REdgeInsets.only(left: 100, right: 15),
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
          SizedBox(width: double.infinity, height: 40),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  "Matches",
                  style: FontManeger.botton.copyWith(
                    color: ColorsManeger.black,
                  ),
                ),
                Spacer(),
                Container(
                  width: 91.71.w,
                  height: 35.h,
                  color: ColorsManeger.blue,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.filter_list_alt, color: ColorsManeger.white),
                        SizedBox(width: 5.w),
                        Text(
                          "Search",
                          style: FontManeger.forget.copyWith(
                            fontWeight: FontWeight.w700,
                            color: ColorsManeger.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 15),
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

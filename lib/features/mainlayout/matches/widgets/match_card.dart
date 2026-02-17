import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/features/mainlayout/matches/models/match_model.dart';

class MatchCard extends StatelessWidget {
  final MatchModel match;
  final VoidCallback onBookTap;

  const MatchCard({
    super.key,
    required this.match,
    required this.onBookTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: ColorsManeger.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Teams Section
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Home Team
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          color: ColorsManeger.bgColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.sports_soccer,
                            color: ColorsManeger.green,
                            size: 30.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        match.homeTeamName,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManeger.black,
                        ),
                      ),
                    ],
                  ),
                ),
                // VS
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'VS',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManeger.gray,
                      ),
                    ),
                  ],
                ),
                // Away Team
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          color: ColorsManeger.bgColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.sports_soccer,
                            color: ColorsManeger.green,
                            size: 30.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        match.awayTeamName,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManeger.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Divider(height: 1.h, color: ColorsManeger.bgColor),
          SizedBox(height: 12.h),

          // Stadium and Date Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Stadium
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.stadium,
                        color: ColorsManeger.gray,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              match.stadium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: ColorsManeger.black,
                              ),
                            ),
                            Text(
                              match.stadiumCity,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: ColorsManeger.gray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                // Date and Time
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: ColorsManeger.gray,
                      size: 20.sp,
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          match.formattedDate,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorsManeger.black,
                          ),
                        ),
                        Text(
                          match.formattedTime,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: ColorsManeger.gray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Divider(height: 1.h, color: ColorsManeger.bgColor),
          SizedBox(height: 12.h),

          // Tournament and Match Info
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Tournament',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: ColorsManeger.gray,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          match.tournament,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorsManeger.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text(
                          'Group',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: ColorsManeger.gray,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          match.group,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorsManeger.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text(
                          'Stage',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: ColorsManeger.gray,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          match.stage,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorsManeger.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Match No.',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: ColorsManeger.gray,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          match.matchNumber.toString(),
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorsManeger.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    if (match.isAvailable)
                      Row(
                        children: [
                          Container(
                            width: 8.w,
                            height: 8.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF4CAF50),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            'Available',
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4CAF50),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Divider(height: 1.h, color: ColorsManeger.bgColor),

          // Book Ticket Button
          GestureDetector(
            onTap: onBookTap,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                color: ColorsManeger.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
              child: Center(
                child: Text(
                  'Book Ticket',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

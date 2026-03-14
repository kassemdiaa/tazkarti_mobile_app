import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/data/models/matches_data/match_model.dart';

class MatchItem extends StatelessWidget {
  final MatchModel match;
  const MatchItem({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Teams Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            child: Row(
              children: [
                // Team 1
                Image.asset(
                  match.team1imagePath,
                  width: 36.w,
                  height: 36.h,
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.sports_soccer,
                    size: 36.r,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    match.team1,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Text(
                  'VS',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Text(
                    match.team2,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Image.asset(
                  match.team2imagePath,
                  width: 36.w,
                  height: 36.h,
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.sports_soccer,
                    size: 36.r,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1.h, color: Colors.grey.shade200),

          // Stadium & Date Row
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    child: Row(
                      children: [
                        Icon(Icons.stadium_outlined,
                            size: 18.r, color: Colors.grey.shade600),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${match.stadium}, ',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                TextSpan(
                                  text: _extractCity(match.stadium),
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(
                    width: 1.w, color: Colors.grey.shade200, thickness: 1),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today_outlined,
                            size: 18.r, color: Colors.grey.shade600),
                        SizedBox(width: 6.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${match.time.dayAlpha} ${match.time.day} ${match.time.month} ${match.time.year}',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              'Time : ${match.time.hour} : ${match.time.min} PM',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1.h, color: Colors.grey.shade200),

          // Tournament & Match No Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tournament',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: match.tournment,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Match No.',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: match.matchNumber,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Stage & Availability Row
          Padding(
            padding: EdgeInsets.only(
                left: 12.w, right: 12.w, bottom: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quarter Final',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.black54,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 8.r,
                      height: 8.r,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Available',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Book Ticket Button
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1DB954),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 13.h),
                elevation: 0,
              ),
              child: Text(
                'Book Ticket',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }

  String _extractCity(String stadium) {
    // Extract city from stadium name (e.g. "Suez Stadium" -> "Suez")
    final parts = stadium.split(' ');
    if (parts.length > 1) return parts.first;
    return stadium;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/widgets/search_button/search_button.dart';
import 'package:tazkarti/features/mainlayout/matches/models/match_model.dart';
import 'package:tazkarti/features/mainlayout/matches/widgets/match_card.dart';
import 'package:tazkarti/features/mainlayout/matches/widgets/tournament_filter_tab.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  int selectedTournament = 0;
  late List<MatchModel> matches;

  @override
  void initState() {
    super.initState();
    matches = getSampleMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorsManeger.bgColor),
      child: Column(
        children: [
          // Info Banner
          Container(
            decoration: BoxDecoration(color: ColorsManeger.white),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
            width: double.infinity,
            child: Text(
              
                  '                              Tazkarti ID is your pass to stadiums.                                                                      It is an effective method to achieve the safety of fans Allowing identifying them in the stadium   Tazkarti is also a ticketing provider and event organizer that plans and hosts its own events all around Egypt.',
              
              style: FontManeger.smallTitle.copyWith(
                color: ColorsManeger.darkGray,
              ),
              
            ),
          ),
          SizedBox(height: 24.h),

          // Matches Title and Search
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Matches",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManeger.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle search
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorsManeger.blue,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: ColorsManeger.white,
                          size: 18.sp,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
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
          SizedBox(height: 20.h),

          // Tournament Filters
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SizedBox(
              height: 100.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TournamentFilterTab(
                    label: 'All Tournaments',
                    icon: Icons.emoji_events,
                    isSelected: selectedTournament == 0,
                    onTap: () {
                      setState(() {
                        selectedTournament = 0;
                      });
                    },
                  ),
                  TournamentFilterTab(
                    label: 'Nile League 2025/2026',
                    icon: Icons.sports_soccer,
                    isSelected: selectedTournament == 1,
                    onTap: () {
                      setState(() {
                        selectedTournament = 1;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),

          // Matches List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              itemCount: matches.length + 1,
              itemBuilder: (context, index) {
                if (index == matches.length) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          // Handle View More
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            color: ColorsManeger.gray,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            'View More',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorsManeger.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return MatchCard(
                  match: matches[index],
                  onBookTap: () {
                    _showBookingDialog(context, matches[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showBookingDialog(BuildContext context, MatchModel match) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Book Ticket'),
        content: Text(
          'Book ticket for ${match.homeTeamName} vs ${match.awayTeamName}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ticket booked for match ${match.matchNumber}'),
                  backgroundColor: ColorsManeger.green,
                ),
              );
            },
            child: const Text('Book'),
          ),
        ],
      ),
    );
  }
}

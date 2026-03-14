import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/widgets/search_button/search_button.dart';
import 'package:tazkarti/data/models/matches_data/match_model.dart';
import 'package:tazkarti/features/mainlayout/matches/match_item.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  String? _selectedTournament; // null = All Tournaments

  List<String> get _tournaments {
    return MatchModel.matches.map((m) => m.tournment).toSet().toList();
  }

  List<MatchModel> get _filteredMatches {
    if (_selectedTournament == null) return MatchModel.matches;
    return MatchModel.matches
        .where((m) => m.tournment == _selectedTournament)
        .toList();
  }

  Map<String, List<MatchModel>> get _groupedByTournament {
    final Map<String, List<MatchModel>> grouped = {};
    for (final match in _filteredMatches) {
      grouped.putIfAbsent(match.tournment, () => []).add(match);
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    final grouped = _groupedByTournament;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Text('Matches', style: FontManeger.bigTitle),
              const Spacer(),
              const SearchButton(),
            ],
          ),
          SizedBox(height: 16.h),

          // Tournament Filter - centered row
          SizedBox(
            height: 120.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TournamentChip(
                  label: 'All Tournaments',
                  isSelected: _selectedTournament == null,
                  onTap: () => setState(() => _selectedTournament = null),
                ),
                SizedBox(width: 16.w),
                ..._tournaments.expand(
                  (t) => [
                    _TournamentChip(
                      label: t,
                      isSelected: _selectedTournament == t,
                      onTap: () => setState(() => _selectedTournament = t),
                    ),
                    SizedBox(width: 16.w),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 8.h),

          // Matches list grouped by tournament
          Expanded(
            child: ListView(
              children: grouped.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...entry.value.map(
                      (match) => MatchItem(match: match),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _TournamentChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TournamentChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 90.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Circle
            Container(
              width: 76.r,
              height: 76.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.white : Colors.grey.shade200,
                border: isSelected
                    ? Border.all(
                        color: const Color(0xFF1DB954),
                        width: 2.5,
                      )
                    : null,
              ),
              child: Center(
                child: Icon(
                  Icons.emoji_events_outlined,
                  size: isSelected ? 38.r : 34.r,
                  color: const Color(0xFF1DB954),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            // Label below circle
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight:
                    isSelected ? FontWeight.w700 : FontWeight.w400,
                color: isSelected
                    ? const Color(0xFF1DB954)
                    : Colors.grey.shade600,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:tazkarti/data/models/matches_data/match_time_model.dart';

class MatchModel {
  String stadium;
  String team1;
  String team2;
  String team1imagePath;
  String team2imagePath;
  String matchNumber;
  String tournment;
  MatchTimeModel time;
  MatchModel({
    required this.stadium,
    required this.team1,
    required this.team2,
    required this.team1imagePath,
    required this.team2imagePath,
    required this.tournment,
    required this.matchNumber,
    required this.time,
  });

  static List<MatchModel> matches = [
    MatchModel(
      stadium: 'Suez Stadium',
      team1: 'Al-Masry SC',
      team2: 'CR Belouizdad',
      team1imagePath: 'assets/masry.png',
      team2imagePath: 'assets/crb.png',
      tournment: 'CAF Confederation Cup 2025/2026',
      matchNumber: '1',
      time: MatchTimeModel(
        day: '14',
        dayAlpha: 'Sat',
        month: 'Mar',
        year: '2026',
        hour: '10',
        min: '00',
      ),
    ),
    MatchModel(
      stadium: 'Cairo Stadium',
      team1: 'Al-Ahly FC',
      team2: 'Al-Zamalek FC',
      team1imagePath: 'assets/ahly.png',
      team2imagePath: 'assets/zamalek.png',
      tournment: 'Nile League 2025/2026',
      matchNumber: '2',
      time: MatchTimeModel(
        day: '15',
        dayAlpha: 'Sun',
        month: 'Mar',
        year: '2026',
        hour: '10',
        min: '00',
      ),
    ),
  ];
}

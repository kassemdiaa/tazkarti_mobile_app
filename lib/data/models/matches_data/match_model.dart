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

  static List<MatchModel> matches = [];
}



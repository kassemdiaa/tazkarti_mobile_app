class MatchModel {
  final int id;
  final String homeTeamName;
  final String awayTeamName;
  final String homeTeamLogo;
  final String awayTeamLogo;
  final String stadium;
  final String stadiumCity;
  final DateTime matchDate;
  final String tournament;
  final String group;
  final String stage;
  final int matchNumber;
  final bool isAvailable;

  MatchModel({
    required this.id,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeTeamLogo,
    required this.awayTeamLogo,
    required this.stadium,
    required this.stadiumCity,
    required this.matchDate,
    required this.tournament,
    required this.group,
    required this.stage,
    required this.matchNumber,
    required this.isAvailable,
  });

  String get formattedDate {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return '${days[matchDate.weekday - 1]} ${matchDate.day} ${_monthName(matchDate.month)} ${matchDate.year}';
  }

  String get formattedTime {
    final hour = matchDate.hour.toString().padLeft(2, '0');
    final minute = matchDate.minute.toString().padLeft(2, '0');
    final period = matchDate.hour >= 12 ? 'PM' : 'AM';
    return 'Time : $hour:$minute $period';
  }

  static String _monthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}

// Sample data
List<MatchModel> getSampleMatches() {
  return [
    MatchModel(
      id: 176,
      homeTeamName: 'Al Ahly FC',
      awayTeamName: 'El Gouna FC',
      homeTeamLogo: 'assets/teams/ahly.png',
      awayTeamLogo: 'assets/teams/elgouna.png',
      stadium: 'Cairo Int. Stadium',
      stadiumCity: 'Cairo',
      matchDate: DateTime(2026, 2, 19, 21, 30),
      tournament: 'Nile League 2025/2026',
      group: 'Week Eighteen',
      stage: 'First Stage',
      matchNumber: 176,
      isAvailable: true,
    ),
    MatchModel(
      id: 177,
      homeTeamName: 'Arab Contractors Sporting Club',
      awayTeamName: 'Al-Masry SC',
      homeTeamLogo: 'assets/teams/arab_contractors.png',
      awayTeamLogo: 'assets/teams/almasry.png',
      stadium: 'Borg El Arab Stadium',
      stadiumCity: 'Alexandria',
      matchDate: DateTime(2026, 2, 20, 21, 30),
      tournament: 'Nile League 2025/2026',
      group: 'Week Eighteen',
      stage: 'First Stage',
      matchNumber: 177,
      isAvailable: true,
    ),
    MatchModel(
      id: 177,
      homeTeamName: 'ISMAILY SC',
      awayTeamName: 'Wadi Degla',
      homeTeamLogo: 'assets/teams/ismaily.png',
      awayTeamLogo: 'assets/teams/wadidegla.png',
      stadium: 'Ismailia Stadium',
      stadiumCity: 'Ismailia',
      matchDate: DateTime(2026, 2, 20, 21, 30),
      tournament: 'Nile League 2025/2026',
      group: 'Week Eighteen',
      stage: 'First Stage',
      matchNumber: 177,
      isAvailable: true,
    ),
    MatchModel(
      id: 178,
      homeTeamName: 'Pyramids FC',
      awayTeamName: 'Ceramica Cleopatra FC',
      homeTeamLogo: 'assets/teams/pyramids.png',
      awayTeamLogo: 'assets/teams/ceramica.png',
      stadium: '30 June Stadium',
      stadiumCity: 'Cairo',
      matchDate: DateTime(2026, 2, 20, 21, 30),
      tournament: 'Nile League 2025/2026',
      group: 'Week Eighteen',
      stage: 'First Stage',
      matchNumber: 178,
      isAvailable: true,
    ),
    MatchModel(
      id: 179,
      homeTeamName: 'Zamalek SC',
      awayTeamName: 'Haras El Hodoud SC',
      homeTeamLogo: 'assets/teams/zamalek.png',
      awayTeamLogo: 'assets/teams/haras.png',
      stadium: 'Cairo Int. Stadium',
      stadiumCity: 'Cairo',
      matchDate: DateTime(2026, 2, 20, 21, 30),
      tournament: 'Nile League 2025/2026',
      group: 'Week Eighteen',
      stage: 'First Stage',
      matchNumber: 179,
      isAvailable: true,
    ),
    MatchModel(
      id: 180,
      homeTeamName: 'Ghazi Elmahala FC',
      awayTeamName: 'ZED FC',
      homeTeamLogo: 'assets/teams/ghazi.png',
      awayTeamLogo: 'assets/teams/zed.png',
      stadium: 'Ghazi El Mahala Stadium',
      stadiumCity: 'Gharbiya',
      matchDate: DateTime(2026, 2, 20, 21, 30),
      tournament: 'Nile League 2025/2026',
      group: 'Week Eighteen',
      stage: 'First Stage',
      matchNumber: 180,
      isAvailable: true,
    ),
  ];
}

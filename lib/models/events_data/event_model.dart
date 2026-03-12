class EventModel {
  String day;
  String year;
  String month;
  String name;
  String imagePath;
  String location;
  String numOfShows;
  String termsOfEntry;
  bool isSeating;

  Map<String, int> categoriesPrices;
  EventModel({
    required this.name,
    required this.day,
    required this.month,
    required this.year,
    required this.imagePath,
    required this.location,
    required this.isSeating,
    required this.numOfShows,
    required this.termsOfEntry,
    required this.categoriesPrices,
  });
}

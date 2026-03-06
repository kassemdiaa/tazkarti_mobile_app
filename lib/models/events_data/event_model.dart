class EventModel {
  String day;
  String year;
  String month;
  String name;
  String imagePath;
  bool isSeating;
  Map<String, int> categoriesPrices;
  EventModel({
    required this.name,
    required this.day,
    required this.month,
    required this.year,
    required this.imagePath,
    required this.isSeating,
    required this.categoriesPrices,
  });
}

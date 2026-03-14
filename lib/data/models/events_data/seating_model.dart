class SeatingModel {
  List<String> categories;
  List<double> prices;
  List<int>? numOfRows;
  List<int>? numOfSeatsInRows;
  SeatingModel({
    required this.categories,
    required this.prices,
    this.numOfRows,
    this.numOfSeatsInRows,
  });
}

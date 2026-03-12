import 'package:tazkarti/core/assets/assets.dart';
import 'package:tazkarti/models/events_data/event_model.dart';

class EventCategoryModel {
  String name;
  String imagePath;
  List<EventModel> events;
  EventCategoryModel({
    required this.name,
    required this.imagePath,
    required this.events,
  });

  static List<EventCategoryModel> categories = [
    EventCategoryModel(
      name: 'Cairo Opera House',
      imagePath: AssetsManeger.operaCover,
      events: [
        EventModel(
          imagePath: AssetsManeger.opera2,
          name: 'Orkestra',
          categoriesPrices: {'Regular': 1000, 'VIP': 3000},
          day: '20',
          month: '5',
          year: '2026',
          isSeating: true,
          location: 'Cairo Opera House',
          numOfShows: '1',
          termsOfEntry: 'No refunds or exchange',
        ),
        EventModel(
          imagePath: AssetsManeger.opera4,
          name: 'Omar Khairat',
          categoriesPrices: {'Regular': 1000, 'VIP': 3000},
          day: '20',
          month: '5',
          year: '2026',
          isSeating: true,
          location: 'Cairo Opera House',
          numOfShows: '1',
          termsOfEntry: 'No refunds or exchange',
        ),
        EventModel(
          imagePath: AssetsManeger.opera5,
          name: 'Abd Elhalim Newira',
          categoriesPrices: {'Regular': 1000, 'VIP': 3000},
          day: '20',
          month: '5',
          year: '2026',
          isSeating: true,
          location: 'Cairo Opera House',
          numOfShows: '1',
          termsOfEntry: 'No refunds or exchange',
        ),
      ],
    ),
    EventCategoryModel(
      name: 'Gem',
      imagePath: AssetsManeger.gemCover,
      events: [
        EventModel(
          imagePath: AssetsManeger.gem1,
          name: 'Calum Scott',
          categoriesPrices: {'Regular': 1000, 'VIP': 3000},
          day: '20',
          month: '5',
          year: '2026',
          isSeating: true,
          location: 'Grand Egyptian Museum',
          numOfShows: '1',
          termsOfEntry: 'No refunds or exchange',
        ),
        EventModel(
          imagePath: AssetsManeger.gem2,
          name: 'Brain Maknight',
          categoriesPrices: {'Regular': 1000, 'VIP': 3000},
          day: '20',
          month: '5',
          year: '2026',
          isSeating: true,
          location: 'Grand Egyptian Museum',
          numOfShows: '1',
          termsOfEntry: 'No refunds or exchange',
        ),
        EventModel(
          imagePath: AssetsManeger.gem3,
          name: 'Hauser',
          categoriesPrices: {'Regular': 1000, 'VIP': 3000},
          day: '20',
          month: '5',
          year: '2026',
          isSeating: true,
          location: 'Grand Egyptian Museum',
          numOfShows: '1',
          termsOfEntry: 'No refunds or exchange',
        ),
      ],
    ),
    EventCategoryModel(
      name: 'Sound and light',
      imagePath: AssetsManeger.soundLight,
      events: [
        EventModel(
          imagePath: AssetsManeger.soundLight,
          name: 'Sound and light',
          categoriesPrices: {'Regular': 1000, 'VIP': 3000},
          day: '20',
          month: '5',
          year: '2026',
          isSeating: false,
          location: 'Pyramids of Giza',
          numOfShows: '1',
          termsOfEntry: 'No refunds or exchange',
        ),
      ],
    ),
  ];
}

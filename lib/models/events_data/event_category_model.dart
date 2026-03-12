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
          location: 'Cairo Opera House'
        ),
        EventModel(
          imagePath: AssetsManeger.opera2,
          name: 'Omar Khairat',
          categoriesPrices: {'Regular': 1000, 'VIP': 3000},
          day: '20',
          month: '5',
          year: '2026',
          isSeating: true,
          location: 'Cairo Opera House'
        ),
        EventModel(
          imagePath: AssetsManeger.opera2,
          name: 'Medhat Saleh',
          categoriesPrices: {'Regular': 1000, 'VIP': 3000},
          day: '20',
          month: '5',
          year: '2026',
          isSeating: true,
          location: 'Cairo Opera House'
        ),
      ],
    ),
    EventCategoryModel(
      name: 'Gem',
      imagePath: AssetsManeger.gemCover,
      events: [
        EventModel(
          imagePath: AssetsManeger.opera2,
          name: 'Calum Scott',
          categoriesPrices: {'Regular': 1000, 'VIP': 3000},
          day: '20',
          month: '5',
          year: '2026',
          isSeating: true,
          location: 'Grand Egyptian Museum'
        ),
        EventModel(
          imagePath: AssetsManeger.opera2,
          name: 'Brain Maknight',
          categoriesPrices: {'Regular': 1000, 'VIP': 3000},
          day: '20',
          month: '5',
          year: '2026',
          isSeating: true,
          location: 'Grand Egyptian Museum'
        ),
        EventModel(
          imagePath: AssetsManeger.opera2,
          name: 'Hauser',
          categoriesPrices: {'Regular': 1000, 'VIP': 3000},
          day: '20',
          month: '5',
          year: '2026',
          isSeating: true,
          location: 'Grand Egyptian Museum'
        ),
      ],
    ),
    EventCategoryModel(
      name: 'Sound and light',
      imagePath: AssetsManeger.gemCover,
      events: [
        EventModel(
          imagePath: AssetsManeger.opera2,
          name: 'Sound and light',
          categoriesPrices: {'Regular': 1000, 'VIP': 3000},
          day: '20',
          month: '5',
          year: '2026',
          isSeating: false,
          location: 'Pyramids of Giza'
        ),
        
      ],
    ),
  ];
}

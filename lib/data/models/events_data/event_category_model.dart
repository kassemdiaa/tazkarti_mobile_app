import 'package:tazkarti/core/assets/assets.dart';
import 'package:tazkarti/data/models/events_data/event_model.dart';
import 'package:tazkarti/data/models/events_data/seating_model.dart';

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
          seating: SeatingModel(
            categories: ['Regular', 'VIP','VVIP'],
            prices: [1000, 3000,9000],
            numOfRows: [5, 3,2],
            numOfSeatsInRows: [8, 6,4],
          ),
          imagePath: AssetsManeger.opera2,
          name: 'Orkestra',
          day: '20',
          month: 'May',
          year: '2026',
          isSeating: true,
          location: 'Cairo Opera House',
          numOfShows: '1',
          termsOfEntry: 'No refunds or exchange',
        ),
        EventModel(seating: SeatingModel(
            categories: ['Regular', 'VIP'],
            prices: [1000, 3000],
            numOfRows: [5, 3],
            numOfSeatsInRows: [8, 6],
          ),
          imagePath: AssetsManeger.opera4,
          name: 'Omar Khairat',
          day: '20',
          month: 'May',
          year: '2026',
          isSeating: true,
          location: 'Cairo Opera House',
          numOfShows: '1',
          termsOfEntry: 'No refunds or exchange',
        ),
        EventModel(seating: SeatingModel(
            categories: ['Regular', 'VIP'],
            prices: [1000, 3000],
            numOfRows: [5, 3],
            numOfSeatsInRows: [8, 6],
          ),
          imagePath: AssetsManeger.opera5,
          name: 'Abd Elhalim Newira',

          day: '20',
          month: 'May',
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
        EventModel(seating: SeatingModel(
            categories: ['Regular', 'VIP'],
            prices: [1000, 3000],
            numOfRows: [5, 3],
            numOfSeatsInRows: [8, 6],
          ),
          imagePath: AssetsManeger.gem1,
          name: 'Calum Scott',
          day: '20',
          month: 'May',
          year: '2026',
          isSeating: true,
          location: 'Grand Egyptian Museum',
          numOfShows: '1',
          termsOfEntry: 'No refunds or exchange',
        ),
        EventModel(seating: SeatingModel(
            categories: ['Regular', 'VIP'],
            prices: [1000, 3000],
            numOfRows: [5, 3],
            numOfSeatsInRows: [8, 6],
          ),
          imagePath: AssetsManeger.gem2,
          name: 'Brain Maknight',

          day: '20',
          month: 'May',
          year: '2026',
          isSeating: true,
          location: 'Grand Egyptian Museum',
          numOfShows: '1',
          termsOfEntry: 'No refunds or exchange',
        ),
        EventModel(seating: SeatingModel(
            categories: ['Regular', 'VIP'],
            prices: [1000, 3000],
            numOfRows: [5, 3],
            numOfSeatsInRows: [8, 6],
          ),
          imagePath: AssetsManeger.gem3,
          name: 'Hauser',

          day: '20',
          month: 'May',
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
        EventModel(seating: SeatingModel(
            categories: ['Regular', 'VIP'],
            prices: [1000, 3000],
          ),
          imagePath: AssetsManeger.soundLight,
          name: 'Sound and light',
          day: '20',
          month: 'May',
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

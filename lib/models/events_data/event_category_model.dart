import 'package:tazkarti/models/events_data/event_model.dart';

class EventCategoryModel {
  String name;
  String imagePath;
  List<EventModel> events;
  EventCategoryModel({required this.name,required this.imagePath,required this.events});

  static List<EventCategoryModel> categories=[
    
  ];
}
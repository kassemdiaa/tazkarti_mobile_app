import 'package:flutter/material.dart';
import 'package:tazkarti/models/events_data/event_category_model.dart';
import 'package:tazkarti/models/events_data/event_model.dart';

class SelectedEventProvider extends ChangeNotifier{
  EventModel event=EventCategoryModel.categories[1].events[1];
  EventCategoryModel category=EventCategoryModel.categories[1];
  void selectEvent(EventModel e){
    event=e;
    notifyListeners();
  }
  void selectCategory(EventCategoryModel c){
    category=c;
    notifyListeners();
  }
}
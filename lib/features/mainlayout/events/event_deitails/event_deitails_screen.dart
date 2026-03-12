import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tazkarti/models/events_data/event_model.dart';
import 'package:tazkarti/providers/selected_even_provider.dart/selected_event_provider.dart';

class EventDeitailsScreen extends StatelessWidget {
  const EventDeitailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EventModel event = context.read<SelectedEventProvider>().event;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(children: [
        
      ],),
    );
  }
}

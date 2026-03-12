import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tazkarti/core/assets/assets.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/routes/routes.dart';
import 'package:tazkarti/features/mainlayout/events/categories/category_item.dart';
import 'package:tazkarti/models/events_data/event_category_model.dart';
import 'package:tazkarti/providers/selected_even_provider.dart/selected_event_provider.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 14.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('Event Categories', style: FontManeger.bigTitle)],
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesManeger.eventsScreen);
                context.read<SelectedEventProvider>().selectCategory(
                  EventCategoryModel.categories[index],
                );
              },
              child: CategoryItem(
                categoryName: EventCategoryModel.categories[index].name,
                picPath: EventCategoryModel.categories[index].imagePath,
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 14.h),
            itemCount: EventCategoryModel.categories.length,
          ),
        ),
      ],
    );
  }
}

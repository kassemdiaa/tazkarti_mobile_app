import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/assets/assets.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/features/mainlayout/events/categories/category_item.dart';
import 'package:tazkarti/models/events_data/event_category_model.dart';

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
            itemBuilder: (context, index) => CategoryItem(
              categoryName: EventCategoryModel.categories[index].name,
              picPath: EventCategoryModel.categories[index].imagePath,
            ),
            separatorBuilder: (context, index) => SizedBox(height: 14.h),
            itemCount: EventCategoryModel.categories.length,
          ),
        ),
      ],
    );
  }
}

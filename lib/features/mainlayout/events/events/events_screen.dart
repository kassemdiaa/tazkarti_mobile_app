import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/icons/Icons_maneger.dart';
import 'package:tazkarti/core/routes/routes.dart';
import 'package:tazkarti/core/widgets/header_info/header_info.dart';
import 'package:tazkarti/core/widgets/search_button/search_button.dart';
import 'package:tazkarti/features/mainlayout/events/events/event_item.dart';
import 'package:tazkarti/features/sidebar/drawer.dart';
import 'package:tazkarti/models/events_data/event_category_model.dart';
import 'package:tazkarti/providers/selected_even_provider.dart/selected_event_provider.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<EventsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    EventCategoryModel category = context
        .read<SelectedEventProvider>()
        .category;
    return Scaffold(
      backgroundColor: ColorsManeger.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorsManeger.black,
        title: SvgPicture.asset(SvgManeger.logo, width: 70.w),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Icon(
              CupertinoIcons.globe,
              color: ColorsManeger.white,
              size: 28.sp,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(
            CupertinoIcons.line_horizontal_3,
            color: ColorsManeger.white,
            size: 28.sp,
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          HeaderInfo(),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Text('Events', style: FontManeger.bigTitle),
                Spacer(),
                SearchButton(),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  context.read<SelectedEventProvider>().selectEvent(category.events[index]);
                  Navigator.pushNamed(context, RoutesManeger.eventsDeitailsScreen);
                  
                },
                child: EventItem(
                  picPath: category.events[index].imagePath,
                  title: category.events[index].name,
                  numOfShows: category.events[index].numOfShows,
                  location: category.events[index].location,
                  day:category.events[index].day ,
                  month: category.events[index].month,
                  year: category.events[index].year,
                  price: category.events[index].categoriesPrices['Regular'].toString(),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 14.h),
              itemCount: category.events.length,
            ),
          ),
        ],
      ),
    );
  }
}

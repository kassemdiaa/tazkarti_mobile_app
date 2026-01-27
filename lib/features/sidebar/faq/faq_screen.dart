import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';
import 'package:tazkarti/core/icons/Icons_maneger.dart';
import 'package:tazkarti/core/widgets/header_info/header_info.dart';
import 'package:tazkarti/data/faq_models/taz_id_model.dart';
import 'package:tazkarti/features/sidebar/drawer.dart';
import 'package:tazkarti/features/sidebar/faq/faq_header.dart';
import 'package:tazkarti/features/sidebar/faq/faq_item.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderInfo(),
            Text('Frequently Asked', style: FontManeger.bigTitle),
            Text('Questions', style: FontManeger.bigTitle),
            SizedBox(height: 16.h),
            FaqHeader(headerTitle: 'About Tazkarti ID'),
            ListView.separated(
              shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FaqItem(
                  question: faqQuestionModel.faqsTazId[index].question,
                  answer: faqQuestionModel.faqsTazId[index].answer,
                );
              },
              itemCount: faqQuestionModel.faqsTazId.length,
              separatorBuilder: (context, index) => Container(
                color: ColorsManeger.gray,
                width: double.infinity,
                height: 1.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
              ),
            ),
            FaqHeader(headerTitle: 'Tazkarti ID Registration'),
            ListView.separated(
              shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FaqItem(
                  question: faqQuestionModel.faqsTazId[index].question,
                  answer: faqQuestionModel.faqsTazId[index].answer,
                );
              },
              itemCount: faqQuestionModel.faqsTazId.length,
              separatorBuilder: (context, index) => Container(
                color: ColorsManeger.gray,
                width: double.infinity,
                height: 1.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FaqItem(
                  question: faqQuestionModel.faqsTazId[index].question,
                  answer: faqQuestionModel.faqsTazId[index].answer,
                );
              },
              itemCount: faqQuestionModel.faqsTazId.length,
              separatorBuilder: (context, index) => Container(
                color: ColorsManeger.gray,
                width: double.infinity,
                height: 1.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
              ),
            ),
            FaqHeader(headerTitle: 'My Account'),
            ListView.separated(
              shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FaqItem(
                  question: faqQuestionModel.faqsTazId[index].question,
                  answer: faqQuestionModel.faqsTazId[index].answer,
                );
              },
              itemCount: faqQuestionModel.faqsTazId.length,
              separatorBuilder: (context, index) => Container(
                color: ColorsManeger.gray,
                width: double.infinity,
                height: 1.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
              ),
            ),
            FaqHeader(headerTitle: 'Family and Friends'),
            ListView.separated(
              shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FaqItem(
                  question: faqQuestionModel.faqsTazId[index].question,
                  answer: faqQuestionModel.faqsTazId[index].answer,
                );
              },
              itemCount: faqQuestionModel.faqsTazId.length,
              separatorBuilder: (context, index) => Container(
                color: ColorsManeger.gray,
                width: double.infinity,
                height: 1.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
              ),
            ),
            FaqHeader(headerTitle: 'Matches and Tickets'),
            ListView.separated(
              shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FaqItem(
                  question: faqQuestionModel.faqsTazId[index].question,
                  answer: faqQuestionModel.faqsTazId[index].answer,
                );
              },
              itemCount: faqQuestionModel.faqsTazId.length,
              separatorBuilder: (context, index) => Container(
                color: ColorsManeger.gray,
                width: double.infinity,
                height: 1.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/assets/assets.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/fonts/fonts.dart';

class HeaderInfo extends StatefulWidget {
  const HeaderInfo({super.key});

  @override
  State<HeaderInfo> createState() => _HeaderInfoState();
}

class _HeaderInfoState extends State<HeaderInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.h,),
        Row(
          children: [
            SizedBox(width: 12.w),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: ColorsManeger.gray, width: 1.5),
              ),

              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(28),

                child: Image.asset(AssetsManeger.avatar, width: 70),
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text('Kassem Elgammal', style: FontManeger.name),
                Row(
                  children: [
                    Text(
                      'Tazkarti Id',
                      style: TextStyle(
                        color: ColorsManeger.gray,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Text('012345678901234',style: TextStyle(),),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}

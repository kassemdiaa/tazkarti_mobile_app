import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/providers/registration_provider/registration_provider.dart';

class NationalitySelectionStep extends StatelessWidget {
  const NationalitySelectionStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
      builder: (context, provider, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Select Your Nationality',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Specify if you are Egyptian or from another country.',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorsManeger.darkGray,
                  ),
                ),
                SizedBox(height: 40.h),

                // Egyptian Option
                GestureDetector(
                  onTap: () {
                    provider.updateNationality('egyptian');
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: provider.registrationData.nationality == 'egyptian'
                            ? ColorsManeger.green
                            : ColorsManeger.bgColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        // Egyptian Flag Circle
                        Container(
                          width: 80.w,
                          height: 80.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorsManeger.bgColor,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 60.w,
                              height: 60.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/flags/egypt.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'Egyptian',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorsManeger.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Other Nationalities Option
                GestureDetector(
                  onTap: () {
                    provider.updateNationality('other');
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: provider.registrationData.nationality == 'other'
                            ? ColorsManeger.green
                            : ColorsManeger.bgColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        // World Globe Circle
                        Container(
                          width: 80.w,
                          height: 80.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorsManeger.bgColor,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.public,
                              size: 50.sp,
                              color: ColorsManeger.blue,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'Other Nationalities',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorsManeger.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

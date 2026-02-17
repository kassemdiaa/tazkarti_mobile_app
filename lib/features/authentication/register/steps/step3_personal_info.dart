import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/providers/registration_provider/registration_provider.dart';

class PersonalInformationStep extends StatefulWidget {
  const PersonalInformationStep({super.key});

  @override
  State<PersonalInformationStep> createState() =>
      _PersonalInformationStepState();
}

class _PersonalInformationStepState extends State<PersonalInformationStep> {
  late TextEditingController nameArabicController;
  late TextEditingController fatherNameController;
  late TextEditingController grandFatherNameController;
  late TextEditingController motherNameController;

  final List<String> bloodTypes = [
    'Prefer Not To Say',
    'O+',
    'O-',
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-'
  ];
  final List<String> genders = ['Prefer Not To Say', 'Male', 'Female', 'Other'];

  String? selectedBloodType;
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    final provider = context.read<RegistrationProvider>();
    nameArabicController =
        TextEditingController(text: provider.registrationData.nameInArabic);
    fatherNameController = TextEditingController(
        text: provider.registrationData.fatherNameInArabic);
    grandFatherNameController = TextEditingController(
        text: provider.registrationData.grandFatherNameInArabic);
    motherNameController = TextEditingController(
        text: provider.registrationData.motherNameInArabic);
    selectedBloodType = provider.registrationData.bloodType.isNotEmpty
        ? provider.registrationData.bloodType
        : null;
    selectedGender = provider.registrationData.gender.isNotEmpty
        ? provider.registrationData.gender
        : null;
  }

  @override
  void dispose() {
    nameArabicController.dispose();
    fatherNameController.dispose();
    grandFatherNameController.dispose();
    motherNameController.dispose();
    super.dispose();
  }

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
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Make sure you provide your correct personal information as stated in your National ID.',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorsManeger.darkGray,
                  ),
                ),
                SizedBox(height: 25.h),

                // Name in Arabic
                Text(
                  'Name in Arabic*',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 8.h),
                TextField(
                  controller: nameArabicController,
                  textDirection: TextDirection.rtl,
                  onChanged: (value) {
                    provider.updatePersonalInfo(
                      nameInArabic: value,
                      fatherNameInArabic: fatherNameController.text,
                      grandFatherNameInArabic: grandFatherNameController.text,
                      motherNameInArabic: motherNameController.text,
                      bloodType: selectedBloodType ?? '',
                      gender: selectedGender ?? '',
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'الاسم الأول',
                    filled: true,
                    fillColor: ColorsManeger.bgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                TextField(
                  controller: fatherNameController,
                  textDirection: TextDirection.rtl,
                  onChanged: (value) {
                    provider.updatePersonalInfo(
                      nameInArabic: nameArabicController.text,
                      fatherNameInArabic: value,
                      grandFatherNameInArabic: grandFatherNameController.text,
                      motherNameInArabic: motherNameController.text,
                      bloodType: selectedBloodType ?? '',
                      gender: selectedGender ?? '',
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'الاسم الوسط كاملا',
                    filled: true,
                    fillColor: ColorsManeger.bgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                TextField(
                  controller: grandFatherNameController,
                  textDirection: TextDirection.rtl,
                  onChanged: (value) {
                    provider.updatePersonalInfo(
                      nameInArabic: nameArabicController.text,
                      fatherNameInArabic: fatherNameController.text,
                      grandFatherNameInArabic: value,
                      motherNameInArabic: motherNameController.text,
                      bloodType: selectedBloodType ?? '',
                      gender: selectedGender ?? '',
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'الاسم الأخير',
                    filled: true,
                    fillColor: ColorsManeger.bgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Mother Name in Arabic
                Text(
                  'Mother Name in Arabic*',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'To ensure that your data is not being used by someone else, Enter your mother\'s name as stated in your birth certificate.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorsManeger.darkGray,
                  ),
                ),
                SizedBox(height: 8.h),
                TextField(
                  controller: motherNameController,
                  textDirection: TextDirection.rtl,
                  onChanged: (value) {
                    provider.updatePersonalInfo(
                      nameInArabic: nameArabicController.text,
                      fatherNameInArabic: fatherNameController.text,
                      grandFatherNameInArabic: grandFatherNameController.text,
                      motherNameInArabic: value,
                      bloodType: selectedBloodType ?? '',
                      gender: selectedGender ?? '',
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'ادخل اسم الام ثلاثيا',
                    filled: true,
                    fillColor: ColorsManeger.bgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Blood Type
                Text(
                  'Blood type',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField<String>(
                  initialValue: selectedBloodType,
                  items: bloodTypes
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedBloodType = value;
                    });
                    provider.updatePersonalInfo(
                      nameInArabic: nameArabicController.text,
                      fatherNameInArabic: fatherNameController.text,
                      grandFatherNameInArabic: grandFatherNameController.text,
                      motherNameInArabic: motherNameController.text,
                      bloodType: value ?? '',
                      gender: selectedGender ?? '',
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'Prefer Not To Say',
                    filled: true,
                    fillColor: ColorsManeger.bgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Gender
                Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField<String>(
                  initialValue: selectedGender,
                  items: genders
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                    provider.updatePersonalInfo(
                      nameInArabic: nameArabicController.text,
                      fatherNameInArabic: fatherNameController.text,
                      grandFatherNameInArabic: grandFatherNameController.text,
                      motherNameInArabic: motherNameController.text,
                      bloodType: selectedBloodType ?? '',
                      gender: value ?? '',
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'Prefer Not To Say',
                    filled: true,
                    fillColor: ColorsManeger.bgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/providers/registration_provider/registration_provider.dart';

class ContactInformationStep extends StatefulWidget {
  const ContactInformationStep({super.key});

  @override
  State<ContactInformationStep> createState() => _ContactInformationStepState();
}

class _ContactInformationStepState extends State<ContactInformationStep> {
  late TextEditingController countryController;
  late TextEditingController emailController;
  late TextEditingController dateController;

  final List<String> cities = ['Cairo', 'Alexandria', 'Giza', 'Qena', 'Aswan'];
  final List<String> regions = ['North', 'Central', 'South'];
  final List<String> languages = ['Arabic', 'English'];

  String? selectedCity;
  String? selectedRegion;
  String? selectedLanguage;

  @override
  void initState() {
    super.initState();
    final provider = context.read<RegistrationProvider>();
    countryController =
        TextEditingController(text: provider.registrationData.country);
    emailController =
        TextEditingController(text: provider.registrationData.email);
    dateController =
        TextEditingController(text: provider.registrationData.dateOfBirth);
    selectedCity = provider.registrationData.city.isNotEmpty
        ? provider.registrationData.city
        : null;
    selectedRegion = provider.registrationData.region.isNotEmpty
        ? provider.registrationData.region
        : null;
    selectedLanguage = provider.registrationData.language.isNotEmpty
        ? provider.registrationData.language
        : null;
  }

  @override
  void dispose() {
    countryController.dispose();
    emailController.dispose();
    dateController.dispose();
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
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Make sure you provide your personal mobile number and email address.',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorsManeger.darkGray,
                  ),
                ),
                SizedBox(height: 25.h),

                // Country
                Text(
                  'Country of Nationality*',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 8.h),
                TextField(
                  controller: countryController,
                  onChanged: (value) {
                    provider.updateContactInfo(
                      country: value,
                      city: selectedCity ?? '',
                      region: selectedRegion ?? '',
                      language: selectedLanguage ?? '',
                      dateOfBirth: dateController.text,
                      email: emailController.text,
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'Egypt',
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

                // City Dropdown
                Text(
                  'City*',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField<String>(
                  initialValue: selectedCity,
                  items: cities
                      .map((city) => DropdownMenuItem(
                            value: city,
                            child: Text(city),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                    provider.updateContactInfo(
                      country: countryController.text,
                      city: value ?? '',
                      region: selectedRegion ?? '',
                      language: selectedLanguage ?? '',
                      dateOfBirth: dateController.text,
                      email: emailController.text,
                    );
                  },
                  decoration: InputDecoration(
                    hintText: '-- Select --',
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

                // Region Dropdown
                Text(
                  'Region*',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField<String>(
                  initialValue: selectedRegion,
                  items: regions
                      .map((region) => DropdownMenuItem(
                            value: region,
                            child: Text(region),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRegion = value;
                    });
                    provider.updateContactInfo(
                      country: countryController.text,
                      city: selectedCity ?? '',
                      region: value ?? '',
                      language: selectedLanguage ?? '',
                      dateOfBirth: dateController.text,
                      email: emailController.text,
                    );
                  },
                  decoration: InputDecoration(
                    hintText: '-- Select --',
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

                // Language Dropdown
                Text(
                  'Language of communication*',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField<String>(
                  initialValue: selectedLanguage,
                  items: languages
                      .map((lang) => DropdownMenuItem(
                            value: lang,
                            child: Text(lang),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value;
                    });
                    provider.updateContactInfo(
                      country: countryController.text,
                      city: selectedCity ?? '',
                      region: selectedRegion ?? '',
                      language: value ?? '',
                      dateOfBirth: dateController.text,
                      email: emailController.text,
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'Arabic',
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

                // Date of Birth
                Text(
                  'Date of birth*',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 8.h),
                TextField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      final dateStr =
                          '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
                      dateController.text = dateStr;
                      provider.updateContactInfo(
                        country: countryController.text,
                        city: selectedCity ?? '',
                        region: selectedRegion ?? '',
                        language: selectedLanguage ?? '',
                        dateOfBirth: dateStr,
                        email: emailController.text,
                      );
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Select date',
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
                    suffixIcon: Icon(Icons.calendar_today, size: 20.sp),
                  ),
                ),
                SizedBox(height: 20.h),

                // Email
                Text(
                  'Email*',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 8.h),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    provider.updateContactInfo(
                      country: countryController.text,
                      city: selectedCity ?? '',
                      region: selectedRegion ?? '',
                      language: selectedLanguage ?? '',
                      dateOfBirth: dateController.text,
                      email: value,
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'example@example.com',
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

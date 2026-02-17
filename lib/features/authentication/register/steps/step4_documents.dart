import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/providers/registration_provider/registration_provider.dart';

class DocumentsStep extends StatefulWidget {
  const DocumentsStep({super.key});

  @override
  State<DocumentsStep> createState() => _DocumentsStepState();
}

class _DocumentsStepState extends State<DocumentsStep> {
  late TextEditingController nationalIdController;
  File? nationalIdImage;
  File? personalPhotoImage;
  String? selectedAccountType;

  final List<String> accountTypes = [
    'Entertainment Account Only (instant activation)',
    'Sports and Entertainment Account'
  ];

  @override
  void initState() {
    super.initState();
    final provider = context.read<RegistrationProvider>();
    nationalIdController =
        TextEditingController(text: provider.registrationData.nationalIdNumber);
    selectedAccountType = provider.registrationData.accountType.isNotEmpty
        ? provider.registrationData.accountType
        : null;
  }

  @override
  void dispose() {
    nationalIdController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(bool isNationalId) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        if (isNationalId) {
          nationalIdImage = File(pickedFile.path);
          context.read<RegistrationProvider>().setNationalIdImage(pickedFile.path);
        } else {
          personalPhotoImage = File(pickedFile.path);
          context.read<RegistrationProvider>().setPersonalPhotoImage(pickedFile.path);
        }
      });
    }
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
                  'Documents',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Make sure you provide the required information as stated in your National ID.',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorsManeger.darkGray,
                  ),
                ),
                SizedBox(height: 25.h),

                // National ID Number
                Text(
                  'National ID number*',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '14 digits',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorsManeger.gray,
                  ),
                ),
                SizedBox(height: 8.h),
                TextField(
                  controller: nationalIdController,
                  keyboardType: TextInputType.number,
                  maxLength: 14,
                  onChanged: (value) {
                    provider.updateDocuments(
                      nationalIdNumber: value,
                      nationalIdImage: nationalIdImage?.path,
                      personalPhotoImage: personalPhotoImage?.path,
                    );
                  },
                  decoration: InputDecoration(
                    hintText: '21234567891234',
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
                    counterText: '',
                  ),
                ),
                SizedBox(height: 20.h),

                // National ID Image
                Text(
                  'Image of National ID*',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 12.h),
                _buildImageUploadCard(
                  isNationalId: true,
                  image: nationalIdImage,
                  onTap: () => _pickImage(true),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Supported file types to upload are JPG and PNG.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorsManeger.darkGray,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'The maximum file size to upload is 5 MB.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorsManeger.darkGray,
                  ),
                ),
                SizedBox(height: 20.h),

                // Example Image Placeholder
                Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsManeger.gray),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image, size: 40.sp, color: ColorsManeger.gray),
                        SizedBox(height: 8.h),
                        Text(
                          'Example of approved image',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorsManeger.gray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25.h),

                // Personal Photo
                Text(
                  'Image of Personal Photo*',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 12.h),
                _buildImageUploadCard(
                  isNationalId: false,
                  image: personalPhotoImage,
                  onTap: () => _pickImage(false),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Supported file types to upload are JPG and PNG.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorsManeger.darkGray,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'The maximum file size to upload is 5 MB.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorsManeger.darkGray,
                  ),
                ),
                SizedBox(height: 20.h),

                // Photo Requirements
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsManeger.gray),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The photo must meet the following conditions:',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManeger.black,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      _buildRequirement('Right-side-up (not rotated) to be printed on your Tazkarti ID'),
                      _buildRequirement('No more than 12 months old'),
                      _buildRequirement('35-40 mm in width'),
                      _buildRequirement('Face takes up 70-80% of it'),
                      _buildRequirement('No sunglasses, hats, or caps'),
                      _buildRequirement('Show you alone with neutral expression'),
                      _buildRequirement('Clear and of high quality'),
                    ],
                  ),
                ),
                SizedBox(height: 25.h),

                // Account Type
                Text(
                  'Tazkarti Account Type*',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManeger.black,
                  ),
                ),
                SizedBox(height: 12.h),
                ...accountTypes.map((type) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAccountType = type;
                          provider.updateAccountType(type);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedAccountType == type
                                ? ColorsManeger.green
                                : ColorsManeger.gray,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          children: [
                            Radio<String>(
                              value: type,
                              groupValue: selectedAccountType,
                              onChanged: (value) {
                                setState(() {
                                  selectedAccountType = value;
                                  provider.updateAccountType(value ?? '');
                                });
                              },
                              activeColor: ColorsManeger.green,
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Text(
                                type,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: ColorsManeger.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageUploadCard({
    required bool isNationalId,
    required File? image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManeger.bgColor),
          borderRadius: BorderRadius.circular(8.r),
          color: ColorsManeger.bgColor,
        ),
        child: image != null
            ? Column(
                children: [
                  Image.file(
                    image,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 12.h),
                  ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManeger.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Change Image',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorsManeger.white,
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image,
                    size: 40.sp,
                    color: ColorsManeger.gray,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Choose image',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: ColorsManeger.darkGray,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManeger.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Attach Image',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorsManeger.white,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildRequirement(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(fontSize: 16.sp, color: ColorsManeger.darkGray),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                color: ColorsManeger.darkGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

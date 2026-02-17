import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tazkarti/core/colors/colors.dart';
import 'package:tazkarti/core/routes/routes.dart';
import 'package:tazkarti/features/authentication/register/steps/step1_nationality.dart';
import 'package:tazkarti/features/authentication/register/steps/step2_contact_info.dart';
import 'package:tazkarti/features/authentication/register/steps/step3_personal_info.dart';
import 'package:tazkarti/features/authentication/register/steps/step4_documents.dart';
import 'package:tazkarti/providers/registration_provider/registration_provider.dart';
import 'package:tazkarti/features/sidebar/drawer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegistrationProvider(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: ColorsManeger.black,
          title: SvgPicture.asset('assets/logo1.svg', width: 70.w),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Icon(
                CupertinoIcons.globe,
                size: 20.sp,
                color: ColorsManeger.white,
              ),
            ),
          ],
          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: Icon(
              Icons.menu,
              color: ColorsManeger.white,
            ),
          ),
        ),
        drawer: const CustomDrawer(),
        body: Consumer<RegistrationProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                // Progress Indicator
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: _buildProgressIndicator(provider.currentStep),
                ),
                
                // Steps Content
                Expanded(
                  child: _buildStepContent(provider.currentStep),
                ),

                // Navigation Buttons
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: _buildNavigationButtons(provider),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(int currentStep) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // Steps circles with connecting line
          Row(
            children: [
              ...List.generate(4, (index) {
                bool isCompleted = index < currentStep;
                bool isCurrent = index == currentStep;
                
                return Expanded(
                  child: Row(
                    children: [
                      // Circle
                      Container(
                        width: 50.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCompleted || isCurrent
                              ? ColorsManeger.green
                              : ColorsManeger.bgColor,
                          border: Border.all(
                            color: isCurrent
                                ? ColorsManeger.green
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: isCompleted
                              ? Icon(
                                  Icons.check,
                                  color: ColorsManeger.white,
                                  size: 24.sp,
                                )
                              : Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: isCurrent
                                        ? ColorsManeger.white
                                        : ColorsManeger.gray,
                                  ),
                                ),
                        ),
                      ),
                      
                      // Connecting Line
                      if (index < 3)
                        Expanded(
                          child: Container(
                            height: 3.h,
                            color: index < currentStep
                                ? ColorsManeger.green
                                : ColorsManeger.bgColor,
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ],
          ),
          
          SizedBox(height: 12.h),
          
          // Step Titles
          const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildStepContent(int step) {
    switch (step) {
      case 0:
        return const NationalitySelectionStep();
      case 1:
        return const ContactInformationStep();
      case 2:
        return const PersonalInformationStep();
      case 3:
        return const DocumentsStep();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildNavigationButtons(RegistrationProvider provider) {
    bool canProceed = _canProceedToNextStep(provider);

    return Row(
      children: [
        if (provider.currentStep > 0)
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                provider.previousStep();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManeger.gray,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),
              child: Text(
                'Back',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorsManeger.white,
                ),
              ),
            ),
          ),
        if (provider.currentStep > 0) SizedBox(width: 12.w),
        Expanded(
          child: ElevatedButton(
            onPressed: canProceed
                ? () {
                    if (provider.currentStep < 3) {
                      _saveCurrentStep(provider);
                      provider.nextStep();
                    } else {
                      _submitRegistration(provider);
                    }
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  canProceed ? ColorsManeger.green : ColorsManeger.gray,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 14.h),
            ),
            child: Text(
              provider.currentStep == 3 ? 'Complete' : 'Proceed',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: ColorsManeger.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool _canProceedToNextStep(RegistrationProvider provider) {
    switch (provider.currentStep) {
      case 0:
        return provider.registrationData.isStep1Valid();
      case 1:
        return provider.registrationData.isStep2Valid();
      case 2:
        return provider.registrationData.isStep3Valid();
      case 3:
        return provider.registrationData.isStep4Valid();
      default:
        return false;
    }
  }

  void _saveCurrentStep(RegistrationProvider provider) {
    // Validation and auto-save handled by individual step widgets
  }

  void _submitRegistration(RegistrationProvider provider) {
    // Show success dialog or navigate to confirmation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: const Text('Registration completed successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, RoutesManeger.loginScreen);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
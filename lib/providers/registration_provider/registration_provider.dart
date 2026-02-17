import 'package:flutter/material.dart';
import 'package:tazkarti/features/authentication/register/models/registration_model.dart';

class RegistrationProvider extends ChangeNotifier {
  late RegistrationModel _registrationData;
  int _currentStep = 0;

  RegistrationProvider() {
    _registrationData = RegistrationModel();
  }

  RegistrationModel get registrationData => _registrationData;
  int get currentStep => _currentStep;

  void updateNationality(String value) {
    _registrationData.nationality = value;
    notifyListeners();
  }

  void updateContactInfo({
    required String country,
    required String city,
    required String region,
    required String language,
    required String dateOfBirth,
    required String email,
  }) {
    _registrationData.country = country;
    _registrationData.city = city;
    _registrationData.region = region;
    _registrationData.language = language;
    _registrationData.dateOfBirth = dateOfBirth;
    _registrationData.email = email;
    notifyListeners();
  }

  void updatePersonalInfo({
    required String nameInArabic,
    required String fatherNameInArabic,
    required String grandFatherNameInArabic,
    required String motherNameInArabic,
    required String bloodType,
    required String gender,
  }) {
    _registrationData.nameInArabic = nameInArabic;
    _registrationData.fatherNameInArabic = fatherNameInArabic;
    _registrationData.grandFatherNameInArabic = grandFatherNameInArabic;
    _registrationData.motherNameInArabic = motherNameInArabic;
    _registrationData.bloodType = bloodType;
    _registrationData.gender = gender;
    notifyListeners();
  }

  void updateDocuments({
    required String nationalIdNumber,
    String? nationalIdImage,
    String? personalPhotoImage,
  }) {
    _registrationData.nationalIdNumber = nationalIdNumber;
    if (nationalIdImage != null) {
      _registrationData.nationalIdImage = nationalIdImage;
    }
    if (personalPhotoImage != null) {
      _registrationData.personalPhotoImage = personalPhotoImage;
    }
    notifyListeners();
  }

  void updateAccountType(String type) {
    _registrationData.accountType = type;
    notifyListeners();
  }

  void setNationalIdImage(String path) {
    _registrationData.nationalIdImage = path;
    notifyListeners();
  }

  void setPersonalPhotoImage(String path) {
    _registrationData.personalPhotoImage = path;
    notifyListeners();
  }

  void nextStep() {
    if (_currentStep < 3) {
      _currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  void goToStep(int step) {
    if (step >= 0 && step <= 3) {
      _currentStep = step;
      notifyListeners();
    }
  }

  void reset() {
    _registrationData = RegistrationModel();
    _currentStep = 0;
    notifyListeners();
  }
}

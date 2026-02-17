class RegistrationModel {
  // Step 1: Nationality
  String nationality; // 'egyptian' or 'other'

  // Step 2: Contact Information
  String country;
  String city;
  String region;
  String language;
  String dateOfBirth;
  String email;

  // Step 3: Personal Information
  String nameInArabic;
  String fatherNameInArabic;
  String grandFatherNameInArabic;
  String motherNameInArabic;
  String bloodType;
  String gender;

  // Step 4: Documents
  String nationalIdNumber;
  String? nationalIdImage;
  String? personalPhotoImage;

  // Account Type
  String accountType; // 'entertainment' or 'sports_entertainment'

  RegistrationModel({
    this.nationality = '',
    this.country = '',
    this.city = '',
    this.region = '',
    this.language = '',
    this.dateOfBirth = '',
    this.email = '',
    this.nameInArabic = '',
    this.fatherNameInArabic = '',
    this.grandFatherNameInArabic = '',
    this.motherNameInArabic = '',
    this.bloodType = '',
    this.gender = '',
    this.nationalIdNumber = '',
    this.nationalIdImage,
    this.personalPhotoImage,
    this.accountType = '',
  });

  // Validation methods
  bool isStep1Valid() => nationality.isNotEmpty;

  bool isStep2Valid() =>
      country.isNotEmpty &&
      city.isNotEmpty &&
      region.isNotEmpty &&
      language.isNotEmpty &&
      dateOfBirth.isNotEmpty &&
      email.isNotEmpty;

  bool isStep3Valid() =>
      nameInArabic.isNotEmpty &&
      motherNameInArabic.isNotEmpty &&
      bloodType.isNotEmpty &&
      gender.isNotEmpty;

  bool isStep4Valid() =>
      nationalIdNumber.isNotEmpty &&
      nationalIdImage != null &&
      personalPhotoImage != null &&
      accountType.isNotEmpty;
}

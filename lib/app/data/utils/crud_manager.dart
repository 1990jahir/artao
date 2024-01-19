
import 'package:shared_preferences/shared_preferences.dart';

class CrudManager {
  CrudManager._();

  static const idKey = 'id';
  static const tokenKey = 'token';
  static const pictureKey = 'profile_picture';
  static const unitKey = 'unit';
  static const emailKey = 'email';
  static const password = 'password';
  static const termsCondition = 'termsCondition';
  static const phoneNumberKey = 'phone_number';
  static const profileImageKey = 'profile_image';
  static const my_string_list_key = 'my_string_list_key';
  static const userEmail = 'user_email';
  static const firstNameKey = 'first_name';
  static const lastNameKey = 'last_name';

  static Future<void> saveUserData({
    required String id,
    required String token,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  }) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(idKey, id);
    await preferences.setString(tokenKey, token);
    await preferences.setString(firstNameKey, firstName);
    await preferences.setString(lastNameKey, lastName);
    await preferences.setString(emailKey, email);
    await preferences.setString(phoneNumberKey, phoneNumber);
  }

  static Future<void> saveUserCredentials({
    required String email1,
    required String password1,
  }) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(emailKey, email1);
    await preferences.setString(password, password1);
  }

  static Future<void> saveTermsCheck({
    required String terms,
  }) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(termsCondition, terms);
  }

  static Future<void> saveProfilePicture({
    required String profilePicture,
  }) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(profileImageKey, profilePicture);
  }

  static Future<String?> getId() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(idKey);
  }
  static Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(tokenKey);
  }

  static Future<String?> getEmail() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(emailKey);
  }

  static Future<String?> getPassword() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(password);
  }

  static Future<String?> getTerms() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(termsCondition);
  }


  static Future<String?> getUnit() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(unitKey);
  }

  static Future<String?> getProfilePicture() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(pictureKey);
  }

  static Future<String?> getPhoneNumber() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(phoneNumberKey);
  }

  static Future<String?> getProfileImage() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(profileImageKey);
  }

  static Future<String?> getUserEmail() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(userEmail);
  }

  static Future<String?> getFirstName() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(firstNameKey);
  }

  static Future<String?> getLastName() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(lastNameKey);
  }

  static Future<void> clearUserData() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(idKey);
    await preferences.remove(pictureKey);
  }

  static Future<void> clearUserCredentials() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(emailKey);
    await preferences.remove(password);
    await preferences.remove(tokenKey);
  }


}

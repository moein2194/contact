
// import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  // static SharedPreferences? preferences;

  static Future<void> initial() async {
    // preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> addorUpdate(
      {required String key, required dynamic value}) async {
    return /* await preferences!.setString(key, value) */ true;
  }

  static Future<bool> remove({required String key}) async {
    return /* await preferences!.remove(key) */ true;
  }

  static Future<String> get({required String key}) async {
    return /* preferences!.getString(key)! */ "";
  }
}
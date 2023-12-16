import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  late SharedPreferences prefs;

  SharedPreferencesService() {
    init();
  }

  init() async {
    print("Iniciando preferences");
    prefs = await SharedPreferences.getInstance();
  }

  echo() {
    prefs.setBool('echo', true);
    print("echo...");
  }

  saveProfile({required int userProfile}) {
    prefs.setInt('profile', userProfile);
  }

  Future<int> getProfile() async {
    int profile = prefs.getInt('profile') ?? 0;
    return profile;
  }

  Future<bool> logout() async {
    prefs.remove('profile');
    return true;
  }
}

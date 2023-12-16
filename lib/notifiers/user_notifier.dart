import 'package:flutter/cupertino.dart';

class UserNotifier extends ChangeNotifier {
  int profile = 0;

  setProfile({required int newProfile}) {
    print("El perfil del usuario es: $newProfile");
    profile = newProfile;
    notifyListeners();
  }
}

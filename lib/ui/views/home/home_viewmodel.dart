import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:login/app/app.locator.dart';
import 'package:login/services/api_service.dart';
import 'package:login/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isProcessing = false;

  Future<int> login() async {
    var api = locator<ApiService>();
    isProcessing = true;
    rebuildUi();
    try {
      Response response = await api.post(url: "/login", body: {
        "userName": usernameController.text,
        "password": passwordController.text,
      });
      locator<SharedPreferencesService>()
          .saveProfile(userProfile: response.data['profileId']);
      isProcessing = false;
      rebuildUi();
      return response.data['profileId'];
    } catch (error, stacktrace) {
      isProcessing = false;
      rebuildUi();
      return 0;
    }

  }
}

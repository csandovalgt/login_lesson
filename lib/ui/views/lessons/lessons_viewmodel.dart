import 'package:login/app/app.router.dart';
import 'package:login/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class LessonsViewModel extends BaseViewModel {
  logout() {
    locator<SharedPreferencesService>().logout();
    locator<NavigationService>().replaceWithHomeView();
  }
}

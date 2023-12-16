import 'package:login/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:login/app/app.locator.dart';
import 'package:login/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(milliseconds: 300));
    int profile = await locator<SharedPreferencesService>().getProfile();
    if (profile == 0) {
      _navigationService.replaceWithHomeView();
    } else {
      _navigationService.replaceWithLessonsView();
    }




  }
}

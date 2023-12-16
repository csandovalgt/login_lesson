import 'package:login/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:login/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:login/ui/views/home/home_view.dart';
import 'package:login/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:login/services/shared_preferences_service.dart';
import 'package:login/services/api_service.dart';
import 'package:login/ui/views/lessons/lessons_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LessonsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    Singleton(classType: SharedPreferencesService),
    LazySingleton(classType: ApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}

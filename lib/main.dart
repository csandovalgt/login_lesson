import 'package:flutter/material.dart';
import 'package:login/app/app.bottomsheets.dart';
import 'package:login/app/app.dialogs.dart';
import 'package:login/app/app.locator.dart';
import 'package:login/app/app.router.dart';
import 'package:login/notifiers/user_notifier.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserNotifier>(create: (_) => UserNotifier())
      ],
      child: MaterialApp(
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
      ),
    );
  }
}

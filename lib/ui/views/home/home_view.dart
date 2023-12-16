import 'package:flutter/material.dart';
import 'package:login/app/app.router.dart';
import 'package:login/notifiers/user_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:login/ui/common/app_colors.dart';
import 'package:login/ui/common/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: viewModel.usernameController,
                  decoration: const InputDecoration(
                    label: Text("Usuario"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: viewModel.passwordController,
                  decoration: const InputDecoration(
                    label: Text("Password"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    int userProfile = await viewModel.login();
                    context
                        .read<UserNotifier>()
                        .setProfile(newProfile: userProfile);
                    if (userProfile == 1 || userProfile == 2) {
                      locator<NavigationService>().navigateToLessonsView();
                    }
                  },
                  child: viewModel.isProcessing ? CircularProgressIndicator() : const Text("Iniciar sesión"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

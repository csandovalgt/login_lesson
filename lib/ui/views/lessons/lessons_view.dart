import 'package:flutter/material.dart';
import 'package:login/notifiers/user_notifier.dart';
import 'package:login/ui/views/lessons/widgets/student_body.dart';
import 'package:login/ui/views/lessons/widgets/teacher_body.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'lessons_viewmodel.dart';

class LessonsView extends StackedView<LessonsViewModel> {
  const LessonsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LessonsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: context.watch<UserNotifier>().profile == 2
          ? Colors.blueGrey
          : Colors.white10,
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: viewModel.logout,
            child: Icon(
              Icons.close,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: context.watch<UserNotifier>().profile == 2
          ? const StudentBody()
          : const TeacherBody(),
    );
  }

  @override
  LessonsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LessonsViewModel();
}

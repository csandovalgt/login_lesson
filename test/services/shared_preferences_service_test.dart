import 'package:flutter_test/flutter_test.dart';
import 'package:login/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SharedPreferencesServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}

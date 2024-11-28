import 'package:flutter/material.dart';
import 'package:flutter_netflix_app/app/view/app.dart';

import 'core/di/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const App());
}

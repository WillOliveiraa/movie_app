import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import 'package:will_design_system/will_design_system.dart';

import 'src/modules/movie/movie_module.dart';

void main() {
  runApp(ModularApp(module: MovieModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Will Movie App',
      theme: Themes.lightTheme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

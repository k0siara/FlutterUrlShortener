import 'package:flutter/material.dart';
import 'package:flutter_url_shortener/assets/app_colors.dart';
import 'assets/app_strings.dart';
import 'my_home_page.dart';
import 'package:logging/logging.dart';

void main() {
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.APP_TITLE,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.accentColor,
      ),
      home: MyHomePage(title: AppStrings.HOME_PAGE_TITLE),
    );
  }
}

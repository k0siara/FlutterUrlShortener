import 'package:flutter/material.dart';
import 'file:///C:/Users/Patryk/Desktop/FlutterUrlShortener/flutter_url_shortener/lib/assets/strings.dart';

import 'my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.APP_TITLE,
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
        accentColor: Colors.green.shade600,
      ),
      home: MyHomePage(title: Strings.HOME_PAGE_TITLE),
    );
  }
}

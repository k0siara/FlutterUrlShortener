import 'package:flutter/material.dart';
import 'package:flutter_url_shortener/repositories/short_url_repository.dart';
import 'app.dart';
import 'package:logging/logging.dart';

void main() {
  _setupLogging();
  runApp(MyApp(
    shortUrlRepository: ShortUrlRepository(),
  ));
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_url_shortener/assets/app_colors.dart';
import 'package:flutter_url_shortener/assets/app_strings.dart';
import 'package:flutter_url_shortener/bloc/shortened_url__bloc.dart';
import 'package:flutter_url_shortener/repositories/short_url_repository.dart';
import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  final ShortUrlRepository shortUrlRepository;

  const MyApp({
    Key key,
    this.shortUrlRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.APP_TITLE,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.accentColor,
      ),
      home: BlocProvider<ShortenedUrlBloc>(
        create: (context) => ShortenedUrlBloc(shortUrlRepository),
        child: HomePage(title: AppStrings.HOME_PAGE_TITLE),
      ),
    );
  }
}

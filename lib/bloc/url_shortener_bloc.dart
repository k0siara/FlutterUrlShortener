import 'dart:async';
import 'package:flutter_url_shortener/bloc/bloc.dart';
import 'package:flutter_url_shortener/repositories/short_url_repository.dart';

class UrlShortenerBloc extends Bloc {
  final _repository = ShortUrlRepository();
  String _shortenedUrl;

  final _shortenedUrlStateController = StreamController<String>();
  StreamSink<String> get _inputUrl => _shortenedUrlStateController.sink;
  Stream<String> get shortenedUrl => _shortenedUrlStateController.stream;

  void submitUrlToShorten(String url) async {
    final result = (await _repository.getShortenedUrl(url)).body.resultUrl;
    _inputUrl.add(result);
  }

  @override
  void dispose() {
    _shortenedUrlStateController.close();
  }
}
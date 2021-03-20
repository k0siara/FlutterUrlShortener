import 'package:chopper/chopper.dart';
import 'package:flutter_url_shortener/data/url_shortener_api_service.dart';
import 'package:flutter_url_shortener/model/built_shortened_url.dart';

class ShortUrlRepository {
  final service = UrlShortenerApiService.create();

  Future<Response<BuiltShortenedUrl>> getShortenedUrl(String url) {
    return service.getShortUrl(url);
  }
}
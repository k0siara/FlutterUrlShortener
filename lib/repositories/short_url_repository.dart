import 'package:flutter_url_shortener/data/url_shortener_api_service.dart';
import 'package:flutter_url_shortener/model/shortened_url.dart';

class ShortUrlRepository {
  final service = UrlShortenerApiService.create();

  Future<ShortenedUrl> getShortenedUrl(String url) async {
    var response = await service.getShortUrl(url);
    return ShortenedUrl.fromJson(response.body);
  }
}
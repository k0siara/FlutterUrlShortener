import 'package:chopper/chopper.dart';
import 'package:flutter_url_shortener/model/built_shortened_url.dart';

import 'built_value_converter.dart';

part 'url_shortener_api_service.chopper.dart';

@ChopperApi()
abstract class UrlShortenerApiService extends ChopperService {

  static UrlShortenerApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://cleanuri.com/api/v1/shorten',
      services: [
        _$UrlShortenerApiService()
      ],
      interceptors: [HttpLoggingInterceptor()],
      converter: BuiltValueConverter()
    );
    return _$UrlShortenerApiService(client);
  }

  @Post()
  Future<Response<BuiltShortenedUrl>> getShortUrl(@Query('url') String url);
}
import 'package:chopper/chopper.dart';

part 'url_shortener_api_service.chopper.dart';

@ChopperApi()
abstract class UrlShortenerApiService extends ChopperService {
  static UrlShortenerApiService create() {
    final client = ChopperClient(
        baseUrl: 'https://cleanuri.com/api/v1/',
        services: [_$UrlShortenerApiService()],
        interceptors: [HttpLoggingInterceptor()],
        converter: JsonConverter());
    return _$UrlShortenerApiService(client);
  }

  @Post(path: 'shorten')
  @Multipart()
  Future<Response> getShortUrl(@Part('url') String url);
}

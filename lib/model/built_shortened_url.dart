import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'built_shortened_url.g.dart';

abstract class BuiltShortenedUrl implements Built<BuiltShortenedUrl, BuiltShortenedUrlBuilder> {
  BuiltShortenedUrl._();

  factory BuiltShortenedUrl([updates(BuiltShortenedUrlBuilder b)]) = _$BuiltShortenedUrl;

  @BuiltValueField(wireName: 'result_url')
  String get resultUrl;

  static Serializer<BuiltShortenedUrl> get serializer => _$builtShortenedUrlSerializer;
}

import 'package:json_annotation/json_annotation.dart';

part 'shortened_url.g.dart';

@JsonSerializable()
class ShortenedUrl {
  @JsonKey(name: 'result_url')
  String resultUrl;

  ShortenedUrl(this.resultUrl);

  factory ShortenedUrl.fromJson(Map<String, dynamic> json) => _$ShortenedUrlFromJson(json);
  Map<String, dynamic> toJson() => _$ShortenedUrlToJson(this);
}

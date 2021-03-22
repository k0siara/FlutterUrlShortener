part of 'shortened_url__bloc.dart';

@immutable
abstract class ShortenedUrlEvent {}

class UrlToBeShortenedChangedEvent extends ShortenedUrlEvent {
  final String urlToBeShortened;

  UrlToBeShortenedChangedEvent(this.urlToBeShortened);
}

class FetchShortenedUrlEvent extends ShortenedUrlEvent {}

class ShortenUrlSuccessEvent extends ShortenedUrlEvent {
  final String urlToBeShortened;
  final String shortenedUrl;

  ShortenUrlSuccessEvent(this.urlToBeShortened, this.shortenedUrl);
}

class ShortenUrlErrorEvent extends ShortenedUrlEvent {}

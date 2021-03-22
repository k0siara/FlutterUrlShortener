part of 'shortened_url__bloc.dart';

@immutable
abstract class ShortenedUrlEvent {}

class UrlToBeShortenedChangedEvent extends ShortenedUrlEvent {
  final String urlToBeShortened;

  UrlToBeShortenedChangedEvent(this.urlToBeShortened);
}

class FetchShortenedUrlEvent extends ShortenedUrlEvent {}

class DialogDismissedEvent extends ShortenedUrlEvent {}

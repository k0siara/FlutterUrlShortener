part of 'shortened_url__bloc.dart';

@immutable
class ShortenedUrlState extends Equatable {
  final String urlToBeShortened;
  final String shortenedUrl;
  final String errorMessage;
  final bool isLoading;

  ShortenedUrlState({
    this.errorMessage,
    this.urlToBeShortened,
    this.shortenedUrl,
    this.isLoading,
  });

  ShortenedUrlState copyWith({
    String urlToBeShortened,
    String shortenedUrl,
    String errorMessage,
    bool isLoading,
  }) {
    return ShortenedUrlState(
      urlToBeShortened: urlToBeShortened ?? this.urlToBeShortened,
      shortenedUrl: shortenedUrl ?? this.shortenedUrl,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        urlToBeShortened,
        shortenedUrl,
        errorMessage,
        isLoading,
      ];
}

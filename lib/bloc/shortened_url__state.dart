part of 'shortened_url__bloc.dart';

@immutable
class ShortenedUrlState extends Equatable {
  final String urlToBeShortened;
  final String shortenedUrl;
  final String errorMessage;

  ShortenedUrlState({
    this.urlToBeShortened,
    this.shortenedUrl,
    this.errorMessage
  });

  ShortenedUrlState copyWith({
    String urlToBeShortened,
    String shortenedUrl,
    String errorMessage,
  }) {
    return ShortenedUrlState(
      urlToBeShortened: urlToBeShortened ?? this.urlToBeShortened,
      shortenedUrl: shortenedUrl ?? this.shortenedUrl,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [urlToBeShortened, shortenedUrl, errorMessage];
}

class ShortenedUrlInitialState extends ShortenedUrlState {
  ShortenedUrlInitialState() : super(
      urlToBeShortened: "",
      shortenedUrl: "",
      errorMessage: ""
  );
}
//
class ShortenedUrlLoadingState extends ShortenedUrlState {
  ShortenedUrlLoadingState(String urlToBeShortened, String shortenedUrl)
      : super(
      urlToBeShortened: urlToBeShortened,
      shortenedUrl: shortenedUrl,
      errorMessage: ""
  );
}
//
class ShortenedUrlSuccessState extends ShortenedUrlState {
  ShortenedUrlSuccessState(String urlToBeShortened, String shortenedUrl)
      : super(
    urlToBeShortened: urlToBeShortened,
    shortenedUrl: shortenedUrl,
    errorMessage: ""
  );
}
//
// class ShortenedUrlErrorState extends ShortenedUrlState {
//   ShortenedUrlErrorState(String urlToBeShortened, String shortenedUrl, String errorMessage)
//       : super(urlToBeShortened, shortenedUrl, errorMessage);
// }

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_url_shortener/repositories/short_url_repository.dart';
import 'package:meta/meta.dart';

part 'shortened_url__event.dart';

part 'shortened_url__state.dart';

class ShortenedUrlBloc extends Bloc<ShortenedUrlEvent, ShortenedUrlState> {
  final ShortUrlRepository _repository;

  ShortenedUrlBloc(this._repository)
      : super(
          ShortenedUrlState(
            urlToBeShortened: "",
            shortenedUrl: "",
            errorMessage: "",
            isLoading: false,
          ),
        );

  @override
  Stream<ShortenedUrlState> mapEventToState(
    ShortenedUrlEvent event,
  ) async* {
    if (event is UrlToBeShortenedChangedEvent) {
      yield state.copyWith(urlToBeShortened: event.urlToBeShortened);
    } else if (event is DialogDismissedEvent) {
      yield state.copyWith(errorMessage: "");
    } else if (event is FetchShortenedUrlEvent) {
      try {
        yield state.copyWith(isLoading: true);
        var response =
            await _repository.getShortenedUrl(state.urlToBeShortened);
        yield state.copyWith(
            urlToBeShortened: "", shortenedUrl: response.resultUrl);
      } catch (error) {
        yield state.copyWith(errorMessage: "Invalid url");
      } finally {
        yield state.copyWith(isLoading: false);
      }
    }
  }
}

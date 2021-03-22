import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_url_shortener/repositories/short_url_repository.dart';
import 'package:meta/meta.dart';

part 'shortened_url__event.dart';

part 'shortened_url__state.dart';

class ShortenedUrlBloc extends Bloc<ShortenedUrlEvent, ShortenedUrlState> {
  final ShortUrlRepository _repository;

  ShortenedUrlBloc(this._repository) : super(ShortenedUrlInitialState());

  @override
  Stream<ShortenedUrlState> mapEventToState(
    ShortenedUrlEvent event,
  ) async* {
    if (event is UrlToBeShortenedChangedEvent) {
      print('changed url to' + event.urlToBeShortened);
      yield state.copyWith(
        urlToBeShortened: event.urlToBeShortened
      );
    }
    if (event is FetchShortenedUrlEvent) {
      print(state.urlToBeShortened);
      try {
        yield ShortenedUrlLoadingState(state.urlToBeShortened, state.shortenedUrl);
        var response = await _repository.getShortenedUrl(state.urlToBeShortened);
        yield ShortenedUrlSuccessState(
            state.urlToBeShortened, response.resultUrl);
      } catch (error) {
        throw error;
        yield state.copyWith(
            errorMessage: error.toString()
        );
        // yield ShortenedUrlErrorState(
        //     state.urlToBeShortened, state.shortenedUrl, error.toString());
      }
    }
  }
}

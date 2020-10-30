part of 'search_youtube_bloc.dart';

@immutable
abstract class SearchYoutubeState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchYoutubeInitial extends SearchYoutubeState {}

class SearchingYoutube extends SearchYoutubeState {}

class SearchYoutubeFailed extends SearchYoutubeState {

  final String message;

  SearchYoutubeFailed(this.message);

  @override
  List<Object> get props => [message];
}

class SearchYoutubeComplete extends SearchYoutubeState {

  final SearchResult result;

  SearchYoutubeComplete(this.result);

  List<Object> get props => [result];
}
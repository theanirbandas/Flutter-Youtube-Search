part of 'search_youtube_bloc.dart';

@immutable
abstract class SearchYoutubeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadInitial extends SearchYoutubeEvent {}

class PerformSearch extends SearchYoutubeEvent {

  final String query;

  PerformSearch(this.query);

  @override
  List<Object> get props => [query];
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:youtube_search/model/search_item.dart';
import 'package:youtube_search/model/search_result.dart';
import 'package:youtube_search/network/network_client.dart';

part 'search_youtube_event.dart';
part 'search_youtube_state.dart';

class SearchYoutubeBloc extends Bloc<SearchYoutubeEvent, SearchYoutubeState> {
  SearchYoutubeBloc() : super(SearchYoutubeInitial());

  @override
  Stream<SearchYoutubeState> mapEventToState(SearchYoutubeEvent event) async* {
    if(event is PerformSearch)
      yield* _mapSearchEvent(event.query);
    else if(event is LoadInitial)
      yield SearchYoutubeInitial();
  }

  Stream<SearchYoutubeState> _mapSearchEvent(String query) async* {
    yield SearchingYoutube();

    try {
      Map<String, dynamic> data = await NetworkClient.provider.search(query);

      SearchResult result = SearchResult(
        etag: data['etag'],
        kind: data['kind'],
        nextPageToken: data['nextPageToken'],
        region: data['regionCode'],
        items: (data['items'] as List).map<SearchItem>((e) => SearchItem(
          id: e['id']['videoId'],
          title: e['snippet']['title'],
          description: e['snippet']['description'],
          channelTitle: e['snippet']['channelTitle'],
          publishedAt: e['snippet']['publishedAt'],
          thumbnail: e['snippet']['thumbnails']['medium']['url']
        )).toList()
      );

      yield SearchYoutubeComplete(result);
    } on Exception {
      yield SearchYoutubeFailed('Something went wrong');
    }
  }
}

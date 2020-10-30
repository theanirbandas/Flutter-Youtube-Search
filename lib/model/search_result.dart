import 'package:youtube_search/model/search_item.dart';

class SearchResult {
  
  final String kind;
  final String etag;
  final String nextPageToken;
  final String region;
  final List<SearchItem> items;
  
  SearchResult({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.region,
    this.items,
  });

}

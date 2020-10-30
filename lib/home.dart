import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_search/bloc/search_youtube_bloc.dart';
import 'package:youtube_search/model/search_result.dart';
import 'package:youtube_search/widget/initial.dart';
import 'package:youtube_search/widget/loading.dart';
import 'package:youtube_search/widget/video_item.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  SearchYoutubeBloc _bloc = SearchYoutubeBloc();

  @override
  void dispose() {
    super.dispose();

    _bloc.close();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0
          ),
          onChanged: (value) {
            if(value.trim().length > 3)
              _bloc.add(PerformSearch(value.trim()));
            else if(!(_bloc.state is SearchYoutubeInitial))
              _bloc.add(LoadInitial());
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.white),
            border: InputBorder.none,
            hintText: 'Type Here to Search Youtube...',
            hintStyle: TextStyle(
              color: Colors.white70
            )
          ),
        )
      ),
      body: BlocBuilder<SearchYoutubeBloc, SearchYoutubeState>(
        cubit: _bloc,
        builder: (context, state) {
          if(state is SearchYoutubeComplete) {
            return _resultView(state.result);
          }
          else if(state is SearchingYoutube) {
            return _loadingView();
          }
          else {
            return _initialView();
          }
        }
      )
    );
  }

  Widget _initialView() {
    return Center(child: Initial());
  }

  Widget _loadingView() {
    return ListView.builder(
      padding: const EdgeInsets.all(5.0),
      itemBuilder: (context, i) => Loading()
    );
  }

  Widget _resultView(SearchResult result) {
    return ListView.builder(
      padding: const EdgeInsets.all(5.0),
      itemCount: result.items.length,
      itemBuilder: (context, i) => VideoItem(result.items[i])
    );
  }
}
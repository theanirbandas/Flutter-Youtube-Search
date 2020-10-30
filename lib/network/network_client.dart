import 'dart:io';

import 'package:dio/dio.dart';

class NetworkClient {

  Dio _dio;
  static const String _baseUrl = 'https://www.googleapis.com/youtube/v3/';
  static const String _apiKey = 'AIzaSyCAZxbZbdsIY_1FUKOmS6py2eLUkWdTibE';

  NetworkClient._();

  static final NetworkClient provider = NetworkClient._();

  Future<Dio> get dio async {
		if(_dio != null) return _dio;

		BaseOptions options = await _getOptions();
		_dio = Dio(options);
		return _dio;
	}

  Future<BaseOptions> _getOptions() async {
		BaseOptions options = BaseOptions(
			baseUrl: _baseUrl,
			connectTimeout: 30000,			//30 Seconds
			receiveTimeout: 60000,			//60 Seconds
			contentType: 'application/json',
			followRedirects: false,
			headers: {
				'User-Agent': 'Flutter Youtube Search/TheAnirbanDas'
			}
		);

		return options;
	}

  Future<Map> search(String query) async {
    Dio http = await dio;

    Response response = await http.get('search', queryParameters: {
      'part': 'snippet',
      'key': _apiKey,
      'q': query,
      'maxResults': 25
    });

    if(response.statusCode == HttpStatus.ok) {
      return response.data;
    }
    else
      throw Exception('Something went wrong');
  }
}
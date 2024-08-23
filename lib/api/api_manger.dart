import 'dart:convert';

import 'package:flutter_app_news_c11_fri/api/api_constatnts.dart';
import 'package:flutter_app_news_c11_fri/model/NewsResponse.dart';
import 'package:flutter_app_news_c11_fri/model/SourceResponse.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@injectable
class ApiManager {
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=500c5a4f9b244f3db92a47f436f1819e
   */
  Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.sourcesApi,
        {'apiKey': ApiConstatnts.apiKey, 'category': categoryId});
    try {
      var response = await http.get(url);
      var responseBody = response.body;

      /// String
      var json = jsonDecode(responseBody);

      /// json
      return SourceResponse.fromJson(json);

      /// object
    } catch (e) {
      throw e;
    }
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=500c5a4f9b244f3db92a47f436f1819e
   */
   Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.newsApi,
        {'apiKey': ApiConstatnts.apiKey, 'sources': sourceId});
    var response = await http.get(url);
    try {
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}

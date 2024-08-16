import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_fri/api/api_manger.dart';
import 'package:flutter_app_news_c11_fri/model/NewsResponse.dart';

class NewsWidgetViewModel extends ChangeNotifier {
  //todo: hold data - handle logic
  List<News>? newsList;

  String? errorMessage;

  void getNews(String sourceId) async {
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        errorMessage = response!.message;
      } else {
        newsList = response!.articles;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}

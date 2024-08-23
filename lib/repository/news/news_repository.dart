import 'package:flutter_app_news_c11_fri/model/NewsResponse.dart';

abstract class NewsRepository {
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}

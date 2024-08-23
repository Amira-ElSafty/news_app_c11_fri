import 'package:flutter_app_news_c11_fri/api/api_manger.dart';
import 'package:flutter_app_news_c11_fri/model/NewsResponse.dart';
import 'package:flutter_app_news_c11_fri/repository/news/news_data_sources.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    var response = await apiManager.getNewsBySourceId(sourceId);
    return response;
  }
}

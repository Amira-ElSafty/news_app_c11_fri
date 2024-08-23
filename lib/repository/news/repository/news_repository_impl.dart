import 'package:flutter_app_news_c11_fri/model/NewsResponse.dart';
import 'package:flutter_app_news_c11_fri/repository/news/news_data_sources.dart';
import 'package:flutter_app_news_c11_fri/repository/news/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }
}

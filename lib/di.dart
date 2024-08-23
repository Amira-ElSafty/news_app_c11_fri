//todo: viewModel => object Repository
//todo: repository => object dataSource
//todo: dataSource => object ApiManager

import 'package:flutter_app_news_c11_fri/api/api_manger.dart';
import 'package:flutter_app_news_c11_fri/repository/news/dataSources/news_repository_data_source_impl.dart';
import 'package:flutter_app_news_c11_fri/repository/news/news_data_sources.dart';
import 'package:flutter_app_news_c11_fri/repository/news/news_repository.dart';
import 'package:flutter_app_news_c11_fri/repository/news/repository/news_repository_impl.dart';
import 'package:flutter_app_news_c11_fri/repository/sources/dataSources/source_remote_data_source_impl.dart';
import 'package:flutter_app_news_c11_fri/repository/sources/repository/source_repository_impl.dart';
import 'package:flutter_app_news_c11_fri/repository/sources/source_data_sources.dart';
import 'package:flutter_app_news_c11_fri/repository/sources/source_repository.dart';

SourceRepository injectSourceRepository() {
  return SourceRepositoryImpl(remoteDataSource: injectSourceRemoteDataSource());
}

SourceRemoteDataSource injectSourceRemoteDataSource() {
  return SourceRemoteDataSourceImpl(apiManager: injectApiManager());
}

ApiManager injectApiManager() {
  return ApiManager();
}

NewsRepository injectNewsRepository() {
  return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
}

NewsRemoteDataSource injectNewsRemoteDataSource() {
  return NewsRemoteDataSourceImpl(apiManager: injectApiManager());
}

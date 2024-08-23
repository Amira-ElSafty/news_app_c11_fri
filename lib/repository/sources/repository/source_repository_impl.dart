import 'package:flutter_app_news_c11_fri/model/SourceResponse.dart';
import 'package:flutter_app_news_c11_fri/repository/sources/source_data_sources.dart';
import 'package:flutter_app_news_c11_fri/repository/sources/source_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;

  SourceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) {
    return remoteDataSource.getSources(categoryId);
  }
}
